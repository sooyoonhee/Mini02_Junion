<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이력서 상세페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/resumeInfo.css">
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
                <div class="infoWrap">
                    <h3 class="resumeTitle">${resumeInfo.resume_title}</h3>
                    <div class="resumeConWrap">
                        <div class="resumeCon left">
                            <div class="resumeConTop">
                                <h5 class="name">${resumeInfo.user_name}</h5>
                                <div class="ageSex">
                                    <h5 class="age"></h5>
                                    <!-- <h5 class="age">${resumeInfo.resume_age}</h5> -->
                                    <h5 class="sex">${resumeInfo.resume_gender}</h5>
                                </div>
                            </div>
                            <div class="resumeConBottom">
                                <div class="resumeCon mail">
                                    <span class="icon">
                                        <i class="fa-solid fa-envelope"></i>
                                    </span>
                                    <h5>${resumeInfo.user_email}</h5>
                                </div>
                                <div class="resumeCon tel">
                                    <span class="icon">
                                        <i class="fa-solid fa-phone"></i>
                                    </span>
                                    <h5>${resumeInfo.user_tel}</h5>
                                </div>
                                <div class="resumeCon location">
                                    <span class="icon">
                                        <i class="fa-solid fa-location-dot"></i>
                                    </span>
                                    <h5>${resumeInfo.user_address}</h5>
                                </div>
                                <div class="resumeCon wantPay">
                                    <span class="icon">
                                        <i class="fa-solid fa-money-check"></i>
                                    </span>
                                    <h5>${resumeInfo.resume_pay}만원</h5>
                                </div>
                            </div>
                        </div>
                        <div class="resumeCon right">
							<div class="uploadResult">
								<ul class="resumeImage">
								</ul>
							</div>
                            
                        </div>
                    </div> <!-- resumeConWrap 끝-->
                </div> <!--infoWrap끝 : 개인정보  -->

                <div class="sectionCon careerWrap">
                    <h3 class="sectionTitle carrer">경력</h3>

                    <div class="sectionConBody carrer">
                        <div class="Bodycon career">
                            <div class="year">
                                <h5 class="from">${resumeInfo.career_start}</h5>
                                ~
                                <h5 class="to">${resumeInfo.career_end}</h5>
                            </div>
                            <h5 class="company">${resumeInfo.resume_comName}</h5>
                            <h5 class="position">${resumeInfo.resume_comPart}</h5>
                            <h5 class="position">${resumeInfo.resume_comPosition}</h5>
                            <h5 class="state">${resumeInfo.resume_status}</h5>
                        </div>                        
                    </div> <!-- sectionConBody 끝 -->
                </div> <!-- careerWrap 끝 -->

                <div class="sectionCon schoolWrap">
                    <h3 class="sectionTitle school">학력</h3>

                    <div class="sectionConBody school">
                        <div class="Bodycon school">
                            <div class="year">
                                <h5 class="from">${resumeInfo.resume_eduStart}</h5>
                                ~
                                <h5 class="to">${resumeInfo.resume_eduEnd}</h5>
                            </div>
                            <h5 class="school">${resumeInfo.resume_eduName}</h5>
                            <h5 class="position">${resumeInfo.resume_eduMajor}</h5>
                            <h5 class="state">${resumeInfo.resume_eduStatus}</h5>
                        </div>                        
                    </div> <!-- sectionConBody 끝 -->
                </div> <!-- schoolWrap 끝 -->

                <div class="sectionCon academyWrap">
                    <h3 class="sectionTitle academy">경험. 활동. 교육</h3>

                    <div class="sectionConBody academy">
                        <div class="Bodycon academy">
                            <div class="year">
                                <h5 class="from">${resumeInfo.resume_exStart}</h5>
                                ~
                                <h5 class="to">${resumeInfo.resume_exEnd}</h5>
                            </div>                            
                            <h5 class="school">${resumeInfo.resume_exName}</h5>
                            <h5 class="classContent">${resumeInfo.resume_exContent}</h5>                                                       
                        </div>                        
                    </div> <!-- sectionConBody 끝 -->
                </div> <!-- academyWrap 끝 -->

                <div class="sectionCon prizeWrap">
                    <h3 class="sectionTitle prize">자격. 어학. 수상</h3>

                    <div class="sectionConBody prize">
                        <div class="Bodycon prize">                            
                            <h5 class="from">${resumeInfo.resume_licenseDate}</h5>                            
                            <h5 class="certificate">${resumeInfo.resume_licenseContent}</h5>
                        </div>                        
                    </div> <!-- sectionConBody 끝 -->
                </div> <!-- prizeWrap 끝 -->               

                <div class="sectionCon portfolio">
                    <h3 class="sectionTitle portfolio">포트폴리오 및 문서</h3>

                    <div class="sectionConBody portfolio">
                        <div class="Bodycon portfolio">                            
                            <h5 class="document">${resumeInfo.resume_portfolio_name}</h5>
                            <h5 class="documentName">
                                <a href="http://${links}">${resumeInfo.resume_portfolio_url}</a>
                                <!-- <a href="http://${links}">${resumeInfo.resume_portfolio_url}</a> -->
                            </h5>
                        </div>                        
                    </div> <!-- sectionConBody 끝 -->
                </div> <!-- prizeWrap 끝 -->
		                
                <div class="sectionCon techWrap">
                    <h3 class="sectionTitle tech">기술 스택 · 툴</h3>
                    <div class="sectionConBody tech">
                        <div class="Bodycon tech"></div>                        
                    </div> <!-- sectionConBody 끝 -->
                </div> <!-- techWrap 끝 -->

                <div class="sectionCon introduceWrap">
                    <h3 class="sectionTitle introduce">자기소개서</h3>
                    <div class="sectionConBody introduce">
                        <div class="Bodycon introduce">                            
                            <h5 style="text-wrap: wrap; max-width: 100%; width: 100%;">${resumeInfo.resume_intro}</h5>
                        </div>                        
        			</div> <!-- sectionConBody 끝 -->
            	</div> <!-- introduceWrap 끝 -->
            </div> <!-- sectionInner 끝 : 전체 1200 영역-->
    	</section>
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>
<script>
	$(document).ready(function()
	{		
			
		/*
	        2024-06-25 이재원 
	        메뉴 눌렀을 때 메뉴 활성화 : active
	    */
	    $('.navMenu ul li').click(function(){
	        $(this).addClass('active');
	        $('.navMenu ul li').not(this).removeClass('active');
	    });

	    
	    /*
	        2024-06-25 이재원 
	        글자수 제한 + 넘는건 ...처리
	    */
	    $('.cardConBottom > .title').each(function()
	    {
	        var length = 21; //표시할 글자 수 정하기
	    
	        $(this).each(function()
	        {

	            if($(this).text().length >= length)
	            {
	                $(this).text($(this).text().substr(0, length) + '...');	//지정한 글자수 이후 표시할 텍스트 '...'
	            }
	        });
	    });

	    $('.recommendNoticeTitle').each(function()
	    {
	        var length = 28; //표시할 글자 수 정하기
	    
	        $(this).each(function()
	        {

	            if($(this).text().length >= length)
	            {
	                $(this).text($(this).text().substr(0, length) + '...');	//지정한 글자수 이후 표시할 텍스트 '...'
	            }
	        });
	    });

	    /*
	        2024-06-25 이재원 
	        탭 메뉴 : 전체 , 포지션 제안, 관심기업
	    */

	    $('.tabCon.All').click(function(){
	        $('.cardConWrap').css({"display":"none"});
	        $('.cardConWrap.All').css({"display":"flex"});
	    });

	    $('.tabCon.proposal').click(function(){
	        $('.cardConWrap').css({"display":"none"});
	        $('.cardConWrap.proposal').css({"display":"flex"});
	    });

	    $('.tabCon.post').click(function(){
	        $('.cardConWrap').css({"display":"none"});
	        $('.cardConWrap.post').css({"display":"flex"});
	    });

	    /*
	        2024-06-25 이재원 
	        개인-마이페이지 메인에서 탭버튼 활성화 : active
	    */
        $('.tableConWrap.resume .tabConDiv .tabCon.resume').click(function(){
            $(this).addClass('active');
            $('.tableConWrap.resume .tabConDiv .tabCon').not(this).removeClass('active');
            $('.tableConWrap.resume .tableCon').css({"display":"none"});
            $('.tableCon.resume').css({"display":"block"});
        });

        $('.tableConWrap.resume .tabConDiv .tabCon.join').click(function(){
            $(this).addClass('active');
            $('.tableConWrap.resume .tabConDiv .tabCon').not(this).removeClass('active');
            $('.tableConWrap.resume .tableCon').css({"display":"none"});
            $('.tableCon.join').css({"display":"block"});
        });

        $('.tableConWrap.resume .tabConDiv .tabCon.requestPosition').click(function(){
            $(this).addClass('active');
            $('.tableConWrap.resume .tabConDiv .tabCon').not(this).removeClass('active');
            $('.tableConWrap.resume .tableCon').css({"display":"none"});
            $('.tableCon.requestPosition').css({"display":"block"});
        });

        $('.tableConWrap.notice .tabConDiv .tabCon.postNotice').click(function(){
            $(this).addClass('active');
            $('.tableConWrap.notice .tabConDiv .tabCon').not(this).removeClass('active');
            $('.tableConWrap.notice .tableCon').css({"display":"none"});
            $('.tableCon.postNotice').css({"display":"block"});
        });

        $('.tableConWrap.notice .tabConDiv .tabCon.recentNotice').click(function(){
            $(this).addClass('active');
            $('.tableConWrap.notice .tabConDiv .tabCon').not(this).removeClass('active');
            $('.tableConWrap.notice .tableCon').css({"display":"none"});
            $('.tableCon.recentNotice').css({"display":"block"});
        });

        $('.tableConWrap.notice .tabConDiv .tabCon.interestCompany').click(function(){
            $(this).addClass('active');
            $('.tableConWrap.notice .tabConDiv .tabCon').not(this).removeClass('active');
            $('.tableConWrap.notice .tableCon').css({"display":"none"});
            $('.tableCon.interestCompany').css({"display":"block"});
        });

        // 기술스택값 짤라서 뿌리기
        const userStack = "<c:out value='${resumeInfo.resume_stack}'/>";
        const stacks = userStack.split(',');
        let str = "";
        for( let i=0; i < stacks.length; i++) 
        {
            str += "<input type='button' class='tech' value='"+stacks[i].trim()+"'>";       
        }
        
        $(".Bodycon.tech").html(str);

        // 나이계산하기
        const today = new Date();
        const birthDate = "<c:out value='${resumeInfo.resume_age}'/>"; 
        const birth = birthDate.substring(0,4);

        let age = today.getFullYear() - birth+ 1;
        const Age = document.querySelector('.age');

        console.log(birth);
        console.log(today);
        console.log(age);
        Age.append(age);
		
		
		
		
		// 즉시실행함수
		(function(){
			console.log("@# document ready");
			var resume_num = "<c:out value='${resumeInfo.resume_num}'/>";
			console.log("@# resume_num=>"+resume_num);
			
			//컨트롤러단으로 연결				
			// boardNo를 던지면 리턴되는값 : function(arr) => 컨트롤러에 있는 new ResponseEntity<> 객체 전부 가져옴
			$.getJSON("/resumeGetFileList", {resume_num: resume_num}, function(arr)
			{ 
				console.log("@# arr=>"+arr);

				var str="";

				
				$(arr).each(function(i, attach)
				{
								
					//image type
					if(attach.image) 
					{
						var fileCallPath = encodeURIComponent(attach.uploadPath +"/s_"+ attach.uuid + "_" + attach.fileName);

						str += "<li data-path='" + attach.uploadPath + "'";
						str += " data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.image + "'>";
						str + "<div>";						
						str +="<span style='display:none'>"+attach.fileName+"</span>";
						str +="<img src='/resumeDisplay?fileName="+fileCallPath+"'>"; // 이미지 출력 처리(컨트롤러단)
						str +="</div>";
						str +="<div class='imgController'>";
						str +="<span data-file=\'"+fileCallPath+"\'data-type='image' style='cursor:pointer'> X </span>";
						str +="</div>";
						str +="</li>";
					}
					else 
					{
						var fileCallPath = encodeURIComponent(attach.uploadPath +"/"+ attach.uuid + "_" + attach.fileName);
					
						str += "<li data-path='" + attach.uploadPath + "'";
						str += " data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.image + "'"
						str + " ><div>";
						str +="<span>"+attach.fileName+"</span>";
						str +="<img src='./resources/img/attach.png'>";		
						str +="<span data-file=\'"+fileCallPath+"\'data-type='file' style='cursor:pointer'> X </span>";				
						str +="</div>";
						str +="</li>";
					}

				}); // arr.each 끝
				console.log("@#str=======>"+str);
				$(".uploadResult ul").html(str);
			}); // getJSON끝

			$(".uploadResult").on("click","li", function(e){
				console.log("@# uploadResult click");

				var liObj = $(this);
				console.log("@# liobj.path=>"+liObj.data("path"));
				console.log("@# liobj.uuid=>"+liObj.data("uuid"));
				console.log("@# liobj.fileName"+liObj.data("filename"));
				console.log("@# liobj.type"+liObj.data("type"));

				var path = encodeURIComponent(liObj.data("path") +"/"+ liObj.data("uuid") + "_" + liObj.data("filename"));
				console.log("@# var path=>"+path);

				if(liObj.data("type")) 
				{
					console.log("@# 01");
					console.log("@# view");

					showImage(path);
				}
				else 
				{
					console.log("@# 02");
					console.log("@# download");
					console.log("@# path=========>"+ path);
					// 컨트롤러의 download 호출
					//self.location="/download?fileName="+path;// 틀리면 download로 다시바꾸
					self.location="/resumeDownload?fileName="+path;
					
				}
			}); // .uploadResult 클릭 끝

			// 썸네일이미지 눌렀을때 100%로 확대
			function showImage(fileCallPath) 
			{
				// alert(fileCallPath);///

				$(".bigPicture").css("display","flex").show();
				//$(".bigPic").html("<img src='/resumeDisplay?fileName="+fileCallPath+"'>").animate({width:"100%", height:"100%"},1000); 
				 $(".bigPic").html("<img src='/display?fileName="+fileCallPath+"'>").animate({width:"100%", height:"100%"},1000); 
			}

			// 확대한 이미지 다시 되돌리기
			$(".bigPicture").on("click", function(e){
				$(".bigPic").animate({width:"0%", height:"0%"},1000);
				setTimeout(function(){
					$(".bigPicture").hide();
				}); 
			}); // .bigPicture click : 확대한이미지 되돌리기 끝 

		})();
        

	});
</script>