package org.bamboo.ilovehub.service;

import java.io.File;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class FilesServiceImpl implements FilesService {
	final String uploadFolder = "C:\\upload"; //임시 업로드 폴더
	
	@Override
	//첨부파일 업로드
	public void uploadFiles(MultipartFile[] uploadFiles) {
		log.info("첨부파일 업로드 service start");
		
		for(MultipartFile file : uploadFiles) {
			log.info("---------------------------------------");
			log.info("Upload File Name:"+file.getOriginalFilename());
			log.info("Upload File Size:"+file.getSize());
			String uploadFileName = file.getOriginalFilename();
			//IE has file path (IE의 경우 getOriginalFilename() 을 하면 파일의 이름이 나오지않고 전체 경로가 출력되므로 경로를 잘라낸다)
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			log.info("only file name:"+uploadFileName);
			File saveFile = new File(uploadFolder, uploadFileName);
			
			try {
				file.transferTo(saveFile);
			}catch(Exception e) {
				log.error(this.getClass().getSimpleName()+" "+new Object(){}.getClass().getEnclosingMethod().getName()+" error:"+e.getMessage());
			}
		}//end of For
		
	}

}
