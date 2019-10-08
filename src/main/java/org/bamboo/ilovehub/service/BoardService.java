package org.bamboo.ilovehub.service;

import java.util.Map;

import org.bamboo.ilovehub.domain.BoardVO;

//각 계층간의 연결은 interface를 통하여 느슨한 결합(loose) 유지
public interface BoardService {
	//글쓰기
	public Map<String,Object> boardWrite(BoardVO vo);
	
	
}
