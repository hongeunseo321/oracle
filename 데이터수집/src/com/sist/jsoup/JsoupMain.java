package com.sist.jsoup;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class JsoupMain {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		String html="<himl><body>"
				+ "<div class=k>"
				+ "<div class=aaa>Java</div>"
				+ "<div id=bbb>Oracle</div>"
				+ "</div>"
				+ "<div class=m>"
				+ "<div class=aaa>JSP</div>"
				+ "<div id=bbb>HTML</div>"
				+ "</div>"
				+ "</body></html>";
		Document doc=Jsoup.parse(html);
		System.out.println(doc.toString());
		/*
		 * <div class=aaa>Java</div>
		 *  --- ---------
		 *  태그 태그의 구분자 => class(중복 가능) / id(중복 불가)
		 *  
		 *  class : 태그명.aaa 
		 *  id : 태그명#bbb
		 *  => 자바에서는 태그 : Element => 같은 태그 여러 개를 모아서 처리
		 */
		Elements div=doc.select("div");
		System.out.println(div);
		/*
		 * HTML은 데이터 저장
		 *  <img src="이미지주소"> => attr("src") => 이미지주소
		 *  <div>Hello</div> => text() => Hello
		 *  
		 *  => 태그를 포함해서 가져올 경우 => html()
		 *  => Javascript => data()
		 */
		for(int i=0;i<div.size();i++) // div 안에 있는 데이터 추출
		{
			System.out.println(div.get(i).text());
		}
		
		Element aaa=doc.selectFirst("div.m div.aaa");
		Element bbb=doc.selectFirst("div.m div#bbb");
		System.out.println(aaa);
		System.out.println(bbb);
		System.out.println(aaa.text());
		System.out.println(bbb.text());
	}

}
