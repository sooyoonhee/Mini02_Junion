<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>개인-마이페이지-메인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/individualMain.css">
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
		<%@ include file="nav_individual.jsp" %>
		<div class="mainContent">
			<header>
				<div class="userWrapper">
					<img src="images/people.svg"alt="">
					<div class="dorpdowmMain">
						<div class="dropdown">
							<div class="dropdownSub" id="dropdownSub">
								<h4 class="name" name="user_name" style="cursor: pointer;">${login_name}</h4>
								<div class="dropdownContent" id="dropdownContent">
									<a href="userInfo"><div>개인 정보 관리</div></a>
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
		                <div class="memberInfo">
		                    <img src="images/people.svg" alt="#" class="memberImg">
<!--		                    <h3 class="memberName">이주빈</h3>-->
		                    <h3 class="memberName">${login_name} 회원님</h3>
		                </div>

		                <div class="tabWrap">
		                    <div class="tabCon All">
		                        <h3 class="tabTitle">
		                            <a href="#">전체</a>
		                        </h3>
		                        <h3 class="tabNum">
		                            <a href="#">7</a>
		                        </h3>
		                    </div>
		                    <div class="tabCon proposal">
		                        <h3 class="tabTitle">
		                            <a href="#">받은제안</a>
		                        </h3>
		                        <h3 class="tabNum">
		                            <a href="#">1</a>
		                        </h3>
		                    </div>                    
		                    <div class="tabCon post">
		                        <h3 class="tabTitle">
		                            <a href="#">관심기업</a>
		                        </h3>
		                        <h3 class="tabNum">
		                            <a href="#">10</a>
		                        </h3>
		                    </div>
		                </div>

		                <div class="cardWrap">
		                    <div class="cardConWrap All">
		                        <div class="cardCon">
		                            <div class="cardConTop">
		                                <h5 class="type">전체-포지션제안</h5>
		                                <h5 class="date">2024.06.19</h5>
		                            </div>
		                            <div class="cardConBottom">
		                                <h3 class="title">Java, 백앤드 포지션 경력무관 모집합니다</h3>
		                                <h5 class="company">브레인즈컴퍼니</h5>
		                            </div>
		                        </div>
		                        <div class="cardCon">
		                            <div class="cardConTop">
		                                <h5 class="type">포지션제안</h5>
		                                <h5 class="date">2024.06.19</h5>
		                            </div>
		                            <div class="cardConBottom">
		                                <h3 class="title">Java, 백앤드 포지션 경력무관 모집합니다</h3>
		                                <h5 class="company">브레인즈컴퍼니</h5>
		                            </div>
		                        </div>
		                        <div class="cardCon">
		                            <div class="cardConTop">
		                                <h5 class="type">포지션제안</h5>
		                                <h5 class="date">2024.06.19</h5>
		                            </div>
		                            <div class="cardConBottom">
		                                <h3 class="title">Java, 백앤드 포지션 경력무관 모집합니다</h3>
		                                <h5 class="company">브레인즈컴퍼니</h5>
		                            </div>
		                        </div>
		                        <div class="cardCon">
		                            <div class="cardConTop">
		                                <h5 class="type">포지션제안</h5>
		                                <h5 class="date">2024.06.19</h5>
		                            </div>
		                            <div class="cardConBottom">
		                                <h3 class="title">Java, 백앤드 포지션 경력무관 모집합니다</h3>
		                                <h5 class="company">브레인즈컴퍼니</h5>
		                            </div>
		                        </div>
		                    </div> <!-- cardConWrap All 끝 -->

		                    <div class="cardConWrap proposal">
		                        <div class="cardCon">
		                            <div class="cardConTop">
		                                <h5 class="type">포지션제안</h5>
		                                <h5 class="date">2024.06.19</h5>
		                            </div>
		                            <div class="cardConBottom">
		                                <h3 class="title">Java, 백앤드 포지션 경력무관 모집합니다</h3>
		                                <h5 class="company">브레인즈컴퍼니</h5>
		                            </div>
		                        </div>
		                        <div class="cardCon">
		                            <div class="cardConTop">
		                                <h5 class="type">포지션제안</h5>
		                                <h5 class="date">2024.06.19</h5>
		                            </div>
		                            <div class="cardConBottom">
		                                <h3 class="title">Java, 백앤드 포지션 경력무관 모집합니다</h3>
		                                <h5 class="company">브레인즈컴퍼니</h5>
		                            </div>
		                        </div>
		                        <div class="cardCon">
		                            <div class="cardConTop">
		                                <h5 class="type">포지션제안</h5>
		                                <h5 class="date">2024.06.19</h5>
		                            </div>
		                            <div class="cardConBottom">
		                                <h3 class="title">Java, 백앤드 포지션 경력무관 모집합니다</h3>
		                                <h5 class="company">브레인즈컴퍼니</h5>
		                            </div>
		                        </div>
		                        <div class="cardCon">
		                            <div class="cardConTop">
		                                <h5 class="type">포지션제안</h5>
		                                <h5 class="date">2024.06.19</h5>
		                            </div>
		                            <div class="cardConBottom">
		                                <h3 class="title">Java, 백앤드 포지션 경력무관 모집합니다</h3>
		                                <h5 class="company">브레인즈컴퍼니</h5>
		                            </div>
		                        </div>
		                    </div> <!-- cardConWrap proposal 끝 -->


		                    <div class="cardConWrap post">
		                        <div class="cardCon">
		                            <div class="cardConTop">
		                                <h5 class="type">관심기업공고</h5>
		                                <h5 class="date">2024.06.19</h5>
		                            </div>
		                            <div class="cardConBottom">
		                                <h3 class="title">Java, 백앤드 포지션 경력무관 모집합니다</h3>
		                                <h5 class="company">브레인즈컴퍼니</h5>
		                            </div>
		                        </div>
		                        <div class="cardCon">
		                            <div class="cardConTop">
		                                <h5 class="type">포지션제안</h5>
		                                <h5 class="date">2024.06.19</h5>
		                            </div>
		                            <div class="cardConBottom">
		                                <h3 class="title">Java, 백앤드 포지션 경력무관 모집합니다</h3>
		                                <h5 class="company">브레인즈컴퍼니</h5>
		                            </div>
		                        </div>
		                        <div class="cardCon">
		                            <div class="cardConTop">
		                                <h5 class="type">포지션제안</h5>
		                                <h5 class="date">2024.06.19</h5>
		                            </div>
		                            <div class="cardConBottom">
		                                <h3 class="title">Java, 백앤드 포지션 경력무관 모집합니다</h3>
		                                <h5 class="company">브레인즈컴퍼니</h5>
		                            </div>
		                        </div>
		                        <div class="cardCon">
		                            <div class="cardConTop">
		                                <h5 class="type">포지션제안</h5>
		                                <h5 class="date">2024.06.19</h5>
		                            </div>
		                            <div class="cardConBottom">
		                                <h3 class="title">Java, 백앤드 포지션 경력무관 모집합니다</h3>
		                                <h5 class="company">브레인즈컴퍼니</h5>
		                            </div>
		                        </div>
		                    </div> <!-- cardConWrap post 끝 -->

		                </div> <!-- cardWrap 끝 -->

		                <div class="tableWrap">
		                    <div class="tableConWrap resume">

		                        <div class="tabConDiv">
		                            <div class="tabCon resume active">이력서</div>
		                            <div class="tabCon join">입사지원관리</div>
		                            <div class="tabCon requestPosition">제안받은 포지션</div>
		                        </div>

		                        <div class="tableDiv">

		                            <div class="tableCon resume">
		                                <div class="con">
		                                    <div class="state active">기본</div>
		                                    <div class="textWrap">
		                                        <h4>함께 일하고 싶은 동료 이주빈입니다.</h4>
		                                        <h5>포지션 제안 받는 중 <span class="hireDate">2024.06.01</span></h5>
		                                    </div>
		                                    <h5 class="writeDate">24.06.01</h5>
		                                </div>
		                                <div class="con">
		                                    <div class="state active">기본</div>
		                                    <div class="textWrap">
		                                        <h4>함께 일하고 싶은 동료 이주빈입니다.</h4>
		                                        <h5>포지션 제안 받는 중 <span class="hireDate">2024.06.01</span></h5>
		                                    </div>
		                                    <h5 class="writeDate">24.06.01</h5>
		                                </div>
		                                <button class="add">이력서 추가하기</button>                                
		                            </div>

		                            <div class="tableCon join">
		                                <div class="con">
		                                    <div class="state">채용마감</div>
		                                    <div class="textWrap">
		                                        <h4>Java, 백앤드 포지션 경력무관 채용공고</h4>
		                                        <div class="condition">
		                                            <h5 class="career">경력무관</h5>
		                                            <h5 class="school">학력무관</h5>
		                                            <h5 class="location">서울 성동구</h5>
		                                            <h5 class="hireDate">2024.06.01</h5>
		                                        </div>                                        
		                                    </div>
		                                    <div class="rightWrap">
		                                        <button class="estimate">평가하기</button>
		                                        <div class="icon delete">
		                                            <i class="fa-regular fa-trash-can"></i>
		                                        </div>
		                                    </div>
		                                </div>
		                                <div class="con">
		                                    <div class="state active">채용중</div>
		                                    <div class="textWrap">
		                                        <h4>함께 일하고 싶은 동료 이주빈입니다.</h4>
		                                        <div class="condition">
		                                            <h5 class="career">경력무관</h5>
		                                            <h5 class="school">학력무관</h5>
		                                            <h5 class="location">서울 성동구</h5>
		                                            <h5 class="hireDate">2024.06.01</h5>
		                                        </div>  
		                                    </div>
		                                    <div class="rightWrap">
		                                        <button class="cancel">지원취소</button>
		                                        <div class="icon delete">
		                                            <i class="fa-regular fa-trash-can"></i>
		                                        </div>
		                                    </div>
		                                </div>
		                                <button class="more">더보기</button>  
		                            </div>
		                            <div class="tableCon requestPosition">
		                                <div class="con">
		                                    <div class="state">응답가능</div>
		                                    <div class="textWrap">
		                                        <h4>Java, 백앤드 포지션 경력무관 채용공고</h4>
		                                        <div class="condition">
		                                            <h5 class="career">경력무관</h5>
		                                            <h5 class="school">학력무관</h5>
		                                            <h5 class="location">서울 성동구</h5>
		                                            <h5 class="hireDate">2024.06.01</h5>
		                                        </div>                                        
		                                    </div>
		                                    <div class="rightWrap">
		                                        <button class="check">자세히보기</button>                                        
		                                    </div>
		                                </div>
		                                <div class="con">
		                                    <div class="state">응답가능</div>
		                                    <div class="textWrap">
		                                        <h4>Java, 백앤드 포지션 경력무관 채용공고</h4>
		                                        <div class="condition">
		                                            <h5 class="career">경력무관</h5>
		                                            <h5 class="school">학력무관</h5>
		                                            <h5 class="location">서울 성동구</h5>
		                                            <h5 class="hireDate">2024.06.01</h5>
		                                        </div>                                        
		                                    </div>
		                                    <div class="rightWrap">
		                                        <button class="check">자세히보기</button>                                        
		                                    </div>                                    
		                                </div>
		                                <button class="more">더보기</button>
		                            </div>

		                        </div>
		                    </div>


		                    <div class="tableConWrap notice">
		                        <div class="tabConDiv">
		                            <div class="tabCon active postNotice">스크랩 공고</div>
		                            <div class="tabCon recentNotice">최근 본 공고</div>
		                            <div class="tabCon interestCompany">관심기업</div>
		                        </div>
		                        <div class="tableDiv">
		                            <div class="tableCon postNotice">
		                                <div class="con">
		                                    <div class="textWrap">
		                                        <h4>Java, 백앤드 포지션 경력무관 채용공고</h4>
		                                        <div class="condition">
		                                            <h5 class="career">경력무관</h5>
		                                            <h5 class="school">학력무관</h5>
		                                            <h5 class="location">서울 성동구</h5>
		                                            <h5 class="hireDate">2024.06.01</h5>
		                                        </div>                                        
		                                    </div>
		                                    <div class="rightWrap">
		                                        <button class="apply">즉시지원</button>                                        
		                                    </div>                                    
		                                </div>
		                                <button class="more">더보기</button>
		                            </div>
		                            <div class="tableCon recentNotice">
		                                <div class="con">
		                                    <div class="textWrap">
		                                        <h4>Java, 백앤드 포지션 경력무관 채용공고</h4>
		                                        <div class="condition">
		                                            <h5 class="career">경력무관</h5>
		                                            <h5 class="school">학력무관</h5>
		                                            <h5 class="location">서울 성동구</h5>
		                                            <h5 class="hireDate">2024.06.01</h5>
		                                        </div>                                        
		                                    </div>
		                                    <div class="rightWrap">
		                                        <button class="apply">즉시지원</button>                                        
		                                    </div>                                    
		                                </div>
		                                <div class="con">
		                                    <div class="textWrap">
		                                        <h4>Java, 백앤드 포지션 경력무관 채용공고</h4>
		                                        <div class="condition">
		                                            <h5 class="career">경력무관</h5>
		                                            <h5 class="school">학력무관</h5>
		                                            <h5 class="location">서울 성동구</h5>
		                                            <h5 class="hireDate">2024.06.01</h5>
		                                        </div>                                        
		                                    </div>
		                                    <div class="rightWrap">
		                                        <button class="apply">즉시지원</button>                                        
		                                    </div>                                    
		                                </div>
		                                <button class="more">더보기</button>
		                            </div>
		                            <div class="tableCon interestCompany">
		                                <div class="con">
		                                    <div class="textWrap">
		                                        <h4 class="companyName">브레인즈컴퍼니</h4>
		                                        <div class="business">
		                                            <h5 class="businessType">전자감지장치 제조업</h5>
		                                        </div>                                        
		                                    </div>
		                                    <div class="rightWrap">
		                                        <button class="applyCondition">채용중</button>                                        
		                                    </div>                                    
		                                </div>
		                                <div class="con">
		                                    <div class="textWrap">
		                                        <h4 class="companyName">브레인즈컴퍼니</h4>
		                                        <div class="business">
		                                            <h5 class="businessType">전자감지장치 제조업</h5>
		                                        </div>                                        
		                                    </div>
		                                    <div class="rightWrap">
		                                        <button class="applyCondition">채용중</button>                                        
		                                    </div>                                    
		                                </div>
		                                <button class="more">더보기</button>
		                                </div>
		                            </div>
		                        </div>
		                </div> <!-- tableWrap 끝 --> 
		                
		                <div class="recommendNoticeWrap">
		                    <h5 class="recommendTxt">추천해요</h5>
		                    <div class="recommendNotice">
		                        <div class="recommendNoticeCon">
		                            <div class="imgWrap">
		                                <img src="images/company.svg" alt="#">
		                                <span class="icon">
		                                    <i class="fa-regular fa-bookmark"></i>
		                                </span>
		                            </div>
		                            <h4 class="recommendNoticeTitle">[Web Product 팀] 프론트 엔드 엔지니어 (3년 이상)</h4>
		                            <h5 class="recommendCompanyName">브레인즈컴퍼니</h5>
		                            <div class="recommendBottom">
		                                <h5 class="location">서울 성동구</h5>
		                                <h5 class="needCarrer">경력3~5년</h5>
		                            </div>
		                        </div>
		                        <div class="recommendNoticeCon">
		                            <div class="imgWrap">
		                                <img src="images/company.svg" alt="#">
		                                <span class="icon">
		                                    <i class="fa-regular fa-bookmark"></i>
		                                </span>
		                            </div>
		                            <h4 class="recommendNoticeTitle">[Web Product 팀] 프론트 엔드 엔지니어 (3년 이상)</h4>
		                            <h5 class="recommendCompanyName">브레인즈컴퍼니</h5>
		                            <div class="recommendBottom">
		                                <h5 class="location">서울 성동구</h5>
		                                <h5 class="needCarrer">경력3~5년</h5>
		                            </div>
		                        </div>
		                        <div class="recommendNoticeCon">
		                            <div class="imgWrap">
		                                <img src="images/company.svg" alt="#">
		                                <span class="icon">
		                                    <i class="fa-regular fa-bookmark"></i>
		                                </span>
		                            </div>
		                            <h4 class="recommendNoticeTitle">[Web Product 팀] 프론트 엔드 엔지니어 (3년 이상)</h4>
		                            <h5 class="recommendCompanyName">브레인즈컴퍼니</h5>
		                            <div class="recommendBottom">
		                                <h5 class="location">서울 성동구</h5>
		                                <h5 class="needCarrer">경력3~5년</h5>
		                            </div>
		                        </div>
		                        <div class="recommendNoticeCon">
		                            <div class="imgWrap">
		                                <img src="images/company.svg" alt="#">
		                                <span class="icon">
		                                    <i class="fa-regular fa-bookmark"></i>
		                                </span>
		                            </div>
		                            <h4 class="recommendNoticeTitle">[Web Product 팀] 프론트 엔드 엔지니어 (3년 이상)</h4>
		                            <h5 class="recommendCompanyName">브레인즈컴퍼니</h5>
		                            <div class="recommendBottom">
		                                <h5 class="location">서울 성동구</h5>
		                                <h5 class="needCarrer">경력3~5년</h5>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div> <!-- mainContainer 끝 -->                              
		        </main>    
		    </div> <!-- mainContent -->
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