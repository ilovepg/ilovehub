package org.bamboo.ilovehub.mapper;

import org.bamboo.ilovehub.domain.BoardClassificationVO;

public interface BoardMapper {
	public void boardWrite();
	public BoardClassificationVO getBoardClassification(String classificationText);
}
