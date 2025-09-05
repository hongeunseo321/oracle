package com.sist.lambda;
// 함수형 인터페이스_사용자 정의 인터페이스
import java.util.*;
/*
 * function aaa(){
 * }
 * 
 * let aaa=()->{
 * 
 * }
 * 함수 / 메소드 => 변수형
 */
@FunctionalInterface
interface MyCalc
{
	int calc(int a, int b); // 반드시 메소드가 한 개만 선언
}
/*
 * Runnable => run()
 * ActionListener => actionPerformed()
 * 
 * 람다식은 DB에서 가지고 오는 데이터를 단순하게 제어할 때 용이하다
 * 	=> 코드가 간결해진다
 *  => Stream 지원 => Collection을 제어하기 편하다
 *  => 가독성이 떨어진다
 *  => 복잡한 로직에는 사용 금지
 *  
 *  전체 사원 출력
 *  급여가 2000 이상
 *  부서별 평균
 *  직위별 최고 급여
 *  가장 높은 급여
 *  -------------- SQL
 *  조건 : filter(vo -> vo.getSal()>=2000)
 *  출력 형식 : map(EmpVO::getEname)
 *  여러 개 출력 : forEach
 *  정렬 : sorted(EmpVO::getSal)
 */
public class LambdaMain2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 * public int calc(int a, int b)
		 * --------------- 생략
		 * {                |
		 * 	  return a+b;   |
		 * 	  ------ 생략 ===> ->
		 * }
		 */
		MyCalc plus=(a,b) -> a+b;
		MyCalc minus=(a,b) -> a-b;
		MyCalc gop=(a,b) -> a*b;
		MyCalc div=(a,b) -> a/b;
		
		System.out.println(plus.calc(10, 3));
		System.out.println(minus.calc(10, 3));
		System.out.println(gop.calc(10, 3));
		System.out.println(div.calc(10, 3));
	}

}
