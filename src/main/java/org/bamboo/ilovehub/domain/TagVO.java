package org.bamboo.ilovehub.domain;

import lombok.Data;

@Data
public class TagVO {
	private Long tagId;
	private String tag;
	private Long tagging_cnt;
	
	public TagVO(String tag) {
		this.tag=tag;
	}
}
