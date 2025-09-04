package com.sist.vo;
import java.util.*;

import lombok.Data;
@Data
// 반드시 컬럼명과 일치해야 한다
// 문자열 변환 => 날짜, 숫자 => 오라클에 있는 데이터를 모아서 한 번에 브라우저에 전송 (DTO)
public class EmpVO {
	private int empno,sal,comm,deptno,mgr;
	private String ename,job;
	private Date hiredate;
	private DeptVO dvo=new DeptVO(); // JOIN => 포함 클래스
	private SalGradeVO svo=new SalGradeVO(); // JOIN => 포함 클래스
}
