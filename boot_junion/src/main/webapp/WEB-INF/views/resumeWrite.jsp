<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이력서작성페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/resumeWrite.css">
<!--<link rel="stylesheet" href="src/main/resources/static/css/style.css">-->
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<!-- import js -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<%@ include file="header.jsp" %>
		
		<section>			
            <div class="sectionInner">
                <form action="resumeWriteOk" method="post" id="frm">
					<!-- <input type="hidden" name="boardNo" value="${content_view.boardNo}"> -->
					<input type="hidden" name="boardNo" value="${pageMaker.resume_num}">
					<input type="hidden" name="pageNum" value="${pageMaker.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.amount}">					
	                <div class="infoWrap">
	                    <input class="resumeTitle" type="text" name="resume_title" id="resume_title" maxlength="20" placeholder="이력서제목">
	                    <div class="resumeConWrap">
	                        <div class="resumeCon left">
	                            <div class="resumeConTop">
	                                <h5 class="name" name="user_name">${userInfo.user_name}</h5>
	                                <div class="ageSex">
	                                    <!-- <h5 class="age">${userInfo.user_birthdate}</h5> -->
	                                    <h5 class="age"></h5>
										<h5 id="sex" style="font-size: var(--font-size16); font-weight: 300;">${userInfo.user_gender}</h5>	                                    
	                                </div>
	                            </div>
	                            <div class="resumeConBottom">
	                                <div class="resumeCon mail">
	                                    <span class="icon">
	                                        <i class="fa-solid fa-envelope"></i>
	                                    </span>
	                                    <h5 class="email">${userInfo.user_email}</h5>
	                                </div>
	                                <div class="resumeCon tel">
	                                    <span class="icon">
	                                        <i class="fa-solid fa-phone"></i>
	                                    </span>
										<h5 class="tel">${userInfo.user_tel}</h5>
	                                    <!-- <input class="tel" type="text" maxlength="20" placeholder="전화번호" id="user_tel" name="user_tel"> -->
	                                </div>
	                                <div class="resumeCon location">
	                                    <span class="icon">
	                                        <i class="fa-solid fa-location-dot"></i>
	                                    </span>
										<h5 class="user_location">${userInfo.user_location}</h5>
	                                    <!-- <input class="location" type="text" maxlength="20" placeholder="위치" id="user_address" name="user_address"> -->
	                                </div>
	                                <div class="resumeCon wantPay">
	                                    <span class="icon">
	                                        <i class="fa-solid fa-money-check"></i>
	                                    </span>										
	                                    <input class="wantPay" type="text" maxlength="20" placeholder="희망연봉" id="resume_pay" name="resume_pay">
	                                </div>
	                            </div>
	                        </div>
	                        <div class="resumeCon right">
								<div class="uploadResult">
									<ul class="resumeImage">
									</ul>
								</div>
	                            <h5 class="addPicture">									
									<div class="uploadDiv">
										<input class="upload-name" value="첨부파일" placeholder="첨부파일">
										<label for="file" class="fileAdd">
											<i class="fa-solid fa-gear"></i>
										</label>
										<input type="file" name="uploadFile" id="file"> <!--multiple 속성은 파일 여러개 올리는거라 뺐음-->
									</div>
								</h5>    
	                        </div>
	                    </div> <!-- resumeConWrap 끝-->
	                </div> <!--infoWrap끝 : 개인정보  -->
	
	                <div class="sectionCon careerWrap">
	                    <div class="sectionTitleWrap modify">
	                        <h3 class="sectionTitle carrer">경력</h3>
	                        <!-- <div class="addForm">
	                            <span class="icon">
	                                <i class="fa-solid fa-plus"></i>
	                            </span>
	                            <h5 class="add">추가</h5>  
	                        </div> -->
	                    </div>
	                    <div class="sectionConBody carrer">
	                        <div class="Bodycon career">
	                            <div class="year">
	                                <input class="from" type="date" name="career_start">
	                                ~
	                                <input class="to" type="date" name="career_end">
	                            </div>
	                            <input class="company" type="text" maxlength="20" placeholder="회사명" name="resume_comName">
	                            <input class="department" type="text" maxlength="20" placeholder="부서명" name="resume_comPart">
	                            <input class="position" type="text" maxlength="20" placeholder="직책" name="resume_comPosition">
	                            <select id="state" name="resume_status">
	                                <option value="재직중">재직중</option>
	                                <option value="퇴사">퇴사</option>
	                            </select>
	                            <!-- <span class="icon delete">
	                                <i class="fa-regular fa-trash-can"></i>
	                            </span> -->
	                        </div> 	                                              
	                    </div> <!-- sectionConBody 끝 -->
	                </div> <!-- careerWrap 끝 -->
	
	                <div class="sectionCon schoolWrap">
	                    <div class="sectionTitleWrap modify">
	                        <h3 class="sectionTitle school">학력</h3>
	                        <!-- <div class="addForm">
	                            <span class="icon">
	                                <i class="fa-solid fa-plus"></i>
	                            </span>
	                            <h5 class="add">추가</h5>  
	                        </div> -->
	                    </div>
	                    <div class="sectionConBody school">
	                        <div class="Bodycon school">
	                            <div class="year">
	                                <input class="from" type="date" name="resume_eduStart">
	                                ~
	                                <input class="to" type="date" name="resume_eduEnd">
	                            </div>
	                            <input class="school" type="text" maxlength="20" placeholder="학교명" name="resume_eduName">
	                            <input class="school" type="text" maxlength="20" placeholder="전공" name="resume_eduMajor">
	                            <select name="resume_eduStatus" id="resume_eduStatus">
	                                <option value="졸업">졸업</option>
	                                <option value="졸업예정">졸업예정</option>
	                                <option value="재학중">재학중</option>
	                                <option value="휴학중">휴학중</option>
	                            </select>
	                            <!-- <span class="icon delete">
	                                <i class="fa-regular fa-trash-can"></i>
	                            </span> -->
	                        </div>	                        
	                    </div> <!-- sectionConBody 끝 -->
	                </div> <!-- schoolWrap 끝 -->
	
	                <div class="sectionCon academyWrap">
						<div class="sectionTitleWrap modify">
							<h3 class="sectionTitle academy">경험. 활동. 교육</h3>
	                        <!-- <div class="addForm">
	                            <span class="icon">
	                                <i class="fa-solid fa-plus"></i>
	                            </span>
	                            <h5 class="add">추가</h5>  
	                        </div> -->
	                    </div>	
	                    <div class="sectionConBody academy">
	                        <div class="Bodycon academy">
	                            <div class="year">
	                                <input class="from" type="date" name="resume_exStart">
	                                ~
	                                <input class="to" type="date" name="resume_exEnd">
	                            </div>	                           
								<input class="where" type="text" maxlength="20" placeholder="기관/장소명" name="resume_exName">
								<input class="where" type="text" maxlength="20" placeholder="교육내용" name="resume_exContent">
	                            <!-- <span class="icon delete">
	                                <i class="fa-regular fa-trash-can"></i>
	                            </span>                          -->
	                        </div>	                        
	                    </div> <!-- sectionConBody 끝 -->
	                </div> <!-- academyWrap 끝 -->
	
	                <div class="sectionCon prizeWrap">
	                    <div class="sectionTitleWrap modify">
	                        <h3 class="sectionTitle prize">자격. 어학. 수상</h3>
	                        <!-- <div class="addForm">
	                            <span class="icon">
	                                <i class="fa-solid fa-plus"></i>
	                            </span>
	                            <h5 class="add">추가</h5>  
	                        </div> -->
	                    </div>
	                    <div class="sectionConBody prize">
	                        <div class="Bodycon prize">	                           
								<input class="from" type="date" name="resume_licenseDate">
	                            <input class="certificate" type="text" maxlength="20" placeholder="자격/어학/수상명" name="resume_licenseContent">
	                            <!-- <span class="icon delete">
	                                <i class="fa-regular fa-trash-can"></i>
	                            </span> -->
	                        </div>	                       
	                    </div> <!-- sectionConBody 끝 -->
	                </div> <!-- prizeWrap 끝 -->                
	
	                <div class="sectionCon portfolio">
	                    <div class="sectionTitleWrap modify">
	                        <h3 class="sectionTitle portfolio">포트폴리오 및 문서</h3>
	                        <!-- <div class="addForm">
	                            <span class="icon">
	                                <i class="fa-solid fa-plus"></i>
	                            </span>
	                            <h5 class="add">추가</h5>  
	                        </div> -->
	                    </div>                   
	
	                    <div class="sectionConBody portfolio">
	                        <div class="Bodycon portfolio">                            
	                            <input class="document" type="text" maxlength="20" placeholder="포트폴리오명" name="resume_portfolio_name">
	                            <input class="document" type="text" placeholder="포트폴리오 url" name="resume_portfolio_url">
	                            <!-- <span class="icon delete">
	                                <i class="fa-regular fa-trash-can"></i>
	                            </span> -->
	                        </div>	                        
	                    </div> <!-- sectionConBody 끝 -->
	                </div> <!-- prizeWrap 끝 -->
	                
	                <div class="sectionCon techWrap">
	                    <div class="sectionTitleWrap modify">
	                        <h3 class="sectionTitle tech">기술 스택 · 툴</h3>
	                        <button class="saveTech" type="button">저장</button>
	                    </div>                    
	                    <div class="sectionConBody tech">
	                        <div class="Bodycon tech">
								<input type="hidden" class="techValue" id="techValue" name="resume_stack"> <!-- resume_stack value 저장장소-->
	                            <div class="techCon">
	                                <div class="buttonTitle">기술</div>
	                                <div class="buttonWrap">	                                    
										<c:forEach var="dto" items="${stack_name}">
											<input type="button" class="tech" name="resume_stack" value="${dto.stack_name}">
										</c:forEach>
	                                </div>
	                            </div>    
	                            <div class="techCon">
	                                <div class="buttonTitle">디자인</div>
	                                <div class="buttonWrap">
	                                    <c:forEach var="dto" items="${stack_name2}">
											<input type="button" class="tech" name="resume_stack" value="${dto.stack_name}">
										</c:forEach>
	                                </div>
	                            </div>
	                            <div class="techCon">
	                                <div class="buttonTitle">기획</div>
	                                <div class="buttonWrap">
	                                    <c:forEach var="dto" items="${stack_name3}">
											<input type="button" class="tech" name="resume_stack" value="${dto.stack_name}">
										</c:forEach>
	                                </div>
	                            </div>                        
	                        </div>                        
	                    </div> <!-- sectionConBody 끝 -->
	                </div> <!-- techWrap 끝 -->
	
	                <div class="sectionCon introduceWrap">
	                    <div class="sectionTitleWrap modify">
	                        <h3 class="sectionTitle tech">자기소개서</h3>
	                        <!-- <div class="addForm">
	                            <span class="icon">
	                                <i class="fa-solid fa-plus"></i>
	                            </span>
	                            <h5 class="add">추가</h5>  
	                        </div> -->
	                    </div>
	                    <div class="sectionConBody introduce">
	                        <div class="Bodycon introduce">
	                            <textarea name="resume_intro" id="introduceTxt" style="width: 100%; height: 300px;line-height: 24px;"></textarea>                            
	                        </div>                        
	                    </div> <!-- sectionConBody 끝 -->
	                </div> <!-- techWrap 끝 -->
	                <div class="resumeAllWrite">
	                    <!-- <button class="resumeAllWrite">이력서 작성하기</button> -->
	                    <button class="resumeAllWrite" type="submit">이력서 작성하기</button>
	                </div>
				</form>
            </div> <!-- sectionInner 끝 : 전체 1200 영역-->
        </section>
		
		<%@ include file="footer.jsp" %> 	
	</div>	
</body>
</html>
<script>
	
	$(document).ready(function()
	{	

		// 기술버튼 눌렀을때 toggle active
	    $('.Bodycon.tech input.tech').click(function(){
	        $(this).toggleClass('active');
	    });	
		
// =============================================================================	
	
		// 기술 버튼 눌렀을때 값 받아오는거
		var buttons = $('.Bodycon.tech input.tech');
		var techValue = $('#techValue');		
		var submit = $('button.saveTech');
		// 제출 버튼 클릭 시
		submit.on('click', function() {
	        // 'on' 클래스가 있는 버튼들의 값을 배열에 저장
	        var buttonValues = [];
	        buttons.filter('.active').each(function() {
	            buttonValues.push($(this).val());
	        });
	
	        // AJAX 요청을 통해 서버로 데이터 전송
	        $.ajax({
	            url: "/resumeWrite", // 실제 서버 엔드포인트 URL
	            type: "POST",  
	            async: false,          
	            data: JSON.stringify({resume_stack: buttonValues}),
	            success: function(response) {
	                // 선택된 값을 wishJob 입력 필드에 쉼표로 구분된 문자열로 표시
	                techValue.val(buttonValues.join(', '));
	            },
	            error: function(response) {
	                // 요청 중 오류 발생 시 처리
	                console.error(response);
	            }
	        }); //ajax 끝       		
		}); // submit click 끝
		
// =============================================================================
		
		// 이미지 업로드
		var formObj = $("form[id='frm']");

		$("button[type='submit']").on("click", function(e){
			e.preventDefault();
			console.log("submit clicked");

			var str="";

			$(".uploadResult ul li").each(function (i, obj){
				console.log("@# obj=>"+$(obj));
				console.log("@# obj=>"+$(obj).data());
				console.log("@# obj=>"+$(obj).data("fileName"));
				// return;

				var jobj = $(obj);
				// JavaScript개체의 속성에 대한 목록을 표시
				console.dir(jobj);
				console.log("================================");
				console.log(jobj.data("filename"));
				console.log(jobj.data("uuid"));
				console.log(jobj.data("path"));
				console.log(jobj.data("type"));

				str += "<input type='hidden' name='resumeUploadList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
				str += "<input type='hidden' name='resumeUploadList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
				str += "<input type='hidden' name='resumeUploadList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
				str += "<input type='hidden' name='resumeUploadList["+i+"].image' value='"+jobj.data("type")+"'>";
			});//end of uploadResult ul li

			console.log(str);
			// return;
			formObj.append(str).submit();
		});//end of button submit

		//확장자(exe, sh, alz), 파일크기(5MB 미만) 조건
		//확장자가 exe|sh|alz 업로드 금지하기 위한 정규식
		var regex = new RegExp("(.*?)\.(exe|sh|alz)$");
		var maxSize = 5242880;//5MB

		function checkExtension(fileName, fileSize){
			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
			if(regex.test(fileName)){
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;
		}

		$("input[type='file']").change(function (e){
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			//files : 파일정보
			var files = inputFile[0].files;

			for(var i=0; i<files.length; i++){
				console.log("@# files=>"+files[i].name);

				//파일크기와 종류중에서 거짓이면 리턴
				if(!checkExtension(files[i].name, files[i].size)){
					return false;
				}

				//파일 정보를 formData에 추가
				formData.append("uploadFile",files[i]);
			} // for 끝

			$.ajax({
				 type: "post"
				,data: formData
				//컨트롤러단 호출
				,url: "resumeUploadAjaxAction"
//processData : 기본은 key/value 를 Query String 으로 전송하는게 true
//(파일 업로드는 false)
				,processData: false
//contentType : 기본값 : "application / x-www-form-urlencoded; charset = UTF-8"
//첨부파일은 false : multipart/form-data로 전송됨
				,contentType: false
				,success: function(result){
					alert("사진 업로드 완료");
					console.log(result);
					//파일정보들을 함수로 보냄
					showUploadResult(result);//업로드 결과 처리 함수 
				}
			});//end of ajax

			function showUploadResult(uploadResultArr){
				if(!uploadResultArr || uploadResultArr.length == 0){
					return;
				}

				var uploadUL = $(".uploadResult ul");
				var str="";

				$(uploadResultArr).each(function (i, obj){
					//image type
					if (obj.image) {
						console.log("@# obj.uploadPath=>"+obj.uploadPath);
						console.log("@# obj.uuid=>"+obj.uuid);
						console.log("@# obj.fileName=>"+obj.fileName);

						// var fileCallPath = obj.uploadPath + obj.uuid + "_" + obj.fileName;
						// var fileCallPath = encodeURIComponent(obj.uploadPath +"/"+ obj.uuid + "_" + obj.fileName);
						var fileCallPath = encodeURIComponent(obj.uploadPath +"/s_"+ obj.uuid + "_" + obj.fileName);
						// str += "<li><div>";

						str += "<li data-path='" + obj.uploadPath + "'";
						str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>";
						str +="<div class='uploadImg'>";						
							// @@ 이미지 출력 안되면 여기 확인하기!!
						str += "<img src='/resumeDisplay?fileName="+fileCallPath+"'>";//이미지 출력 처리(컨트롤러단)						
						str += "</div>";
						str +="<div class='imgController'>";						
						str += "<span class='imgName'>"+obj.fileName+"</span>";
							// @@ 이미지 삭제버튼 (어떻게 바꿀지 생각하기)
						str += "<span data-file=\'"+ fileCallPath +"\'data-type='image' class='imgDelete'> X </span>";
						str += "</div>";
						str += "</div></li>";
						
					} else { // @@ 파일일때 구문 시작 (파일은 업로드 안되게하면 어떻게할지 생각하기)
						// var fileCallPath = obj.uploadPath + obj.uuid + "_" + obj.fileName;
						var fileCallPath = encodeURIComponent(obj.uploadPath +"/"+ obj.uuid + "_" + obj.fileName);
						// str += "<li><div>";

						str += "<li data-path='" + obj.uploadPath + "'";
						str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'"
						str + " ><div>";

						str += "<span>"+obj.fileName+"</span>";
						str += "<img src='./resources/img/attach.png'>";
						str += "<span data-file=\'"+ fileCallPath +"\'data-type='file'> 삭제 </span>";
						str += "</div></li>";
					}		// @@ 파일일때 구문 끝 (파일은 업로드 안되게하면 어떻게할지 생각하기)
					
				});//end of each

				//div class 에 파일 목록 추가
				uploadUL.append(str);
			} // function showUploadResult 끝

			$(".uploadResult").on("click","span",function(){
				var targetFile = $(this).data("file");
				var type = $(this).data("type");
				var uploadResultItem = $(this).closest("li");

				console.log("@# targetFile=>"+targetFile);
				console.log("@# type=>"+type);
				console.log("@# uploadResultItem=>"+uploadResultItem);

				//컨트롤러 단에서 업로드된 실제파일 삭제
				$.ajax({
					 type: "post"
					,data: {fileName: targetFile, type: type}
					,url: "resumeDeleteFile"
					,success: function(result){
						alert(result);
						//브라우저에서 해당 썸네일이나 첨부파일이미지 제거
						uploadResultItem.remove();
					}
				});//end of ajax
			});//end of uploadResult click
		});//end of change  // 이미지 업로드 끝
		
// ============================================================================================
		// 나이계산하기
        const today = new Date();
        const birthDate = "<c:out value='${userInfo.user_birthdate}'/>"; 
        const birth = birthDate.substring(0,4);

        let age = today.getFullYear() - birth+ 1;
        const Age = document.querySelector('.age');

        console.log(birth);
        console.log(today);
        console.log(age);
        Age.append(age);

	});// ready 끝
</script>