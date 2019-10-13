package org.bamboo.ilovehub.service;

import java.util.Map;

import org.bamboo.ilovehub.domain.BoardVO;
import org.bamboo.ilovehub.domain.ContainInitWriteVO;

//각 계층간의 연결은 interface를 통하여 느슨한 결합(loose) 유지
public interface ArticleService {
	//글쓰기
	public Map<String,Object> boardWrite(BoardVO vo);
	//최초로 쓰기[write]에 접속하였을때 초기정보[머리말, 게시판분류코드] 가져오기
	public ContainInitWriteVO getWriteInit(String classificationText);
	
}
