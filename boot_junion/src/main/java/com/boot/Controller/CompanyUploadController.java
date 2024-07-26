package com.boot.Controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.boot.DTO.CompanyAttachDTO;
import com.boot.Service.CompanyuploadService;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Slf4j
public class CompanyUploadController {
	
	@Autowired
	private CompanyuploadService service;
	
	
	@PostMapping("/comUploadAjaxAction")
//	@RequestMapping //두 가지 방식으로 받을 수 있음.
//	public void name(MultipartFile[] uploadFile) {//file data를 받는 인터페이스
//	ResponseEntity : 파일 정보를 넘기기 위해서 사용 -> 여러 건일 경우를 대비 arraylist/list를 타입 파라미터로 받음
	public ResponseEntity<List<CompanyAttachDTO>> name(MultipartFile[] uploadFile) {//file data를 받는 인터페이스
		log.info("upload ajax pos...");
		
		List<CompanyAttachDTO> list = new ArrayList<CompanyAttachDTO>();
		
		String uploadFolder = "C:\\devv\\upload";
		String uploadFolderPath = getFolder();//메소드 호출
		
//		"D:\\dev\\upload" + 년월일 폴더 생성
		File uploadPath = new  File(uploadFolder, uploadFolderPath);
		log.info("@# uploadPath=>"+uploadPath);//로그를 보고 오류난 부분을 찾을 수 잇음.
		
		if (uploadPath.exists() == false) {
//			make yyyy/MM/dd folder 생성
			uploadPath.mkdirs();
		}
		
		for (MultipartFile multipartFile : uploadFile) {
			log.info("============================");
//			getOriginalFilename : 업로드되는 파일 이름(MultipartFile의 내장 메소드)
			log.info("@# 업로드 되는 파일 이름 =>"+multipartFile.getOriginalFilename());//getname도 사용은 가능
//			getSize : 업로드 되는 파일 크기
			log.info("@# 업로드 되는 파일 이름 =>"+multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			UUID uuid = UUID.randomUUID();
			log.info("@# uuid=>"+uuid);
			
			
			CompanyAttachDTO companyAttachDTO = new CompanyAttachDTO();
			companyAttachDTO.setFileName(uploadFileName);//파일이름 설정
			companyAttachDTO.setUuid(uuid.toString());// uuid 설정(uuid -> string(casting))
			companyAttachDTO.setUploadPath(uploadFolderPath);
			log.info("@# companyAttachDTO 01=>"+companyAttachDTO);
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;//uuid가 붙은 이름
			log.info("@# uuid uploadFileName=>"+uploadFileName);
		
//			saveFile : 경로하고 파일 이름
			File saveFile = new File(uploadPath, uploadFileName);
			FileInputStream fis=null;
			
			try {
//				transferTo : saveFile 내용을 저장
				multipartFile.transferTo(saveFile);
				
//				참이면 이미지 파일
					if (checkImageType(saveFile)) {//파일 저장시 이미지파일 여부 판단.
						companyAttachDTO.setImage(true);//초기값(default)값은 false
						log.info("@# boardAttachDTO 02(image)=>"+companyAttachDTO);
						
						fis = new FileInputStream(saveFile);
//						썸네일 파일은 s_를 앞에 추가
						FileOutputStream thumnail= new FileOutputStream(new File(uploadPath, "s_"+uploadFileName));
						
//						썸네일 파일 형식을 100/100 크기로 형성
						Thumbnailator.createThumbnail(fis, thumnail, 100, 100);
						
						thumnail.close();
					}
				
				list.add(companyAttachDTO);//반복문을 돌면서 
			} catch (Exception e) {
				log.error(e.getMessage());//log에 오류 메시지 생성
			}finally {
				try {
					if (fis != null) fis.close();
				}catch (Exception e2) {
					e2.printStackTrace();
				}
				
			}
		}//end of for
		
//		파일 정보들을 list 객체에 담고, http 상태값은 정상적으로 리턴
		return new ResponseEntity<List<CompanyAttachDTO>>(list, HttpStatus.OK);
//		리턴일 경우, 경로 이동 or jsp 이동
	}
	
	//날짜별로 폴더를 생성하는 메소드 생성
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//날짜 형식 지정
		Date date = new Date();//java.util class
		String str = sdf.format(date);//설정한 방식대로 파라미터의 형식을 지정
		
		log.info("@# str=>"+str);
		log.info("@# separator=>"+File.separator);//java.io class
		
		return str.replace("-", File.separator); //운영체제를 타지 않도록 변경
	}
	
//	이미지 여부 체크
	public boolean checkImageType(File file) {
		try {//오류 대비
//			이미지 파일인지 체크하기 위한 타입(probeContentType)
			String contentType = Files.probeContentType(file.toPath());
			log.info("@# contentType=>"+contentType);
			
//			startsWith : 파일종류 판단
			return contentType.startsWith("image");//참이면 이미지 파일
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;//거짓이면 이미지파일이 아님
	}
	
//	이미지파일을 받아서 화면에 출력(byte 배열 타입)
//	폴더에 저장된 파일을 화면에 출력
//	@RequestMapping으로 값을 가져올 수 있음.
	@GetMapping("/comDisplay")
	public ResponseEntity<byte[]> getFile(String fileName) {
		log.info("@# display fileName=>"+fileName);
		
//		업로드 파일 경로+이름(다른 OS의 경우 file 이름을 다르게 잡아줘야 함?)
		File file = new File("C:\\devv\\upload\\"+fileName);
		log.info("@# file=>" +file);
		
		ResponseEntity<byte[]> result = null;
		HttpHeaders headers = new HttpHeaders();
		
		try {//파일 출력시 오류가 날 수 있으므로 예외처리함
//			파일 타입을 헤더에 추가
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
//			파일 정보를 byte 배열로 복사 + 헤더정보 + http 상태 정상을 결과에 저장
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@PostMapping("/comInfoDeleteFile")
	public ResponseEntity<String> deleteFile(String fileName, String type) {
		log.info("@# deleteFile fileName=>"+fileName);
		File file;
		
		try {//삭제 예외처리
//			URLDecoder.decode : 서버에 올라간 파일을 삭제하기 위해서 디코딩
			file = new File("C:\\devv\\upload\\"+URLDecoder.decode(fileName, "UTF-8"));
			file.delete();//파일 삭제
			
//			이미지 파일이면 썸네일도 삭제
			if (type.equals("image")) {//썸네일 삭제
//				getAbsolutePath : 절대경로(full path)
				String largeFileName = file.getAbsolutePath().replace("s_", "");//절대 경로에서 s_를 삭제
				log.info("@# largeFileName=>"+largeFileName);
				
				file = new File(largeFileName);
				file.delete();
			}
		} catch (Exception e) {//삭제할 파일이 없을 경우
			e.printStackTrace();
//			예외 오류 발생시 not found 처리
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}
//		deleted : success의 result 로 전송
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
//	@GetMapping(value="/getFileList", produces = MediaType.APPLICATION_JSON_VALUE)
	@GetMapping(value="/comInfoGetFileList")
	public ResponseEntity<List<CompanyAttachDTO>> comInfoGetFileList(@RequestParam HashMap<String, String> param) {
		log.info("@# comInfoGetFileList()");
		log.info("@# param=>"+param);
		log.info("@# param.get(boardNo)=>"+param.get("com_email"));
		
		
		return new ResponseEntity<>(service.comInfoGetFileList(param.get("com_email")),HttpStatus.OK);
	}

}







