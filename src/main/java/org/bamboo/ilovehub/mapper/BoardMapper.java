package org.bamboo.ilovehub.mapper;

import org.bamboo.ilovehub.domain.BoardClassificationVO;
import org.bamboo.ilovehub.domain.ContainInitWriteVO;

public interface BoardMapper {
	public void boardWrite();
	public BoardClassificationVO getBoardClassification(String classificationText);
	//쓰기화면에 최초 진입[할때마다] 하였을때 해당게시글 분류코드, 머리말[리스트] 가져오기
	public ContainInitWriteVO getWriteInit(String classificationText);
}
