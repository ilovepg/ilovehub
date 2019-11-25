package org.bamboo.ilovehub.mapper;

import java.util.List;

import org.bamboo.ilovehub.domain.BoardVO;
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
public class PaingTest {
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Test
	public void pageStartTest() {
		Criteria cri = new Criteria(); //1,10
		cri.setPage(1);
		cri.setPerPageBoardNum(20);
		cri.setClassificationText("tech");
		List<BoardVO>list = mapper.getBoards(cri);
		log.info(list);
	}
}
