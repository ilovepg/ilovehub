package org.bamboo.ilovehub.domain;

import lombok.Data;

//머리말VO
@Data
public class BoardPrefaceVO {
	int code;
	String codeExplain;
	int order;
	
	public BoardPrefaceVO() {}
	
	/*client -> WAS로 전송될 때, code만 전송되므로 
	 *이 생성자를 사용하여 객체생성
	*/
	public BoardPrefaceVO(int code) {
		this.code=code;
	}

	
}
