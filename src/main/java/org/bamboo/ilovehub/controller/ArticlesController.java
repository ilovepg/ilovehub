package org.bamboo.ilovehub.controller;

import java.util.Map;

import org.bamboo.ilovehub.domain.BoardVO;
import org.bamboo.ilovehub.domain.ContainInitWriteVO;
import org.bamboo.ilovehub.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/articles")
public class ArticlesController {
	@Setter(onMethod_ = @Autowired)
	private ArticleService articleService;
	
	//게시글 쓰기 백엔드 [공지,기술,자유]
	@RequestMapping(value= "/{board}", method = RequestMethod.POST,
	consumes = MediaType.APPLICATION_JSON_VALUE,
	headers = "Accept=application/json;charset=utf-8;")
	@ResponseBody
	public Map<String,Object> boardWrite(@PathVariable String board,@RequestBody BoardVO vo) {
		log.info("board:"+board+", vo:"+vo.toString());
		return articleService.boardWrite(vo);
	}
	
	//게시글 리스트화면 [공지,기술,자유]
	@GetMapping("/{board}")
	public void showBoard(@PathVariable("board")String board, Model model) {
		model.addAttribute("board",board);
		model.addAttribute("list",articleService.getBoards(board));
	}
	
	//게시글 쓰기화면 [공지,기술,자유]
	@GetMapping("/{board}/new-form") 
	public ModelAndView boardWrite(@PathVariable("board")String board) {
		ModelAndView mv = new ModelAndView("/articles/write");
		ContainInitWriteVO vo = articleService.getWriteInit(board);
		mv.addObject("board",board);
		if(vo!=null) {
			mv.addObject("bcvo",vo.getBcvo());
			mv.addObject("bpvos",vo.getBpvos());
		}else {
			log.error(this.getClass().getSimpleName()+new Object(){}.getClass().getEnclosingMethod().getName()+"error: ContainInitWriteVO null");
			mv.addObject("bcvo",null);
			mv.addObject("bpvos",null);
		}
		log.info("/articles/"+board+"/write view");
		return mv;
	}
	
}
