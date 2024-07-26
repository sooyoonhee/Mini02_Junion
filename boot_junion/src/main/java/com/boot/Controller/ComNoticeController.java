package com.boot.Controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.boot.DAO.ComNoticeDAO;
import com.boot.DTO.ComNoticeAttachDTO;
import com.boot.DTO.ComNoticeDTO;
import com.boot.DTO.ResumeDTO;
import com.boot.DTO.SubmitDTO;
import com.boot.DTO.UserDTO;
import com.boot.Service.ComNoticeService;
import com.boot.Service.IndividualService;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Slf4j
public class ComNoticeController {

	@Autowired
	private ComNoticeService postService;
	
	@Autowired
	private IndividualService userService;
	

	@RequestMapping("/jobPostList")
	public String jobPost(Model model) {//대메뉴 -> 채용 클릭시 이동
		log.info("jobPost");
		
		
		ArrayList<ComNoticeDTO> dto = postService.JobPostCard();
		model.addAttribute("jobPost", dto);
		
		return "/recruitmentNotice/jobPostList";
	}
	
	@RequestMapping("/scrapNotice")
	public void scrapNotice(HttpServletRequest request) {//스크랩 기능 구현 예정
		log.info("scripNotice");
		
	
	}
	
	
	@RequestMapping("/jobPostDetail")
	public String JobPost(HttpSession session, int notice_num, Model model) {//채용공고 상세
//		public String JobPost(int notice_num, Model model, @RequestParam HashMap<String, String> param) {//채용공고 상세
		log.info("jobPostDetail");
		log.info("notice_num!!!"+notice_num);
		
		
		// notice_num 값을 세션에 저장
//	    List<Integer> recentJobPosts = (List<Integer>) session.getAttribute("recentJobPost");
//	    log.info("recentJobPosts!!!"+recentJobPosts);
//	    
//	    if (recentJobPosts == null) {
//	        recentJobPosts = new ArrayList<>();
//	    }
//	    
//	    // 이미 리스트에 있는지 확인하고, 없는 경우에만 추가
//	    if (!recentJobPosts.contains(notice_num)) {
//	        recentJobPosts.add(notice_num);
//	    }
//	    
//	    log.info("@# jobPost recentJobPosts=> " + recentJobPosts);
//	    
//	    session.setAttribute("recentJobPost", recentJobPosts);//세션에 정보 저장
//		
//	    String user_email = (String) session.getAttribute("login_email");//세션에 저장된 사용자이메일 가져오기
//	    log.info("@# jobPost user_email => "+user_email);
//	    
//	    // 리스트를 쉼표로 구분된 문자열로 변환 > 쿼리를 통해 저장하려면 JSON형식이나 문자열로 반환해서 보내줘야 함
//	    String recentJobPostsStr = recentJobPosts.stream()
//	                                             .map(String::valueOf)
//	                                             .reduce((a, b) -> a + "," + b)
//	                                             .orElse("");
//	    log.info("@# jobPost recentJobPostsStr => "+recentJobPostsStr);
//	    
//	    UserDTO userDTO = new UserDTO();
//	    userDTO.setUser_email(user_email);
//	    userDTO.setRecent_noticeNumArray(recentJobPostsStr);
////	    userService.updateUserNoticeNum(user_email, recentJobPosts); //array 형태로 보내니 안들어감.
//	    userService.updateUserNoticeNum(userDTO); // user정보에 최근본공고 저장

		
		
		ComNoticeDTO dto = postService.JobPost(notice_num);
		postService.hitUP(notice_num);
		model.addAttribute("company", dto);
		
//		String com_email = dto.getCom_email();
//		String com_location = postService.comLocation(com_email);
//		model.addAttribute("com_location", com_location);
		
		return "/recruitmentNotice/jobPostDetail";
	}
	
//	@RequestMapping("/profileList")
//	public String profileList(@RequestParam HashMap<String, String> param, HttpServletRequest request, Model model) {
////	public void profileInfo(@RequestParam HashMap<String, String> param, HttpServletRequest request, Model model) {
////		public String profileInfo(StringBuffer ring, HttpServletRequest request, Model model) {
//		log.info("profileList");
//		log.info("profileList param==>"+param);
//		//request.setAttribute("notice", param);
//		model.addAttribute("notice", param);
//		
////		HttpSession session = request.getSession();
////		String login_email = (String) session.getAttribute("login_email");
////		ArrayList<ResumeDTO> dto = postService.getProfileList(login_email);
////		log.info("profileInfo dto==>"+dto);
////		model.addAttribute("userProfile", dto);
////		return "location";
//		return "/recruitmentNotice/profileInfo";
//	}
	
	@RequestMapping("/profileInfo")
	public String profileInfo(HttpServletRequest request, Model model){//지원하기 팝업
		log.info("profileInfo");
		
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
//		log.info(notice_num);
		ComNoticeDTO dto =postService.getNoticeInfo(notice_num);
		model.addAttribute("notice", dto);
		
		HttpSession session = request.getSession();
		String login_name = (String) session.getAttribute("login_name");
		model.addAttribute("user_name", login_name);
		
		String login_email = (String) session.getAttribute("login_email");
		ArrayList<ResumeDTO> dtos = postService.getProfileList(login_email);
		log.info("profileInfo dtos==>"+dtos);
		model.addAttribute("userProfile", dtos);
		
//		HashMap<String, String> hashmap=null;
		return "/recruitmentNotice/profileInfo";
	}
	
	@RequestMapping("/resumeUser")
	@ResponseBody
//	public String resumeUser(@RequestParam HashMap<String, String> param) {
//	public boolean resumeUser(@RequestParam HashMap<String, String> param, Model moedel) {//이력서 선택, 지원하기 버튼 클릭시 DB에 정보 추가
	public void resumeUser(@RequestParam HashMap<String, String> param, HttpServletRequest request, Model moedel) {//이력서 선택, 지원하기 버튼 클릭시 DB에 정보 추가
		log.info("resumeUser!!!");
		log.info("resumeUser!!! param" +param);
		
		//SubmitDTO에 저장할 정보 가져오기
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		int resume_num = Integer.parseInt(request.getParameter("resume_num"));
		HttpSession session = request.getSession();
		String user_email = (String) session.getAttribute("login_email");
//		String com_email = param.get("notice");
//		String com_name = request.getParameter("com_name");
		
		SubmitDTO dto = new SubmitDTO();
//		dto.setCom_email(com_email);
		dto.setUser_email(user_email);
		dto.setNotice_num(notice_num);
		dto.setResume_num(resume_num);
		log.info("resumeUser!!! SubmitDTO=> " +dto);
		
		
		postService.updateSubmitData(dto);//submit 테이블에 정보저장
		
//		log.info(notice_num);
		
		
//		boolean resumeResult = postService.insertResumNum(param);
		postService.insertResumNum(param);
//		log.info("resumeResult!!!"+resumeResult);
		
//		return resumeResult;
	}
	
	
	@Autowired
    private ComNoticeService service;
	
	//기업 초기 메인 (공고 없을때)
	@RequestMapping("/comRegistMain")
	public String comRegistMain() {
		log.info("@# comRegistMain");
		
		return "comRegistMain";
	}
	
	//공고.지원자관리 목록
	@RequestMapping("/comRegistCheck")
	public String comRegistCheck() {
		log.info("@# comRegistCheck");
		
		return "comRegistCheck";
	}
	
	//채용공고 등록 페이지
		@RequestMapping("/comRegistUpload")
		public String comRegistUpload(ComNoticeDTO comNoticeDTO, HttpServletRequest httpServletRequest, Model model) {
			log.info("@# comRegistUpload");
			
			HttpSession session = httpServletRequest.getSession();
			session.getAttribute("login_email");
			session.getAttribute("login_name");
			log.info("@# session  =>"+(String) session.getAttribute("login_email"));
			
			model.addAttribute("com_email",session.getAttribute("login_email"));
			model.addAttribute("com_name", session.getAttribute("login_name"));
			
			
			return "comRegistUpload";
		}
		
		// 채용공고 등록
		@RequestMapping("/registerNotice")
		public String regiserNotice(ComNoticeDTO comNoticeDTO, HttpServletRequest httpServletRequest, Model model) {
			log.info("@# registerNotice");
			
			HttpSession session = httpServletRequest.getSession();
			session.getAttribute("login_email");
			session.getAttribute("login_name");
			log.info("@# session  =>"+(String) session.getAttribute("login_email"));
			
			model.addAttribute("com_email",session.getAttribute("login_email"));
			model.addAttribute("com_name", session.getAttribute("login_name"));
			

			log.info("@# comNoticeDTO=>"+comNoticeDTO);
			
			if (comNoticeDTO.getComNoticeAttachList() != null) {
				comNoticeDTO.getComNoticeAttachList().forEach(attach -> log.info("@# attach=>"+attach));
			}
			service.registerNotice(comNoticeDTO);
			service.noticeInsertStack(comNoticeDTO);
			service.noticeStauts(comNoticeDTO);
			
			httpServletRequest.setAttribute("msg", "공고를 등록하였습니다.");
			httpServletRequest.setAttribute("url", "/companyMain");
			return "/alert";
			
		}
	
	
	
	@PostMapping("/registUploadAjaxAction")
//	public void uploadAjaxPost(MultipartFile[] uploadFile) {
//	ResponseEntity : 파일 정보를 넘기기위해서 사용
	public ResponseEntity<List<ComNoticeAttachDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		log.info("upload ajax post...");
		
		List<ComNoticeAttachDTO> list = new ArrayList<>();
		
		String uploadFolder = "C:\\devv\\upload";
		String uploadFolderPath = getFolder();
//		"D:\\dev\\upload"+년월일 폴더
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		log.info("@# uploadPath=>"+uploadPath);
		
		if (uploadPath.exists() == false) {
			// make yyyy/MM/dd folder
			uploadPath.mkdirs();
		}
		
		for (MultipartFile multipartFile : uploadFile) {
			log.info("==============================");
//			getOriginalFilename : 업로드 되는 파일 이름
			log.info("@# 업로드 되는 파일 이름=>"+multipartFile.getOriginalFilename());
//			getSize : 업로드 되는 파일 크기
			log.info("@# 업로드 되는 파일 크기=>"+multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			UUID uuid = UUID.randomUUID();
			log.info("@# uuid=>"+uuid);
			
			ComNoticeAttachDTO comNoticeAttachDTO = new ComNoticeAttachDTO();
			comNoticeAttachDTO.setFileName(uploadFileName);
			comNoticeAttachDTO.setUuid(uuid.toString());
			comNoticeAttachDTO.setUploadPath(uploadFolderPath);
			log.info("@# comNoticeAttachDTO 01=>"+comNoticeAttachDTO);
			
			uploadFileName = uuid.toString() +"_"+uploadFileName;
			log.info("@# uuid uploadFileName=>"+uploadFileName);
			
//			saveFile : 경로하고 파일이름
			File saveFile = new File(uploadPath, uploadFileName);
			FileInputStream fis=null;
			
			try {
//				transferTo : saveFile 내용을 저장
				multipartFile.transferTo(saveFile);
				
//				참이면 이미지 파일
				if (checkImageType(saveFile)) {
					comNoticeAttachDTO.setImage(true);
					log.info("@# comNoticeAttachDTO 02=>"+comNoticeAttachDTO);
					
					fis = new FileInputStream(saveFile);
					
//					썸네일 파일은 s_ 를 앞에 추가
					FileOutputStream thumnail = new FileOutputStream(new File(uploadPath, "s_"+uploadFileName));
					
//					썸네일 파일 형식을 100/100 크기로 생성
					Thumbnailator.createThumbnail(fis, thumnail, 1200, 1200);
					
					thumnail.close();
				}
				
				list.add(comNoticeAttachDTO);
			} catch (Exception e) {
				log.error(e.getMessage());
			}finally {
				try {
					if (fis != null) fis.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}//end of for
		
//		파일정보들을 list 객체에 담고, http 상태값은 정상으로 리턴
		return new ResponseEntity<List<ComNoticeAttachDTO>>(list, HttpStatus.OK);
	}
	
//	날짜별 폴더 생성
	private String getFolder() {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date date=new Date();
		String str = sdf.format(date);
		
		log.info("@# str=>"+str);
		log.info("@# separator=>"+File.separator);
		
		return str.replace("-", File.separator);
	}
	
//	이미지 여부 체크
	public boolean checkImageType(File file) {
		try {
//			이미지파일인지 체크하기 위한 타입(probeContentType)
			String contentType = Files.probeContentType(file.toPath());
			log.info("@# contentType=>"+contentType);
			
//			probeContentType 메소드 버그로 로직 추가
			if (contentType == null) {
				return false;
			}
			
			log.info("@# startsWith===>"+contentType.startsWith("image"));
			
//			startsWith : 파일종류 판단
			return contentType.startsWith("image");//참이면 이미지파일
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;//거짓이면 이미지파일이 아님
	}
	
//	이미지파일을 받아서 화면에 출력(byte 배열타입)
	@GetMapping("/registDisplay")
	public ResponseEntity<byte[]> getFile(String fileName) {
		log.info("@# display fileName=>"+fileName);
		
//		업로드 파일경로+이름
		File file = new File("C:\\devv\\upload\\"+fileName);
		log.info("@# file=>"+file);
		
		ResponseEntity<byte[]> result=null;
		HttpHeaders headers=new HttpHeaders();
		
		try {
//			파일타입을 헤더에 추가
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
//			파일정보를 byte 배열로 복사+헤더정보+http상태 정상을 결과에 저장
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@PostMapping("/registDeleteFile")
	public ResponseEntity<String> deleteFile(String fileName, String type) {
		log.info("@# deleteFile fileName=>"+fileName);
		File file;
		
		try {
//			URLDecoder.decode : 서버에 올라간 파일을 삭제하기 위해서 디코딩
			file = new File("C:\\devv\\upload\\"+URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
			
//			이미지 파일이면 썸네일도 삭제
			if (type.equals("image")) {
//				getAbsolutePath : 절대경로(full path)
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				log.info("@# largeFileName=>"+largeFileName);
				
				file = new File(largeFileName);
				file.delete();
			}
		} catch (Exception e) {
			e.printStackTrace();
//			예외 오류 발생시 not found 처리
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}
//		deleted : success 의 result 로 전송
		return new ResponseEntity<String>("deleted",HttpStatus.OK);
	}
	
//	@GetMapping(value = "/getFileList", produces = MediaType.APPLICATION_JSON_VALUE)
//	@ResponseBody
	@GetMapping(value = "/registGetFileList")
	public ResponseEntity<List<ComNoticeAttachDTO>> registGetFileList(@RequestParam HashMap<String, String> param) {
		log.info("@# registGetFileList()");
		log.info("@# param=>"+param);
		log.info("@# param=>"+param.get("notice_num"));
		
		return new ResponseEntity<>(service.registGetFileList(Integer.parseInt(param.get("notice_num"))), HttpStatus.OK);
	}
	
	
	
	//인재풀
	@RequestMapping("/comRegistApplicant")
	public String comRegistApplicant() {
		log.info("@# comRegistApplicant");
		
		return "comRegistApplicant";
	}


}
