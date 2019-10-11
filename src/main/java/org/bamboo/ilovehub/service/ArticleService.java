package org.bamboo.ilovehub.service;

import java.util.Map;

import org.bamboo.ilovehub.domain.BoardClassificationVO;
import org.bamboo.ilovehub.domain.BoardPrefaceVO;
import org.bamboo.ilovehub.domain.BoardVO;

//각 계층간의 연결은 interface를 통하여 느슨한 결합(loose) 유지
public interface ArticleService {
	//글쓰기
	public Map<String,Object> boardWrite(BoardVO vo);
	//머리말 정보가져오기
	public BoardPrefaceVO getPreface(int boardClassificationCode);
	//board_classification_code가져오기
	public BoardClassificationVO getBoardClassification(String classificationText);
}
