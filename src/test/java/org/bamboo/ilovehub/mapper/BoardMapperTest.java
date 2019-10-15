package org.bamboo.ilovehub.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.bamboo.ilovehub.domain.BoardClassificationVO;
import org.bamboo.ilovehub.domain.BoardPrefaceVO;
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
	
	@Test
	public void test() {
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
}
