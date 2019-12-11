package org.bamboo.ilovehub.domain;

import lombok.Getter;
import lombok.ToString;

/*
 * 페이징 계산을 위한 cri(시작페이지, 페이지당 게시글 수, 검색관련 변수들을 가지고있는 클래스)를 가지고 있으며
 * 객체가 생성될 떄 삽입된 cri를 기반으로 페이징을 계산한다.
 * */
@Getter
@ToString
public class PageCreator {
	private int startPage; //시작페이지
	private int endPage; //끝 페이지
	private boolean prev,next;//이전, 다음 표시 여부
	private int realEndPage;//맨 끝으로 가기를 누르면 이 페이지로 이동되기 위함
	private int total; //전체 게시글 수
	private Criteria cri;
	private int perPagePageNum; //페이지 당 페이지 수(한번에 보여질 페이지 수)
	
	//생성될 때 페이징 계산
	public PageCreator(Criteria cri, int total, int perPagePageNum) {
		this.cri=cri; //페이지 계산을 위한 클래스
		this.total=total;//전체 게시글 수
		this.perPagePageNum=perPagePageNum;
		this.endPage=(int)Math.ceil(cri.getPage()/(double)perPagePageNum)*perPagePageNum;
		this.startPage=endPage-(perPagePageNum-1);
		
		this.realEndPage = (int)(Math.ceil(total/(double)perPagePageNum));
		//System.out.println("이해불가:"+Math.ceil(total/(double)perPagePageNum)+", total:"+total+", perPagePageNum:"+perPagePageNum);
		if(realEndPage<endPage) {
			this.endPage=realEndPage;
		}
		
		//prev,next계산
		prev=startPage==1?false:true;
		next=endPage<realEndPage?true:false;
	}
}
