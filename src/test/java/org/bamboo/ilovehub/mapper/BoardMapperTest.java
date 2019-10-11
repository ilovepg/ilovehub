package org.bamboo.ilovehub.mapper;

import org.bamboo.ilovehub.domain.BoardClassificationVO;
import org.bamboo.ilovehub.domain.ContainInitWriteVO;
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
	public void getBoardClassification() {
		BoardClassificationVO vo=mapper.getBoardClassification("tech");
		log.info(vo.toString());
	}
	
	@Test
	public void test() {
		ContainInitWriteVO vo = mapper.getWriteInit("tech");
		log.info(vo.toString());
	}
}
