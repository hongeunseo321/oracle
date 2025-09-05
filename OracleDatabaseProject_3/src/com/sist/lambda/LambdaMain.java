package com.sist.lambda;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
public class LambdaMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		LambdaMain la=new LambdaMain();
		la.lambdaDisplay1();
		System.out.println("=====================================");
		la.lambdaDisplay2();
		System.out.println("=====================================");
		la.lambdaDisplay3();
		System.out.println("=====================================");
		la.lambdaDisplay4();
		System.out.println("=====================================");
		la.lambdaDisplay5();
	}
	// 1. 급여가 3000 이상인 사원의 이름과 급여 출력
	// SELECT ename,sal FROM emp WHERE sal>=3000
	/*
	 * 함수형 인터페이스
	 * 	1) Predicate : 조건 검색
	 * 	2) Function : 컬럼 변환 / 매핑 
	 * 	3) Consumer : 저장 / 출력
	 *  4) Supplier : 데이터 수집 
	 */
	public void lambdaDisplay1()
	{
		EmpDAO dao=EmpDAO.newInstance();
		List<EmpVO> list=dao.empListData();
		
		list.stream()
			.filter(vo -> vo.getSal()>=3000) // WHERE 문장 (Predicate)
			.map(vo -> vo.getEname()+":"+vo.getSal()) // Function (Mapping)
			.forEach(System.out::println); // Consumer
		
		// filter => if(vo.getSal()>=3000) 
		// map => 출력 형식을 만든다
		// forEach => for()
		// 람다식을 많이 사용하면 => 가독성이 떨어진다 / 속도가 느려진다
		// stream => java => sql 연동
	}
	// SELECT empno,ename,job,hiredate,sal FROM emp
	public void lambdaDisplay2()
	{
		EmpDAO dao=EmpDAO.newInstance();
		List<EmpVO> list=dao.empListData();
		
		list.stream() // Consumer
			.forEach(vo -> System.out.println(
					vo.getEmpno()+" "
					+vo.getEname()+" "
					+vo.getHiredate()+" "
					+vo.getJob()+" "
					+vo.getSal()
			));
	}
	// SELECT * FROM emp WHERE ename LIKE 'A%', '%A', '%A%'
	public void lambdaDisplay3()
	{
		EmpDAO dao=EmpDAO.newInstance();
		List<EmpVO> list=dao.empListData();
		
		list.stream()
//			.filter(vo -> vo.getEname().startsWith("A"))
//			.filter(vo -> vo.getEname().endsWith("T"))
			.filter(vo -> vo.getEname().contains("B"))
			.forEach(vo -> System.out.println(
					vo.getEmpno()+" "
					+vo.getEname()+" "
					+vo.getHiredate()+" "
					+vo.getJob()+" "
					+vo.getSal()
					));
	}
	// SELECT * FROM emp ORDER BY hiredate ASC Limit 1
	public void lambdaDisplay4()
	{
		EmpDAO dao=EmpDAO.newInstance();
		List<EmpVO> list=dao.empListData();
		
		list.stream()
			.min(Comparator.comparing(EmpVO::getHiredate))
			.ifPresent(vo -> System.out.println(
					vo.getEname()+" "
					+vo.getHiredate()
			));
	}
	
	// 2. 전체 사원의 총 급여 ***
	public void lambdaDisplay5()
	{
		EmpDAO dao=EmpDAO.newInstance();
		List<EmpVO> list=dao.empListData();
		OptionalDouble total=list.stream() // Optional : null 값 처리 
				.mapToDouble(EmpVO::getSal)
//				.sum();
				.average();
		// sum / avg / max / min => 집계 함수
		System.out.println("총 급여:"+total);
	}
	/*
	 * Predicate => WHERE
	 * Function => SELECT 
	 * Consumer => INSERT
	 * Supplier => Values => 새로운 값 추가
	 * Collectors.groupingBY => GROUP BY
	 * min / max.sum / average => 집계 함수
	 */
}
