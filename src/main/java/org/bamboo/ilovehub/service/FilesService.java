package org.bamboo.ilovehub.service;

import org.bamboo.ilovehub.domain.AttachFileVO;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

//각 계층간의 연결은 interface를 통하여 느슨한 결합(loose) 유지
public interface FilesService {
	//첨부파일 업로드
	public ResponseEntity<AttachFileVO> uploadFile(MultipartFile uploadFile);
	//첨부파일 삭제
	public ResponseEntity<String> deleteFile(AttachFileVO attachFileVO);
	//첨부파일 썸네일 전송
	public ResponseEntity<byte[]>display(String fileCallPath);
	//첨부파일 다운로드
	public ResponseEntity<Resource>download(String fileCallPath,String userAgent);
}
