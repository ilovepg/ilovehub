package org.bamboo.ilovehub.service;

import java.util.HashMap;
import java.util.Map;

import org.bamboo.ilovehub.domain.BoardVO;
import org.bamboo.ilovehub.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;

import lombok.Setter;

public class BoardServiceImpl implements BoardService {
	@Setter(onMethod_ = @Autowired)
	BoardMapper boardMapper; //게시글 매퍼
	
	public Map<String,Object> boardWrite(BoardVO vo){
		Map<String,Object> result = new HashMap<String,Object>();
		
		
		return result;
	}
}
