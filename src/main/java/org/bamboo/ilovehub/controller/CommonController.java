package org.bamboo.ilovehub.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CommonController {
	//Main페이지 컨트롤러
	@GetMapping("/main")
	public void main() {
		log.info("main");
	}
	
	
	
	
}
