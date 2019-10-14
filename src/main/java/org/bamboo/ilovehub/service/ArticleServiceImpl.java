package org.bamboo.ilovehub.service;

import java.util.HashMap;
import java.util.Map;

import org.bamboo.ilovehub.domain.BoardVO;
import org.bamboo.ilovehub.domain.ContainInitWriteVO;
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
		
		//TODO : 회원완료되면 writer에 회원 넣기 지금은 임시
		vo.setWriter("tester");
		
		try {
			int boardInsertResult=boardMapper.regArticle(vo);
			if(boardInsertResult==1) { //board테이블에 insert성공
				Long boardId=vo.getBoardId();
				log.info("boardId:"+boardId);
			}
		}catch(Exception e){
			log.error(this.getClass().getSimpleName()+new Object(){}.getClass().getEnclosingMethod().getName()+" error:"+e.getMessage());
		}
		return result;
	}

	@Override
	public ContainInitWriteVO getWriteInit(String classificationText) {
		//예외처리 필요
		//↓↓↓임시예외처리↓↓↓
		try {
			ContainInitWriteVO vo = boardMapper.getWriteInit(classificationText);
			log.info("getBoardClassification:"+vo.toString());
			//vo.getBpvos().forEach(authVO -> log.info("Bpvos:"+authVO));
			return vo;
		}catch(Exception e) {
			//log.error(this.getClass().getName()+" error:"+e.getMessage());
			log.error(this.getClass().getSimpleName()+new Object(){}.getClass().getEnclosingMethod().getName()+" error:"+e.getMessage());
			return null;
		}
	}
}
