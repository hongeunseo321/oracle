package com.sist.lamda;

public class 람다_2 /*implements Runnable*/{

//	public static void main(String[] args) {
//		// TODO Auto-generated method stub
//		람다_2 a=new 람다_2();
//		new Thread(a).start();
//	}
//
//	@Override
//	public void run() {
//		// TODO Auto-generated method stub
//		// Thread 구현
//		System.out.println("Thread 구동");
//	}
	
	public static void main(String[] args) {
		Runnable t=()->{
				System.out.println("Thread 구동");
			};
			t.run();
		
	}

}
