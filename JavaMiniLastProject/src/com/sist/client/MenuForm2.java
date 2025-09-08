package com.sist.client;

import java.awt.GridLayout;

import javax.swing.JButton;
import javax.swing.JPanel;

public class MenuForm2 extends JPanel{
	JButton b5=new JButton("Home");
	JButton b6=new JButton("로그인");
	JButton b7=new JButton("로그아웃");
	JButton b8=new JButton("마이 페이지");
	
	public MenuForm2()
	{
		setLayout(new GridLayout(1,4,5,5));
		add(b5);add(b6);add(b7);
		add(b8);
	}
	
}
