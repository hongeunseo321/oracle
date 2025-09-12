package com.sist.dao;
import java.sql.*;
import java.util.*;

import com.sist.vo.BoardVO;
public class BoardDAO {
	private Connection conn; // 오라클 연결
	private PreparedStatement ps; // 송수신 => SQL 전송 => 결괏값을 메모리에 저장
	private static BoardDAO dao; // DAO 객체를 한 사람당 1개씩만 사용
	// 메모리 공간을 한 개만 생성 => 메모리 누수 현상을 방지 = 싱글턴
	private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	// 변경할 수 없다 ==> @localhost:ip / port:1521 / XE:데이터베이스(폴더)
	// se(XE) pe(ORCL) 
	private final int rowSize=10; // ?에 값 채우기, 총 페이지 변수 => 멤버변수
	
	// 1. 드라이버 등록
	public BoardDAO()
	{
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 리플렉션 : 클래스 이름, 변수, 메소드, 생성자 => 제어할 수 있게 만든 프로그램
			// MyBatis / Spring
			// oracle.jdbc.driver.OracleDriver = DriverManager
		}catch (Exception ex) {}
	}
	// 2. 싱글턴 => 반드시 static 사용 (메모리 공간을 한 개만 생성)
	/*
	 * 가비지 컬렉션 : 사용하지 않거나 null값인 상태에서 객체의 메모리 회수
	 * --------- 메모리가 커지게 되면서 역할을 하지 않는다 => 프로그램 종료 시 회수 
	 */
	public static BoardDAO newInstance()
	{
		if(dao==null)
			dao=new BoardDAO();
		return dao;
	}
	// 반복 제거 => 연결 / 해제
	/* 메소드는 한 개의 기능을 가지고 있다
	 *	반복 코딩, 재사용, 다른 클래스와 통신, 단락 나누기
	 */
	public void getConnection()
	{
		try
		{
			conn=DriverManager.getConnection(URL,"hr","happy");
		}catch(Exception ex) {}
	}
	public void disConnection()
	{
		try
		{
			if(ps!=null) ps.close();
			// OutputStream / BufferedReader
			if(conn!=null) conn.close();
			// conn => Socket
		}catch(Exception ex) {}
	}
	// --------------------------------------------------------- 공통 소스
	// 기능 (CRUD)
	// 1. 목록 : SELECT => 페이징
	public List<BoardVO> boardListData(int page)
	{
		List<BoardVO> list=new ArrayList<BoardVO>();
		try
		{
			// 1. 연결
			getConnection();
			// 2. 오라클 전송할 SQL 문장
			String sql="SELECT no,subject,name,TO_CHAR(regdate,'YYYY-MM-DD'),hit,num "
					+ "FROM (SELECT no,subject,name,regdate,hit,rownum as num "
					+ "FROM (SELECT no,subject,name,regdate,hit "
					+ "FROM board ORDER BY no DESC)) "
					+ "WHERE num BETWEEN ? AND ?";
			// 3. 오라클로 SQL 문장 전송
			ps=conn.prepareStatement(sql);
			// 4. ?에 값 채우기
			int start=(rowSize*page)-(rowSize-1); // 1~, 11~, 21~
			int end=rowSize*page; // ~10, ~20, ~30
			ps.setInt(1, start);
			ps.setInt(2, end);
			// 5. 결괏값 읽어오기
			ResultSet rs=ps.executeQuery();
			/*
			 * 페이징 기법
			 * 	1. 이전 / 다음
			 * 		=> 데이터가 적은 경우
			 * 
			 *  2. 블록별로 나눠서 처리
			 *  	< 1 2 3 4 5 6 7 8 9 10 >
			 *  	=> 데이터가 많은 경우
			 */
			// 6. list에 값 채우기
			while(rs.next())
			{
				BoardVO vo=new BoardVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setDbday(rs.getString(4));
				vo.setHit(rs.getInt(5));
				list.add(vo);
			}
			rs.close();
		}catch(Exception ex)
		{
			// 에러 확인
			ex.printStackTrace();
		}
		finally
		{
			// 닫기
			disConnection();
		}
		return list;
	}
	// 1-1. 총페이지
	// 61(X)     ==>  63 62 60
	// 63 => 62  ==>  62 61...
	public int boardRowCount()
	{
		int count=0;
		try
		{
			getConnection();
			String sql="SELECT COUNT(*) FROM board";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			count=rs.getInt(1);
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			disConnection();
		}
		return count;
	}
	// 2. 추가 : INSERT => SEQUENCE 사용
	public void boardInsert(BoardVO vo)
	{
		try
		{
			getConnection();
			String sql="INSERT INTO board(no,name,subject,content,pwd) "
					+ "VALUES(board_no_seq.nextval,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			ps.executeUpdate();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			disConnection();
		}
	}
	// 3. 상세보기 : SELECT => 조건
	public BoardVO boardDetailData(int no)
	{
		BoardVO vo=new BoardVO(); // 게시물 한 개에 대한 모든 정보
		try
		{
			getConnection();
			String sql="UPDATE board SET "
					+ "hit=hit+1 "
					+ "WHERE no=?"; // ip가 아닌 새로고침으로 조회수 증가
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.executeUpdate();
			
			// 데이터 읽기
			sql="SELECT no,name,subject,content,TO_CHAR(regdate,'YYYY-MM-DD'),hit "
					+ "FROM board "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setDbday(rs.getString(5));
			vo.setHit(rs.getInt(6));
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			disConnection();
		}
		return vo;
	}
	// 4. 수정 : UPDATE 
	public BoardVO boardUpdateData(int no)
	{
		BoardVO vo=new BoardVO(); // 게시물 한 개에 대한 모든 정보
		try
		{
			getConnection();
			String sql="SELECT no,name,subject,content "
					+ "FROM board "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			disConnection();
		}
		return vo;
	}
	// 4-1. 실제 수정
	public boolean boardUpdate(BoardVO vo)
	{
		boolean bCheck=false;
		try
		{
			getConnection();
			String sql="SELECT pwd FROM board WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vo.getNo());
			ResultSet rs=ps.executeQuery();
			rs.next();
			String db_pwd=rs.getString(1);
			rs.close();
			
			if(db_pwd.equals(vo.getPwd())) // 비밀번호가 같은 경우
			{
				bCheck=true;
				sql="UPDATE board SET "
						+ "name=?, subject=?, content=? "
						+ "WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, vo.getName());
				ps.setString(2, vo.getSubject());
				ps.setString(3, vo.getContent());
				ps.setInt(4, vo.getNo());
				ps.executeUpdate();
			}
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			disConnection();
		}
		return bCheck;
	}
	// 5. 삭제 : DELETE
	public boolean boardDelete(int no, String pwd)
	{
		boolean bCheck=false;
		try
		{
			getConnection();
			String sql="SELECT pwd FROM board WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			String db_pwd=rs.getString(1);
			rs.close();
			
			if(db_pwd.equals(pwd)) // 비밀번호가 같은 경우
			{
				bCheck=true;
				sql="DELETE FROM board WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, no);
				ps.executeUpdate();
			}
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			disConnection();
		}
		return bCheck;
	}
	// 6. 검색 : SELECT => LIKE / REGEXP_LIKE
}

