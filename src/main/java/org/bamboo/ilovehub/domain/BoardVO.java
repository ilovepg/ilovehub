package org.bamboo.ilovehub.domain;

import java.util.ArrayList;

import lombok.Data;

@Data
public class BoardVO {
	private Long board_id; //게시글 고유번호
	private int preface; //머리말
	private int classification_code; //게시판 분류코드
	private String title; //제목
	private String contents;//내용
	private String writer;//글쓴이
	private String reg_date;//등록일자
	private int views;//조회수
	private int recommendations;//추천수
	private char is_public;//공개,비공개 여부
	private char permit_reply;//댓글허용 여부
	private ArrayList<String> tags; //tag
}
