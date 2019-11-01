package org.bamboo.ilovehub.domain;

import lombok.Data;

//첨부파일VO
@Data
public class AttachFileVO {
	Long fileId; //파일 고유번호
	String uploadPath; //업로드 폴더가 업로드 날짜에 따라(년/월/일) 나누어지므로 DB에 저장
	String uuid; //파일이름 중복을 방지하기 위한 원본파일명 앞에 붙을 uuid
	String originalFile; //사용자가 업로드한 파일이름
	String fileType; //image, text/html 이러한 파일타입
}
