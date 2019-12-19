package org.bamboo.ilovehub.controller;

import java.util.List;
import java.util.Map;

import org.bamboo.ilovehub.domain.AttachFileVO;
import org.bamboo.ilovehub.domain.BoardVO;
import org.bamboo.ilovehub.domain.ContainInitWriteVO;
import org.bamboo.ilovehub.domain.Criteria;
import org.bamboo.ilovehub.domain.PageCreator;
import org.bamboo.ilovehub.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	@RequestMapping(value= "/{boardType}", method = RequestMethod.POST,
	consumes = MediaType.APPLICATION_JSON_VALUE,
	headers = "Accept=application/json;charset=utf-8;")
	@ResponseBody
	public Map<String,Object> boardWrite(@PathVariable String boardType,@RequestBody BoardVO vo) {
		log.info("boardType:"+boardType+", vo:"+vo.toString());
		return articleService.boardWrite(vo);
	}
	
	//게시글 리스트화면 [공지,기술,자유]
	@GetMapping("/{boardType}")
	public void showBoard(@PathVariable("boardType")String boardType, Model model, Criteria cri) {
		cri.setClassificationText(boardType); //게시글 분류정보[tech,noti 등등] 세팅 
		model.addAttribute("boardType",boardType);
		model.addAttribute("list",articleService.getBoards(cri));
		int total = articleService.getTotal(cri);
		model.addAttribute("pageMaker",new PageCreator(cri,total,10));
		log.info(model.asMap().get("pageMaker"));//log
	}
	
	//게시글 쓰기화면 [공지,기술,자유]
	@GetMapping("/{boardType}/new-form") 
	public ModelAndView boardWrite(@PathVariable("boardType")String boardType) {
		ModelAndView mv = new ModelAndView("/articles/write");
		ContainInitWriteVO vo = articleService.getWriteInit(boardType);
		mv.addObject("boardType",boardType);
		if(vo!=null) {
			mv.addObject("bcvo",vo.getBcvo());
			mv.addObject("bpvos",vo.getBpvos());
		}else {
			log.error(this.getClass().getSimpleName()+new Object(){}.getClass().getEnclosingMethod().getName()+"error: ContainInitWriteVO null");
			mv.addObject("bcvo",null);
			mv.addObject("bpvos",null);
		}
		log.info("/articles/"+boardType+"/write view");
		return mv;
	}
	
	//게시글 수정화면 [공지,기술,자유]
	@GetMapping("/{boardType}/change-form/{id}") 
	public ModelAndView boardChangeForm(@PathVariable("boardType")String boardType,@PathVariable("id")Long boardId,@ModelAttribute("cri")Criteria cri) {
		ModelAndView mv = new ModelAndView("/articles/modify");
		log.info("/articles/"+boardType+"/change-form");
		return mv;
	}
	
	//게시글 상세페이지(Detail)
	@GetMapping("/{boardType}/{id}")
	public ModelAndView boardDetail(@PathVariable("boardType")String boardType, @PathVariable("id")Long boardId, 
			@ModelAttribute("cri")Criteria cri) {
		ModelAndView mv = new ModelAndView("/articles/detail");
		log.info("detail페이지 정보:"+boardType+", "+boardId);
		mv.addObject("board", articleService.boardDetail(boardType,boardId));
		return mv;
	}
	
	//게시글 첨부파일 정보 가져오기
	@RequestMapping(value="/files/{id}",
		produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileVO>> getFilesInfo(@PathVariable("id")Long boardId) {
		log.info("Welcome getFilesInfo paramInfo:"+boardId);
		return new ResponseEntity<List<AttachFileVO>> (articleService.getFilesInfo(boardId),HttpStatus.OK);
	}
	
}
