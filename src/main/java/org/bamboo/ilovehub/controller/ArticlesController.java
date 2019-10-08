package org.bamboo.ilovehub.controller;

import java.util.HashMap;
import java.util.Map;

import org.bamboo.ilovehub.domain.BoardVO;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/articles")
public class ArticlesController {
	
	@RequestMapping(value= "/{board}",method = RequestMethod.POST,
	consumes = MediaType.APPLICATION_JSON_VALUE,
	headers = "Accept=application/json")
	@ResponseBody
	public Map<String,Object> boardWrite(@PathVariable String board,@RequestBody BoardVO vo) {
		Map<String,Object> result = new HashMap<String,Object>();
		log.info("board:"+board);
		log.info("vo:"+vo.toString());
		
		result.put("result", "success");
		return result;
	}
	
	@GetMapping("/{board}")
	public void showBoard(@PathVariable("board")String board) {
		
	}
	
	@GetMapping("/{board}/write")
	public ModelAndView boardWrite(@PathVariable("board")String board) {
		ModelAndView mv = new ModelAndView("/articles/write");
		mv.addObject("board",board);
		log.info("/articles/"+board+"/write view");
		return mv;
	}
}
