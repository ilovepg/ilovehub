package org.bamboo.ilovehub.domain;

import lombok.Data;

//TagVO
@Data
public class TagVO {
	private Long tagId;
	private String tag;
	private Long tagging_cnt;
	
	public TagVO() {}
	/*client -> WAS로 전송될 때, tagId와 tagging_cnt가 아직 없으므로 
	 *이 생성자를 사용하여 객체생성
	 *DB -> WAS로 전송될 때는 이 생성자를 사용하지 않음.
	*/
	public TagVO(String tag) {
		this.tag=tag;
	}
}
