package org.bamboo.ilovehub.domain;

import lombok.Data;

@Data
public class BoardPrefaceVO {
	int code;
	String codeExplain;
	int order;
	
	public BoardPrefaceVO() {}
	
	public BoardPrefaceVO(int code) {
		this.code=code;
	}

	public BoardPrefaceVO(int code, String codeExplain, int order) {
		super();
		this.code = code;
		this.codeExplain = codeExplain;
		this.order = order;
	}
}
