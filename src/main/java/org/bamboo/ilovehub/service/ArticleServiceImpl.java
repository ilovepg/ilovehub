package org.bamboo.ilovehub.service;

import java.util.HashMap;
import java.util.Map;

import org.bamboo.ilovehub.domain.BoardClassificationVO;
import org.bamboo.ilovehub.domain.BoardPrefaceVO;
import org.bamboo.ilovehub.domain.BoardVO;
import org.bamboo.ilovehub.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service //계층구조상 주로 비즈니스 영역을 담당하는 객체임을 표시한다.
public class ArticleServiceImpl implements ArticleService {
	@Setter(onMethod_ = @Autowired)
	BoardMapper boardMapper; //게시글 매퍼
	
	public Map<String,Object> boardWrite(BoardVO vo){
		Map<String,Object> result = new HashMap<String,Object>();
		return result;
	}

	@Override
	public BoardPrefaceVO getPreface(int boardClassificationCode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardClassificationVO getBoardClassification(String classificationText) {
		//예외처리 필요
		//↓↓↓임시예외처리↓↓↓
		try {
			BoardClassificationVO vo = boardMapper.getBoardClassification("free");
			log.info("getBoardClassification:"+vo.toString());
			return vo;
		}catch(Exception e) {
			//log.error(this.getClass().getName()+" error:"+e.getMessage());
			log.error(this.getClass().getSimpleName()+new Object(){}.getClass().getEnclosingMethod().getName()+" error:"+e.getMessage());
			return null;
		}
	}
}
