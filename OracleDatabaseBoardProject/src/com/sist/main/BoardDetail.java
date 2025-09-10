package com.sist.main;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
public class BoardDetail extends JPanel implements ActionListener{
	JLabel la1,la2,la3,la4,la5,la6;
	JLabel la_p1,la_p2,la_p3,la_p4,la_p5;
	JTextArea ta;
	JButton b1,b2,b3;
	BoardMainFrame bm;
	
	// 삭제
	JLabel la7;
	JPasswordField pf;
	JButton b4;
	JPanel pan=new JPanel();
	boolean bCheck=true; // 삭제 버튼 한 번 더 누르면 삭제창이 다시 사라지게
	
	public BoardDetail(BoardMainFrame bm)
	{
		this.bm=bm;
		la1=new JLabel("내용보기",JLabel.CENTER);
		la2=new JLabel("번호",JLabel.CENTER);
		la3=new JLabel("작성일",JLabel.CENTER);
		la4=new JLabel("이름",JLabel.CENTER);
		la5=new JLabel("조회수",JLabel.CENTER);
		la6=new JLabel("제목",JLabel.CENTER);
		la_p1=new JLabel("",JLabel.CENTER);
		la_p2=new JLabel("",JLabel.CENTER);
		la_p3=new JLabel("",JLabel.CENTER);
		la_p4=new JLabel("",JLabel.CENTER);
		la_p5=new JLabel("",JLabel.CENTER);
		ta=new JTextArea();
		JScrollPane js=new JScrollPane(ta);
		ta.setEnabled(false);
		b1=new JButton("수정");
		b2=new JButton("삭제");
		b3=new JButton("목록");
		
		la7=new JLabel("비밀번호",JLabel.CENTER);
		pf=new JPasswordField(7);
		b4=new JButton("삭제");
		pan.add(la7);pan.add(pf);pan.add(b4);
		
		// 배치
		setLayout(null);
		la1.setFont(new Font("맑은 고딕",Font.BOLD,40));
		la1.setBounds(5,15,610,50);
		add(la1);
		
		la2.setBounds(100,75,100,30);
		la_p1.setBounds(205,75,100,30);
		la3.setBounds(310,75,100,30);
		la_p2.setBounds(415,75,100,30);
		add(la2);add(la_p1);add(la3);add(la_p2);
		
		la4.setBounds(100,110,100,30);
		la_p3.setBounds(205,110,100,30);
		la5.setBounds(310,110,100,30);
		la_p4.setBounds(415,110,100,30);
		add(la4);add(la_p3);add(la5);add(la_p4);
		
		la6.setBounds(100,145,100,30);
		la_p5.setBounds(205,145,310,30);
		add(la6);add(la_p5);
		
		js.setBounds(100,180,415,150);
		add(js);
		
		JPanel p=new JPanel();
		p.add(b1);p.add(b2);p.add(b3);
		p.setBounds(300,340,240,35);
		add(p);
		
		pan.setBounds(295,380,240,35);
		add(pan);
		
		pan.setVisible(false);
		
		b1.addActionListener(this); // 수정
		b2.addActionListener(this); // 삭제
		b3.addActionListener(this); // 목록
		b4.addActionListener(this); // 삭제
		
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		if(e.getSource()==b2)
		{
			bCheck=!bCheck; // 누를 때마다 true / false 바뀌게
			if(bCheck==true)
			{
				b2.setText("취소");
				pf.setText("");
				pf.requestFocus();
				pan.setVisible(true);
			}
			else
			{
				b2.setText("삭제");
				pf.setText("");
				pan.setVisible(false);
			}
		}
	}
}
