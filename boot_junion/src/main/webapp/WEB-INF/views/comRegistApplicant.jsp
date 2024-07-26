<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공고지원자 확인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/comRegistApplicant.css">
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
	        <main>
	            <div class="containe">
	                <div class="toptitle">
	                    <h3>Java, 백앤드 포지션 경력무관 채용공고</h3>
	                </div>
	                <div class="checkboxwrap">
	                    <div class="check">
	                        <input type="checkbox" name="" id="" class="checkbox1">신규인재
	                    </div>
	                    <div class="check">
	                        
	                        <input type="checkbox" name="" id="" class="checkbox1">열람한 인재 제외

	                    </div>
	                </div>
	            
	                <div class="box">
	                    <div class="left">
	                        <img class="profile" src="images/people.svg">
	                        <div class="pfname" onclick="location.href='이력서'">노OO</div>
	                        <div class="pfage">여 28세</div>    
	                        <div class="pfEntry">신입</div>
	                        <button class="leftbtn">Java </button>
	                        <button class="leftbtn">Spirng </button>
	                        <button class="leftbtn">MySQL </button>
	                    </div>
	                    <div class="right">
	                        <button class="btn">이직제안하기 </button>
	                        <div class="dates">2024-06-28</div>
	                    </div>
	                    <!-- pop -->
	                    <div class="popUp disN">
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
	                                    <div class="job">Java 개발자</div>
	                                    <div class="comname">주니온</div>
	                                    <hr class="pophr">
	                                    <textarea class="comtext" name="" id=""></textarea>
	                                    <hr class="pophr" >
	                                    <div class="posita">채용포지션</div>
	                                        <div class="posit">
	                                        <div class="positinfo">
	                                            <div class="positinfo1">직무</div>
	                                            <div class="positinfo1">Java 개발자</div>
	                                        </div>
	                                        <div class="positinfo">
	                                            <div class="positinfo1">경력</div>
	                                            <div class="positinfo1">경력 무관</div>
	                                        </div>
	                                        <div class="positinfo">
	                                            <div class="positinfo1">연봉</div>
	                                            <div class="positinfo1">3000만원 이상</div>
	                                        </div>
	                                    </div>
	                                    <div class="popB">
	                                        <button class="submit tabBtn">제안하기</button>
	                                    </div>    
	                                </div>
	                                
	                            </div>
	                        </div> 
	                    </div><!-- popUp끝 -->
	                </div>
	                <div class="box">
	                    <div class="left">
	                        <img class="profile" src="images/people.svg">
	                        <div class="pfname" onclick="location.href='이력서'">노OO</div>
	                        <div class="pfage">여 28세</div>    
	                        <div class="pfEntry">신입</div>
	                        <button class="leftbtn">Java </button>
	                        <button class="leftbtn">Spirng </button>
	                        <button class="leftbtn">MySQL </button>
	                    </div>
	                    <div class="right">
	                        <button class="btn">이직제안하기 </button>
	                        <div class="dates">2024-06-28</div>
	                    </div>
	                    <!-- pop -->
	                    <div class="popUp disN">
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
	                                    <div class="job">Java 개발자</div>
	                                    <div class="comname">주니온</div>
	                                    <hr class="pophr">
	                                    <textarea class="comtext" name="" id=""></textarea>
	                                    <hr class="pophr" >
	                                    <div class="posita">채용포지션</div>
	                                        <div class="posit">
	                                        <div class="positinfo">
	                                            <div class="positinfo1">직무</div>
	                                            <div class="positinfo1">Java 개발자</div>
	                                        </div>
	                                        <div class="positinfo">
	                                            <div class="positinfo1">경력</div>
	                                            <div class="positinfo1">경력 무관</div>
	                                        </div>
	                                        <div class="positinfo">
	                                            <div class="positinfo1">연봉</div>
	                                            <div class="positinfo1">3000만원 이상</div>
	                                        </div>
	                                    </div>
	                                    <div class="popB">
	                                        <button class="submit tabBtn">제안하기</button>
	                                    </div>    
	                                </div>
	                                
	                            </div>
	                        </div> 
	                    </div><!-- popUp끝 -->

	                </div>
	                <div class="box">
	                    <div class="left">
	                        <img class="profile" src="images/people.svg">
	                        <div class="pfname" onclick="location.href='이력서'">노OO</div>
	                        <div class="pfage">여 28세</div>    
	                        <div class="pfEntry">신입</div>
	                        <button class="leftbtn">Java </button>
	                        <button class="leftbtn">Spirng </button>
	                        <button class="leftbtn">MySQL </button>
	                    </div>
	                    <div class="right">
	                        <button class="btn">이직제안하기 </button>
	                        <div class="dates">미열람</div>
	                    </div>
	                    <!-- pop -->
	                    <div class="popUp disN">
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
	                                    <div class="job">Java 개발자</div>
	                                    <div class="comname">주니온</div>
	                                    <hr class="pophr">
	                                    <textarea class="comtext" name="" id=""></textarea>
	                                    <hr class="pophr" >
	                                    <div class="posita">채용포지션</div>
	                                        <div class="posit">
	                                        <div class="positinfo">
	                                            <div class="positinfo1">직무</div>
	                                            <div class="positinfo1">Java 개발자</div>
	                                        </div>
	                                        <div class="positinfo">
	                                            <div class="positinfo1">경력</div>
	                                            <div class="positinfo1">경력 무관</div>
	                                        </div>
	                                        <div class="positinfo">
	                                            <div class="positinfo1">연봉</div>
	                                            <div class="positinfo1">3000만원 이상</div>
	                                        </div>
	                                    </div>
	                                    <div class="popB">
	                                        <button class="submit tabBtn">제안하기</button>
	                                    </div>    
	                                </div>
	                                
	                            </div>
	                        </div> 
	                    </div><!-- popUp끝 -->
	                </div>
	                <div class="box">
	                    <div class="left">
	                        <img class="profile" src="images/people.svg">
	                        <div class="pfname" onclick="location.href='이력서'">노OO</div>
	                        <div class="pfage">여 28세</div>    
	                        <div class="pfEntry">신입</div>
	                        <button class="leftbtn">Java </button>
	                        <button class="leftbtn">Spirng </button>
	                        <button class="leftbtn">MySQL </button>
	                    </div>
	                    <div class="right">
	                        <button class="btn">이직제안하기 </button>
	                        <div class="dates">2024-06-28</div>
	                    </div>
	                    <!-- pop -->
	                    <div class="popUp disN">
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
	                                    <div class="job">Java 개발자</div>
	                                    <div class="comname">주니온</div>
	                                    <hr class="pophr">
	                                    <textarea class="comtext" name="" id=""></textarea>
	                                    <hr class="pophr" >
	                                    <div class="posita">채용포지션</div>
	                                        <div class="posit">
	                                        <div class="positinfo">
	                                            <div class="positinfo1">직무</div>
	                                            <div class="positinfo1">Java 개발자</div>
	                                        </div>
	                                        <div class="positinfo">
	                                            <div class="positinfo1">경력</div>
	                                            <div class="positinfo1">경력 무관</div>
	                                        </div>
	                                        <div class="positinfo">
	                                            <div class="positinfo1">연봉</div>
	                                            <div class="positinfo1">3000만원 이상</div>
	                                        </div>
	                                    </div>
	                                    <div class="popB">
	                                        <button class="submit tabBtn">제안하기</button>
	                                    </div>    
	                                </div>
	                                
	                            </div>
	                        </div> 
	                    </div><!-- popUp끝 -->
	                </div>
	                
	            </div> <!-- contain끝 -->
	        </main>
	    
	    </div> <!-- //main-content -->
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



	    // popup 
	    $(".right .btn").on("click",function(e){
	        $(this).parents().siblings(".popUp").css({"display":"flex"});
	    });     

	    $(".popUp .icon.cancel").click(function(){
	        console.log("click");
	        $(this).parents(".popUp").css({"display":"none"}); 
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