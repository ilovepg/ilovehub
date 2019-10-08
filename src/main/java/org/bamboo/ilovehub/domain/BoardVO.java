package org.bamboo.ilovehub.domain;

import java.util.ArrayList;

import lombok.Data;

@Data
public class BoardVO {
	private Long board_id;
	private int preface; 
	private int classification_code; //요거 어찌할껴?
	private String title;
	private String contents;
	private String writer;
	private String reg_date;
	private int views;
	private int recommendations;
	private char is_public;
	private char permit_reply;
	private ArrayList<String> tag;
}
