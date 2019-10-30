package org.bamboo.ilovehub.domain;

import lombok.Data;

//게시판 분류VO
@Data
public class BoardClassificationVO {
	int classificationCode;
	String classificationText;
	String desc;
}
