package org.bamboo.ilovehub.domain;

import lombok.Data;

/**
 * 페이징처리를 도와줄 클래스
 * 파라미터가 여러 개로 늘어난다면 관리하기 더 불편하므로 아예 클래스로 만들어서 객체로 처리하는 것이 더 바람직하다.
 * 
 * 페이징 처리를 파라미터가 아니라 클래스로 하면 편한 이유
 * Mybatis의 SQL Mapper의 공통적인 규칙 중 하나 #{page}와 같은 파라미터를 사용하면 내부적으로 getPage()메소드를 호출한다는 점
 * 
 * Criteria 사전적 의미 : 검색기준, 분류기준
 * */
@Data
public class Criteria {
	private int page; //페이지 번호
	private int perPageBoardNum;//페이지 당 게시글 수
	private String classificationText;//[공지,기술,자유]
	
	
	public Criteria(int page, int perPageNum) {
		if(page<1) page=1;
		if(perPageNum>30) perPageNum=30; //페이지 당 게시글 수가 무한정으로 커지는 것을 막기위해 30으로 제한을 해둠.
		this.page = page;
		this.perPageBoardNum = perPageNum;
	}
	
	public Criteria() {
		this.page=1;
		this.perPageBoardNum=10;
	}
	
	/* method for Mybatis SQL Mapper -> #{pageStart}로 쓰면 내부적으로 getPageStart를 호출하기 떄문
	 * 산술식 : 시작 데이터 번호 = (페이지 번호-1) * 페이지 당 보여지는 개수
	 * 의   미 : 현재 페이지에서 몇번 게시글부터 몇번 게시글까지 가지고 올지 정하는 메소드.
	 */
	public int getPageStart() {
		return (page-1)*perPageBoardNum;
	}
	
}
