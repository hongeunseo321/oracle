package com.sist.vo;

import lombok.Data;

@Data
public class StudentVO {
	private int hakbun;
	private String name;
	private int kor,eng,math;
	private int total;
	private double avg;
	// @Data 삽입이 안될 시, Source => Getters/Setters 생성 => Select All
}
