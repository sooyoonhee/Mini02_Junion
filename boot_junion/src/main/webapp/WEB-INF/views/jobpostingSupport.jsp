<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title> 공고관리 지원자 목록페이지 </title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jobpostingSupport.css">
<!--<link rel="stylesheet" href="src/main/resources/static/css/style.css">-->
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<!-- import js -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<style>
    /* 드롭다운 메뉴 */
	.dorpdowmMain
	{
	display: flex;
	}

	.dropdown
	{
	display: flex;
	align-items: center;
	}

	.dropdownSub
	{
	display: flex;
	}

	.dropdownContent 
	{
	position: absolute;
	display: none;
	text-align: center;
	margin-top: 20px;
	width: 160px;
	background-color: var(--color-white);
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0,0,0,0.2);
	right: 11px;
	}

	.dropdownContent a 
	{
	color: var(--color-black);
	padding: 12px;
	text-decoration: none;
	display: block;
	font-size: var(--color-black);
	}
</style>

<script>
	function fn_submit(){
		//form 요소 자체
		var formData = $("#frm").serialize();

		$.ajax({
			 type:"post"
			,data:formData
			,url:"jobpostingOffer"
			,success: function(data){
				alert("저장완료");
				location.href="jobpostingSupport";
			}
			,error: function(){
				alert("오류발생");
			}
		});
	}
</script>

</head>
<body>
<div class="container">
	<%@ include file="nav_company.jsp" %>
    <div class="mainContent">
        <header>
            <div class="userWrapper">
                <img src="images/people.svg"alt="">
                <div class="dorpdowmMain">
                    <div class="dropdown">
                        <div class="dropdownSub" id="dropdownSub">
                            <h4 class="name" name="com_name" style="cursor: pointer;">${login_name}</h4>
                            <div class="dropdownContent" id="dropdownContent">
                                <a href="#"><div>기업 정보 관리</div></a>
                                <a href="logout"><div>로그아웃</div></a>
                            </div> <!-- dropdownContent 끝-->
                            <span class="icon">
                                <i id="iconDown" class="fa-solid fa-caret-down" style="display: block; cursor: pointer;"></i>
                                <i id="iconUp" class="fa-solid fa-caret-up" style="display: none; cursor: pointer;"></i>
                            </span>
                        </div> <!--dropdownSub 끝-->
                    </div> <!--dropdown 끝-->
                </div><!--dropdownMain 끝-->
             </div>
        </header>    
		
		
		
	<!-- ============ 본문 시작 =============-->
        <main>
            <div class="containe">
                <div class="toptitle">
                    <h3>Java, 백앤드 포지션 경력무관 채용공고</h3>
                </div>
<!--                <div class="checkboxwrap">
                    <div class="check">
                        <input type="checkbox" name="" id="" class="checkbox1">신규인재
                    </div>
                    <div class="check">
                        <input type="checkbox" name="" id="" class="checkbox1">열람한 인재 제외
                    </div>
                </div>-->
            
				<!-- 반복문 시작 -->
				<c:forEach items="${jobpostingSupport}" var="sup">
                 <div class="box" data-birth="${sup.resume_age}">
	                    <div class="left">
	                        <img class="profile" src="images/people.svg"> <!-- 이미지 -->
	                        <div class="pfname" onclick="location.href='resumeInfo?resume_num=${sup.resume_num}'">${sup.user_name}</div>
	                        <div class="pfage">${sup.resume_gender} ${sup.korean_age}세</div> 
	                        <div class="pfEntry">${sup.career_month}</div>
	                        <button class="leftbtn">${sup.resume_stack} </button>
<!--	                        <button class="leftbtn">${sup.career_month} </button>  스택
	                        <button class="leftbtn">${sup.career_month} </button>-->
	                    </div>
	                    <div class="right">
<!--	                        <div class="starnum">8.5</div>  별점
	                        <i class="fa-solid fa-star"></i>-->
	                        <button class="btn">이직제안하기 </button>${sup.resume_num}
	                        <div class="dates">${sup.resume_writeDate}</div>
	                    </div>
					
                    <!-- pop -->
                    <div class="popUp disN">
						<form id="frm" method="post" action="jobpostingOffer">
							<input type="hidden" name="resume_num" value="${sup.resume_num}">
	                        <div class="popBg">
	                            <div class="popCon disF flexD">
	                                <div class="popH mlauto">
	                                    <span class="icon cancel fs24">
	                                        <i class="fa-solid fa-xmark"></i>
	                                    </span>
	                                </div>
	                                <div class="popM">
	                                    <div class="title">포지션 제안</div>
	                                    <hr class="pophr">
	                                    <div class="job">
											<input type="text" name="offer_title" placeholder="제목을 입력하시오">
										</div>
	                                    <div class="comname">
											<input type="text" name="offer_name" placeholder="기업명을 입력하시오">
										</div>
	                                    <hr class="pophr">
	                                    <textarea class="comtext" name="" name="offer_content" placeholder="내용을 입력하시오"></textarea>
	                                    <hr class="pophr" >
	                                    <div class="posita">채용포지션</div>
	                                        <div class="posit">
	                                        <div class="positinfo">
	                                            <div class="positinfo1"></div>
	                                            <div class="positinfo1">
													<input type="text" name="offer_job" placeholder="직무를 입력하시오">
												</div>
	                                        </div>
	                                        <div class="positinfo">
	                                            <div class="positinfo1"></div>
	                                            <div class="positinfo1">
													<input type="text" name="offer_career" placeholder="경력을 입력하시오">
												</div>
	                                        </div>
	                                        <div class="positinfo">
	                                            <div class="positinfo1"></div>
	                                            <div class="positinfo1">
													<input type="text" name="offer_pay" placeholder="연봉을 입력하시오">
												</div>
	                                        </div>
	                                    </div>
	                                    <div class="popB">
	                                        <button class="submit tabBtn" type="submit">제안하기</button>
	                                    </div>    
	                                </div>
	                                
	                            </div>
	                        </div> 
						</form> <!-- 폼 끝 -->
                    </div><!-- popUp끝 -->
                </div>
				</c:forEach>
				<!-- 반복문 끝 -->
				
                
            </div> <!-- contain끝 -->
        </main>
		<!-- ============ 본문 끝 =============-->
		
		
		
    </div> <!-- //main-content -->
</div>    
<footer>
    <div class="footerInner">
        <div class="left_conWrap f_conWrap">
            <h5 class="logo">
                <a href="#">
                    <img src="images/logo.svg" alt="#">
                </a>
            </h5>
            <p class="textWrap">
                부산광역시 부산진구 중앙대로 688 한준빌딩 2층<br>
                대표이사 : 주니온<br>
                사업자등록번호 : 123-45-67890 / 통신판매업신고 : 9999-12345호<br>
                이메일 : abcde@naver.com
            </p>
        </div>
        <div class="right_conWrap f_conWrap">
            <h3>1234-5678</h3>
            <p class="textWrap">                        
                오전 9시 ~ 오후 6시(토요일, 공휴일 휴무)<br>
                Copyright ⓒ JUNION ALL RIGHTS RESERVED.
            </p>
        </div>
    </div>
</footer>
    
</body>
</html>



<!-- ------------------------------------------- 스크립트 시작 ------------------------------->
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



	    // popup 
	    $(".right .btn").on("click",function(e){
	        $(this).parents().siblings(".popUp").css({"display":"flex"});
	    });     

	    $(".popUp .icon.cancel").click(function(){
	        console.log("click");
	        $(this).parents(".popUp").css({"display":"none"}); 
	    }); 


	});
	    
	    
	    


	
</script>
<script>
    // 드롭다운 메뉴 (하지수)

    function dropdown() {
        let click = document.getElementById("dropdownContent");
        let iconDown = document.getElementById("iconDown");
        let iconUp = document.getElementById("iconUp");

        if (click.style.display === "none" || click.style.display === "") {
            click.style.display = "block";
            iconDown.style.display = "none";
            iconUp.style.display = "block";
        } else {
            click.style.display = "none";
            iconDown.style.display = "block";
            iconUp.style.display = "none";
        }
    }
    document.getElementById("dropdownSub").addEventListener("click", dropdown); // 드롭다운 메뉴 끝
</script>