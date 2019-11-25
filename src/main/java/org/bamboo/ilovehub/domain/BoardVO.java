package org.bamboo.ilovehub.domain;

import java.util.ArrayList;

import lombok.Data;

//게시글VO
@Data
public class BoardVO {
	private Long boardId; //게시글 고유번호
	private int classificationCode; //게시판 분류코드
	private String title; //제목
	private String contents;//내용
	private String writer;//글쓴이
	private String regDate;//등록일자
	private int views;//조회수
	private int recommendations;//추천수
	private char isPublic;//공개,비공개 여부
	private char permitReply;//댓글허용 여부
	private ArrayList<TagVO> tags; //tag
	private BoardPrefaceVO preface;//머리말
	private ArrayList<AttachFileVO> attachFiles; //첨부파일
}
