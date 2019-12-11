package org.bamboo.ilovehub.service;

import java.util.List;
import java.util.Map;

import org.bamboo.ilovehub.domain.AttachFileVO;
import org.bamboo.ilovehub.domain.BoardVO;
import org.bamboo.ilovehub.domain.ContainInitWriteVO;
import org.bamboo.ilovehub.domain.Criteria;

//각 계층간의 연결은 interface를 통하여 느슨한 결합(loose) 유지
public interface ArticleService {
	//게시글 리스트 가져오기 [공지,기술,자유]
	public List<BoardVO> getBoards(Criteria cri);
	//게시글 총 갯수 가져오기-페이징을 위함
	public int getTotal(Criteria cri);
	//게시글 파일 정보 가져오기
	public List<AttachFileVO>getFilesInfo(Long boardId);
	//글쓰기[공지,기술,자유]
	public Map<String,Object> boardWrite(BoardVO vo);
	//최초로 쓰기[write]에 접속하였을때 초기정보[머리말, 게시판분류코드] 가져오기
	public ContainInitWriteVO getWriteInit(String classificationText);
	//게시글 상세페이지
	public BoardVO boardDetail(String boardType,Long boardId);
}
