package org.bamboo.ilovehub.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Service
@Log4j
public class FilesServiceImpl implements FilesService {
	final String rootUploadFolder = "C:\\upload"; //임시 업로드 폴더
	
	//첨부파일 업로드
	@Override
	public void uploadFiles(MultipartFile[] uploadFiles) {
		log.info("첨부파일 업로드 service start");
		
		// 년/월/일 폴더 만들기
		String splitFoler = getSplitFolder();
		File uploadPath = new File(rootUploadFolder,splitFoler);
		log.info("upload path:"+uploadPath);
		
		if(!uploadPath.exists()) { //uploadPath가 존재하지 않는다면 만들어준다.
			uploadPath.mkdirs();
		}
		
		for(MultipartFile file : uploadFiles) {
			log.info("---------------------------------------");
			log.info("Upload File Name:"+file.getOriginalFilename());
			log.info("Upload File Size:"+file.getSize());
			String uploadFileName = file.getOriginalFilename();
			//IE has file path 
			//(IE의 경우 getOriginalFilename() 을 하면 파일의 이름이 나오지않고 전체 경로가 출력되므로 경로를 잘라낸다)
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			log.info("only file name:"+uploadFileName);
			
			//파일명 중복을 최소화 하기 위한 UUID로 파일명 바꿔주기.
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString()+"_"+uploadFileName; // '_'를 기준으로 원본파일명과 구분되게 해준다.;
			
			File saveFile = new File(uploadPath, uploadFileName);
			try {
				file.transferTo(saveFile); //실제 업로드 실행
				
				//이미지 파일인지 판별한 후 이미지라면 썸네일 생성
				if(checkImageType(saveFile)) {
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath,"s_"+uploadFileName));
					Thumbnailator.createThumbnail(file.getInputStream(), thumbnail, 200, 165);
					thumbnail.close();
				}
			}catch(Exception e) {
				log.error(this.getClass().getSimpleName()+" "+new Object(){}.getClass().getEnclosingMethod().getName()+" error:"+e.getMessage());
			}
		}//end of For
	}
	
	// 오늘 날짜의 경로를 문자열로 생성 -> 폴더 경로로 수정한 뒤에 반환
	private String getSplitFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator); //각 OS에 맞는 Folder 구분자로 반환해준다.
	}
	
	//이미지인지 체크한다.
	private boolean checkImageType(File file) {
		try {
			//실제 파일의 내용이 아니라 파일의 확장자를 이용하여 마임타입(MIME)을 판단합니다. 
			//그러므로 확장자가 없는 파일은 null을 반환합니다. -> 실제 파일이 존재하지 않아도 확장자로 마입타입(MIME)을 반환합니다.
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image"); //해당 문자열이 image로 시작하는지 판단하여 true/false 반환
		}catch(IOException e) {
			log.error(this.getClass().getSimpleName()+" "+new Object(){}.getClass().getEnclosingMethod().getName()+" error:"+e.getMessage());
		}
		return false;
	}
}
