package com.sist.main;
import java.util.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
public class BoardMainFrame extends JFrame{
	CardLayout card=new CardLayout();
	BoardList bList;
	public BoardMainFrame()
	{
		bList=new BoardList(this);
		setLayout(card);
		add("list",bList);
		setSize(640,570);
		setVisible(true);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new BoardMainFrame();
	}

}
