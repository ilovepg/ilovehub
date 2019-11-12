package org.bamboo.ilovehub.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	private int startPage; //시작페이지
	private int endPage; //끝 페이지
	private boolean prev,next;//이전, 다음 표시 여부
	private boolean toBegin, toFinal; //맨 처음, 맨 끝 표시 여부
	private int total; //전체 게시물 수
	private Criteria cri;
	
	public PageDTO(Criteria cri, int total) {
		
	}
}
