package org.bamboo.ilovehub.domain;

import lombok.Data;

/**
 * 페이징처리+검색기능을 도와줄 클래스
 * 파라미터가 여러 개로 늘어난다면 관리하기 더 불편하므로 아예 클래스로 만들어서 객체로 처리하는 것이 더 바람직하다.
 * 
 * 페이징 처리를 파라미터가 아니라 클래스로 하면 편한 이유
 * Mybatis의 SQL Mapper의 공통적인 규칙 중 하나 #{page}와 같은 파라미터를 사용하면 내부적으로 getPage()메소드를 호출한다는 점
 * 
 * Criteria 사전적 의미 : 검색기준, 분류기준
 * 
 * Criteria에 검색기능에 필요한 기능을 추가할 수도있겠지만 여기에서는 기존 코드와 좀 더 구분해주고자 별도의 클래스를 사용해보았다.
 * */

@Data
public class SearchCriteria extends Criteria{
	private String searchType;
	private String keyword;
	

}
