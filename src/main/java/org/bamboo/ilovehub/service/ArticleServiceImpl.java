package org.bamboo.ilovehub.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.bamboo.ilovehub.domain.AttachFileVO;
import org.bamboo.ilovehub.domain.BoardVO;
import org.bamboo.ilovehub.domain.ContainInitWriteVO;
import org.bamboo.ilovehub.domain.Criteria;
import org.bamboo.ilovehub.domain.TagVO;
import org.bamboo.ilovehub.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service //계층구조상 주로 비즈니스 영역을 담당하는 객체임을 표시한다.
public class ArticleServiceImpl implements ArticleService {
	@Setter(onMethod_ = @Autowired)
	BoardMapper boardMapper; //게시글 매퍼
	
	//글쓰기[공지,기술,자유]
	@Transactional
	public Map<String,Object> boardWrite(BoardVO vo){
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("result", "fail");
		//TODO : 회원완료되면 writer에 회원 넣기 지금은 임시
		vo.setWriter("tester");
		
		//필수예외처리
		boolean exceptionResult=essentialException(vo.getPreface().getCode(), vo.getClassificationCode(), 
				vo.getTitle(), vo.getContents(),result);
		if(!exceptionResult) return result;
		
		try {
			int boardInsertResult=insertBoardBasic(vo);
			if(boardInsertResult>0){ //board테이블에 insert성공
				Long boardId=vo.getBoardId();
				insertBoardTags(vo.getTags(),boardId);
				insertBoardFile(vo.getAttachFiles(), boardId);
			}
			result.put("result", "success");
		}catch(Exception e){
			result.put("message", e.getMessage());
			result.put("errorCode", "500");
			log.error(this.getClass().getSimpleName()+" "+new Object(){}.getClass().getEnclosingMethod().getName()+" error:"+e.getMessage());
			throw new RuntimeException(e);
		}
		return result;
	}
	//Board 테이블에 게시글 기본정보 저장
	public int insertBoardBasic(BoardVO vo) {
		int boardInsertResult=boardMapper.regArticle(vo);
		log.info("boardId:"+vo.getBoardId());
		return boardInsertResult;
	}
	//Board_Tag 테이블에 태그정보 저장, 이미 있는 태그일 경우 tagging_cnt컬럼 +1
	private void insertBoardTags(List<TagVO> tags, Long boardId) {
		//TODO : private로 바꿔보기
		for(TagVO item:tags) {
			int tagInsertResult=boardMapper.regTag(item);
			//int tagInsertResult=boardMapper.regTag(null); //Transaction Test를 위함
			log.info("tagInsertResult:"+tagInsertResult);
			if(tagInsertResult>0) {
				insertBoardTagMapping(boardId, item.getTagId());
			}
		}
	}
	//Board_Tag_Map 테이블에 board_id와 tag_id 맵핑
	private void insertBoardTagMapping(Long boardId, Long tagId) {
		//TODO : private로 바꿔보기
		boardMapper.regBoardTagMap(tagId,boardId);
	}
	//File정보 DB삽입
	private void insertBoardFile(ArrayList<AttachFileVO> attachFiles, Long boardId){
		attachFiles.forEach(attachFile->{
			attachFile.setBoardId(boardId);
			boardMapper.regFile(attachFile);
		});
	}
	
	//최초로 쓰기[write]에 접속하였을때 초기정보[머리말, 게시판분류코드] 가져오기
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
			log.error(this.getClass().getSimpleName()+" "+new Object(){}.getClass().getEnclosingMethod().getName()+" error:"+e.getMessage());
			return null;
		}
	}
	
	//게시글 리스트 가져오기 [공지,기술,자유]
	@Override
	public List<BoardVO> getBoards(Criteria cri) {
		log.info("getBoardList Without Paging:"+cri.getClassificationText());
		List<BoardVO>boards=boardMapper.getBoards(cri);
		log.info(boards.toString());
		return boards;
	}
	//게시글 총 개수 가져오기[페이징을 위함]
	public int getTotal(String classificationText) {
		return boardMapper.getTotal(classificationText);
	}
	
	//게시글 상세페이지
	public BoardVO boardDetail(String boardType,Long boardId) {
		HashMap<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("boardType", boardType);
		paramMap.put("boardId", boardId);
		BoardVO vo=boardMapper.getBoardDetail(paramMap);
		log.info("boardDetail:"+vo);
		return null;
	}
	
	//필수예외처리[DB에서 not null인것들 예외처리 완료]
	//TODO : 추후 회원가입과 로그인이 구현되면 writer도 예외처리해줘야하고, 세션을 검사하여 현재 세션이 연결된 회원만 글을 쓸 수 있도록 해야한다.(notepad++참고) 
	private boolean essentialException(int preface, int classificationCode, 
			String title, String contents,Map<String,Object> result) {
		if(preface==0) {
			log.error("==================================================================");
			log.error("boardWrite critical error!!! preface is zero(0)");
			log.error("==================================================================");
			result.put("message", "preface is zero(0)");
			result.put("errorCode", "100");
			return false;
		}
		
		if(classificationCode==0) {
			log.error("===================================================================");
			log.error("boardWrite critical error!!! classificationCode is zero(0)");
			log.error("===================================================================");
			result.put("message", "classificationCode is zero(0)");
			result.put("errorCode", "200");
			return false;
		}
		
		if(title.equals("") || title==null) {
			log.error("========================================================");
			log.error("boardWrite critical error!!! title is empty");
			log.error("========================================================");
			result.put("message", "title is empty");
			result.put("errorCode", "300");
			return false;
		}
		
		if(contents.equals("") || contents==null) {
			log.error("========================================================");
			log.error("boardWrite critical error!!! contents is empty");
			log.error("========================================================");
			result.put("message", "contents is empty");
			result.put("errorCode", "400");
			return false;
		}
		return true;
	}
}
