package org.bamboo.ilovehub.domain;

import java.util.List;

import lombok.Data;

//BoardClassificationVO + BoardPrefaceVO입니다.
//JOIN을 이용한 resultMap으로 사용하기위함.
@Data
public class ContainInitWriteVO {
	private BoardClassificationVO bcvo;
	private List<BoardPrefaceVO> bpvos;
}
