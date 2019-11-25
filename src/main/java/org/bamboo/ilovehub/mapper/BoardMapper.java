package org.bamboo.ilovehub.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.bamboo.ilovehub.domain.AttachFileVO;
import org.bamboo.ilovehub.domain.BoardVO;
import org.bamboo.ilovehub.domain.ContainInitWriteVO;
import org.bamboo.ilovehub.domain.Criteria;
import org.bamboo.ilovehub.domain.TagVO;

public interface BoardMapper {
	//게시글 조회 with paging
	public List<BoardVO>getBoards(Criteria cri);
	//총 게시글 수 가져오기
	public int getTotal(String classificationText);
	//쓰기화면에 최초 진입[할때마다] 하였을때 해당게시글 분류코드, 머리말[리스트] 가져오기
	public ContainInitWriteVO getWriteInit(String classificationText);
	//게시글 정보 저장 to Board Tbl
	public int regArticle(@Param("boardVO")BoardVO boardVO);
	//태그 정보 저장 to BoardTag
	public int regTag(TagVO tagVO);
	//태그-게시글 매핑 테이블 저장 to Board_Tag_Map
	public int regBoardTagMap(@Param("tagId")Long tagId, @Param("boardId")Long boardId);
	//첨부파일 저장
	public void regFile(AttachFileVO attachFileVO);
	//첨부파일 삭제
	public void deleteFile(String uuid);
}	
