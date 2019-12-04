package org.bamboo.ilovehub.controller;

import org.bamboo.ilovehub.domain.AttachFileVO;
import org.bamboo.ilovehub.service.FilesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
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
	
	//첨부파일 업로드[Ajax]
	@RequestMapping(value="/files", method=RequestMethod.POST, 
			headers=("content-type=multipart/*"),
			produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<AttachFileVO> uploadFile(@RequestParam("uploadFile") MultipartFile uploadFile) {
		log.info("upload Files Controller");
		return fileService.uploadFile(uploadFile);
	}
	
	//첨부파일 삭제
	@RequestMapping(value="/files", method=RequestMethod.DELETE,
			headers = "Accept=application/json;charset=utf-8;")
	public ResponseEntity<String> deleteFile(@RequestBody AttachFileVO attachFileVO) {
		log.info("fileDelete vo :"+attachFileVO);
		return fileService.deleteFile(attachFileVO);
	}
	
	//첨부파일 썸네일 또는 원본 전송
	@RequestMapping(value={"/thumbnail", "/orginal"}, method=RequestMethod.GET)
	public ResponseEntity<byte[]> display(String fileCallPath){
		log.info("welcome! display paramInfo:"+fileCallPath);
		return fileService.display(fileCallPath);
	}
	
	//첨부파일 다운로드
	@RequestMapping(value="/download", method=RequestMethod.GET,
			produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	public ResponseEntity<Resource>download(@RequestHeader("User-Agent")String userAgent,String fileCallPath){
		log.info("welcome! download paramInfo:"+fileCallPath+", "+userAgent);
		return fileService.download(fileCallPath,userAgent);
	}
}
