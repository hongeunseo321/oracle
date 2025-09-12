package com.sist.dao;
import java.util.*;

import com.sist.vo.FoodVO;

import java.sql.*;
public class FoodDAO {
	private Connection conn; // 오라클 연결
	private PreparedStatement ps; // 송수신 => SQL 전송 => 결괏값을 메모리에 저장
	private static FoodDAO dao; // DAO 객체를 한 사람당 1개씩만 사용
	// 메모리 공간을 한 개만 생성 => 메모리 누수 현상을 방지 = 싱글턴
	private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	// 변경할 수 없다 ==> @localhost:ip / port:1521 / XE:데이터베이스(폴더)
	// se(XE) pe(ORCL) 
	private final int rowSize=10; // ?에 값 채우기, 총 페이지 변수 => 멤버변수
	
	// 1. 드라이버 등록
	public FoodDAO()
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
	public static FoodDAO newInstance()
	{
		if(dao==null)
			dao=new FoodDAO();
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
	/*
		FNO     NOT NULL NUMBER        
		NAME    NOT NULL VARCHAR2(200) 
		TYPE    NOT NULL VARCHAR2(100) 
		PHONE            VARCHAR2(20)  
		ADDRESS NOT NULL VARCHAR2(500) 
		SCORE            NUMBER(2,1)   
		THEME            CLOB          
		PRICE            VARCHAR2(50)  
		TIME             VARCHAR2(100) 
		PARKING          VARCHAR2(100) 
		POSTER  NOT NULL VARCHAR2(260) 
		IMAGES           CLOB          
		CONTENT          CLOB          
		HIT              NUMBER  
	 */
	public void foodInsert(FoodVO vo)
	{
		try
		{
			getConnection();
			String sql="INSERT INTO menupan_food VALUES("
					+ "mf_fno_seq.nextval,?,?,?,?,?,?,"
					+ "?,?,?,?,?,?,0)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getType());
			ps.setString(3, vo.getPhone());
			ps.setString(4, vo.getAddress());
			ps.setDouble(5, vo.getScore());
			ps.setString(6, vo.getTheme());
			ps.setString(7, vo.getPrice());
			ps.setString(8, vo.getTime());
			ps.setString(9, vo.getParking());
			ps.setString(10, vo.getPoster());
			ps.setString(11, vo.getImages());
			ps.setString(12, vo.getContent());
			
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
}
