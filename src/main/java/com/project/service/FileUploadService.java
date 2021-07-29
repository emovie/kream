package com.project.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.model.MemberDTO;
import com.project.model.UserDAO;

@Service
public class FileUploadService {

	@Autowired private UserDAO userdao;
	
	private final String uploadPath = "D:\\kreamUpload";
	
	public FileUploadService() {
		File dir = new File(uploadPath);
		if(dir.exists() == false) {
			dir.mkdir();
			System.out.println("업로드 폴더를 생성했습니다");
		}
	}
	
	public int uploadFileDTO(MemberDTO dto, int nowLoginIdx) {
		// dto에 담겨있는 파일들을 uploadPath에 복사하고
		// 이름은 vdate-title-originalFileName의 형식으로 만드세요
		// 전송한 파일이 한번에 모두 생성되어야 합니다.
		
		// File Upload
		MultipartFile file = dto.getProfileFile();
		

		String fileName = "";
		if(file.isEmpty() == false) { 
			UUID uuid = UUID.randomUUID();
			fileName = String.format("%s_%s", uuid.toString(), file.getOriginalFilename());
			String fileUpload = uploadPath + "\\" + fileName;
			try {
				file.transferTo(new File(fileUpload));
			} catch (IllegalStateException | IOException e) {}
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fileName", fileName);
		map.put("nowLoginIdx", nowLoginIdx);
		
		if(userdao.insertImage(map) == 1) {
			dto.setProfileimage(fileName);
			return 1;
		}
		return 0;
	}
	
}
