package org.bamboo.ilovehub.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.apache.http.client.methods.HttpHead;
import org.apache.tika.Tika;
import org.bamboo.ilovehub.domain.AttachFileVO;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Service
@Log4j
public class FilesServiceImpl implements FilesService {
	final String rootUploadFolder = "C:\\upload"; // 임시 업로드 폴더

	// 첨부파일 업로드 - 1개의 파일 업로드
	@Override
	public ResponseEntity<AttachFileVO> uploadFile(MultipartFile uploadFile) {
		log.info("첨부파일 업로드 service start");

		ResponseEntity<AttachFileVO> result = null;

		// 년/월/일 폴더 만들기
		String splitFoler = getSplitFolder();
		File uploadPath = new File(rootUploadFolder, splitFoler);
		log.info("upload path:" + uploadPath);

		if (!uploadPath.exists()) { // uploadPath가 존재하지 않는다면 만들어준다.
			uploadPath.mkdirs();
		}

		AttachFileVO attachFileVO = new AttachFileVO(); // 응답을 위한 vo

		log.info("---------------------------------------");
		log.info("Upload File Name:" + uploadFile.getOriginalFilename());
		log.info("Upload File Size:" + uploadFile.getSize());
		String uploadFileName = uploadFile.getOriginalFilename();
		// IE has file path
		// (IE의 경우 getOriginalFilename() 을 하면 파일의 이름이 나오지않고 전체 경로가 출력되므로 경로를 잘라낸다)
		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
		log.debug("only file name:" + uploadFileName);

		// 파일명 중복을 최소화 하기 위한 UUID로 파일명 바꿔주기.
		UUID uuid = UUID.randomUUID();
		uploadFileName = uuid.toString() + "_" + uploadFileName; // '_'를 기준으로 원본파일명과 구분되게 해준다.;

		File saveFile = new File(uploadPath, uploadFileName);
		try {
			uploadFile.transferTo(saveFile); // 실제 업로드 실행
			String contentType = checkFileType(saveFile);
			if (contentType.startsWith("image")) { // 이미지 파일인지 판별한 후 이미지라면 썸네일 생성
				FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
				Thumbnailator.createThumbnail(uploadFile.getInputStream(), thumbnail, 200, 165);
				thumbnail.close();
			}
			attachFileVO.setUuid(uuid.toString());
			attachFileVO.setUploadPath(splitFoler);
			attachFileVO.setOriginalFile(uploadFile.getOriginalFilename());
			attachFileVO.setFileType(contentType);
			attachFileVO.setFileSize(uploadFile.getSize());
			result = new ResponseEntity<>(attachFileVO, HttpStatus.OK);
		} catch (Exception e) {
			log.error(this.getClass().getSimpleName() + " " + new Object() {
			}.getClass().getEnclosingMethod().getName() + " error:" + e.getMessage());
			result = new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}

	// 첨부파일 삭제 - 첨부파일 삭제
	@Override
	public ResponseEntity<String> deleteFile(AttachFileVO attachFileVO) {
		String uploadPath = attachFileVO.getUploadPath(); //업로드 폴더
		String uuid = attachFileVO.getUuid(); //uuid
		String fileName = attachFileVO.getOriginalFile(); //파일이름
		
		try {
			File file = new File(rootUploadFolder,uploadPath+File.separator+uuid+"_"+fileName);
			if(checkFileType(file).startsWith("image")) { //만약 삭제할 파일이 이미지라면
				File thumbnail = new File(rootUploadFolder,uploadPath+File.separator+"s_"+uuid+"_"+fileName);
				if(thumbnail.exists()) thumbnail.delete(); //썸네일 삭제
			}
			if(file.exists()) file.delete(); //파일 삭제
			return new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e) {
			log.error(this.getClass().getSimpleName() + " " + new Object() {
			}.getClass().getEnclosingMethod().getName() + " error:" + e.getMessage());
			return new ResponseEntity<String>("fail",HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	//이미지 첨부파일 썸네일 전송
	@Override
	public ResponseEntity<byte[]> display(String fileCallPath){
		log.info("fileService display start");
		File file = new File(rootUploadFolder+File.separator+fileCallPath);
		log.info("thumbFile:"+file);
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", checkFileType(file));
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
			log.error(this.getClass().getSimpleName() + " " + new Object() {
			}.getClass().getEnclosingMethod().getName() + " error:" + e.getMessage());
			result = new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	//첨부파일 다운로드[이미지 첨부파일 X]
	@Override
	public ResponseEntity<Resource> download(String fileCallPath, String userAgent) {
		log.info("fileService download start");
		Resource resource = new FileSystemResource(rootUploadFolder+File.separator+fileCallPath);
		if(!resource.exists()) return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND);
		//Remove UUID
		String resourceName = resource.getFilename();
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_")+1);
		HttpHeaders headers = new HttpHeaders();
		
		String downloadName=null;
		try {
			if(userAgent.contains("Trident")) { //IE
				downloadName = URLEncoder.encode(resourceOriginalName,"UTF-8").replaceAll("\\+", " ");
			}else if(userAgent.contains("Edge")) {//IE Edge
				downloadName = URLEncoder.encode(resourceOriginalName,"UTF-8");
			}else{ //Chrome
				downloadName = new String(resourceOriginalName.getBytes("UTF-8"),"ISO-8859-1");
			}
			headers.add("Content-Disposition", "attachment; filename=" + downloadName);
		}catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource,headers,HttpStatus.OK);
	}
	
	// 오늘 날짜의 경로를 문자열로 생성 -> 폴더 경로로 수정한 뒤에 반환
	private String getSplitFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator); // 각 OS에 맞는 Folder 구분자로 반환해준다.
	}

	// 파일타입 체크 후 반환
	private String checkFileType(File file) {
		try {
			String mimeType = new Tika().detect(file);
			return mimeType;
		} catch (IOException e) {
			log.error(this.getClass().getSimpleName() + " " + new Object() {
			}.getClass().getEnclosingMethod().getName() + " error:" + e.getMessage());
		}
		return "false";
	}

	// 이미지인지 체크한다. - 현재 따로 사용하지는 않음. (19.10.31)
	private boolean checkImageType(File file) {
		try {
			// 실제 파일의 내용이 아니라 파일의 확장자를 이용하여 마임타입(MIME)을 판단합니다.
			// 그러므로 확장자가 없는 파일은 null을 반환합니다. -> 실제 파일이 존재하지 않아도 확장자로 마입타입(MIME)을 반환합니다.
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image"); // 해당 문자열이 image로 시작하는지 판단하여 true/false 반환
		} catch (IOException e) {
			log.error(this.getClass().getSimpleName() + " " + new Object() {
			}.getClass().getEnclosingMethod().getName() + " error:" + e.getMessage());
		}
		return false;
	}
	// 파일타입 체크 후 반환-Files.probeContentType이 application/stream-octat 이러한 파일들(sql,jsp,php등)은 확장자 반환을 null로 하여
	// 문제가 발생하여 위의 tika 라이브러리를 사용하였음.
	/*private String checkFileType(File file) {
		try {
			// 실제 파일의 내용이 아니라 파일의 확장자를 이용하여 마임타입(MIME)을 판단합니다.
			// 그러므로 확장자가 없는 파일은 null을 반환합니다. -> 실제 파일이 존재하지 않아도 확장자로 마입타입(MIME)을 반환합니다.
			return Files.probeContentType(file.toPath());
		} catch (IOException e) {
			log.error(this.getClass().getSimpleName() + " " + new Object() {
			}.getClass().getEnclosingMethod().getName() + " error:" + e.getMessage());
		}
		return "false";
	}*/
}
