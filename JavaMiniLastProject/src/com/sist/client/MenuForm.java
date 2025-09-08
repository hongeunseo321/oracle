package com.sist.client;
import javax.swing.*;
import java.awt.*;

public class MenuForm extends JPanel{
	JButton b1=new JButton("검색");
	JButton b2=new JButton("공지사항");
	JButton b3=new JButton("Contact US");
	JButton b4=new JButton("실시간 채팅");
	
	public MenuForm()
	{
		setLayout(new GridLayout(1,4,5,5));
		add(b1);add(b2);add(b3);
		add(b4);
	}
	
}