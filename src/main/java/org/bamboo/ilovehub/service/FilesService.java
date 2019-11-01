package org.bamboo.ilovehub.service;

import org.bamboo.ilovehub.domain.AttachFileVO;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

//각 계층간의 연결은 interface를 통하여 느슨한 결합(loose) 유지
public interface FilesService {
	//첨부파일 업로드
	public ResponseEntity<AttachFileVO> uploadFile(MultipartFile uploadFile);
}
