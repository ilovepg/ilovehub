package org.bamboo.ilovehub.controller;

import org.bamboo.ilovehub.service.FilesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class FilesController {
	@Setter(onMethod_ = @Autowired)
	private FilesService fileService;
	
	//게시글 파일 업로드[Ajax]
	@RequestMapping(value="/files", method=RequestMethod.POST, headers=("content-type=multipart/*"))
	public void fileUpload(@RequestParam("uploadFile") MultipartFile[] uploadFiles) {
		log.info("upload Files Controller");
		log.info(uploadFiles[0].getOriginalFilename());
		//fileService.uploadFiles(uploadFiles);
	}
}
