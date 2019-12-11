package org.bamboo.ilovehub.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.bamboo.ilovehub.domain.BoardPrefaceVO;
import org.bamboo.ilovehub.domain.BoardVO;
import org.bamboo.ilovehub.domain.ContainInitWriteVO;
import org.bamboo.ilovehub.domain.Criteria;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTest {
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	//@Test
	public void test_write화면맨처음진입시() {
		ContainInitWriteVO vo = mapper.getWriteInit("tech");
		//HashMap vo = mapper.getWriteInit("tech");
		log.info(vo.toString());
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> map = new HashMap<String,Object>();
		//vo.getBpvos().forEach(authVO -> log.info("Bpvos:"+authVO));
		for(BoardPrefaceVO item : vo.getBpvos()) {
			map.put("code", item.getCode());
			map.put("codeExplain", item.getCodeExplain());
			list.add(map);
			map = new HashMap<String,Object>();
		}
		log.info(list.toString());
	}
	
//	@Test
	public void regArticleTest_글쓰기테스트() {
		BoardVO vo = new BoardVO();
		vo.setClassificationCode(2);
		//vo.setPreface(new BoardPrefaceVO(2));
		vo.setTitle("Test");
		vo.setContents("Test입니다!!");
		vo.setWriter("Tester");
		vo.setIsPublic('Y');
		vo.setPermitReply('Y');
	  	mapper.regArticle(vo);
			
	}
	
	@Test
	public void 검색테스트() {
		Criteria cri = new Criteria();
		cri.setKeyword("tester");
		cri.setSearchType("TC");
		cri.setClassificationText("tech");
		List<BoardVO>list = mapper.getBoards(cri);
		list.forEach(board -> log.info(board));
	}
}
