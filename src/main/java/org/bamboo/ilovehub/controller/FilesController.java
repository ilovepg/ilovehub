package org.bamboo.ilovehub.controller;

import org.bamboo.ilovehub.domain.AttachFileVO;
import org.bamboo.ilovehub.service.FilesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class FilesController {
	@Setter(onMethod_ = @Autowired)
	private FilesService fileService;
	
	//게시글 파일 업로드[Ajax]
	@RequestMapping(value="/files", method=RequestMethod.POST, 
			headers=("content-type=multipart/*"),
			produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<AttachFileVO> fileUpload(@RequestParam("uploadFile") MultipartFile uploadFile) {
		log.info("upload Files Controller");
		return fileService.uploadFile(uploadFile);
	}
}
