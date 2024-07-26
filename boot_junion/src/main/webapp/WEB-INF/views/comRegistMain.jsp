<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공고등록 공란페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/comRegistMain.css">
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
		<%@ include file="nav_company.jsp" %>
		<div class="mainContent">
		        <header>
		            <div class="userWrapper">
		                <img src="images/company.svg"alt="">
						<div class="dorpdowmMain">
							<div class="dropdown">
								<div class="dropdownSub" id="dropdownSub">
									<!-- <h4 class="name" style="cursor: pointer;">${com_name}</h4> -->
									<h4 class="name" style="cursor: pointer;">주니온</h4>
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
		        <main>
		            <div class="mainContainer">
		                <div class="announce">
		                    <div class="announce3">
		                        <img src="images/company.svg"alt="" class="imageAnnouncement">
		                    </div>
		                    <h5 class="announce1">진행중인 공고가 없어요.</h5>
		                    <a href="comRegistUpload" class="announce2">공고작성하러가기</a>
		                </div>
		            </div> <!-- mainContainer -->
		        </main>
		    
		    </div> <!-- //main-contents -->
	</div>                                            
	<%@ include file="footer.jsp" %>
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


	});
	    
	$(document).ready(function () 
    {
        // 로그인_기업 개인 탭 (하지수)

        $(".dropdownSub").click(function () {
            $(".dropdownSub").addClass('active');
            $(".tabC").removeClass('active');
            $('#LoginI').show();
            $('#LoginC').hide();
        });

        $(".tabC").click(function () {
            $(".tabC").addClass('active');
            $(".tabI").removeClass('active');
            $('#LoginI').hide();
            $('#LoginC').show();
        });
        
    });    
	
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