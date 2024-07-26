<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>기업-마이페이지-메인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
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
	
	/* 메인 */
main 
{
  display: flex;
  justify-content: center;
  padding-top: 50px;

}

main .mainContainer 
{
  min-width:1200px;

}

/* 프로필 : 사진 + 이름 */
main .mainContainer .memberInfo 
{
  display: flex;
  align-items: center;
  margin-bottom: 40px;
}

main .mainContainer .memberInfo img.memberImg 
{
  width:64px;
  height: 64px;
  margin-right: 20px;
}

main .mainContainer .memberInfo .memberName 
{
  font-size: var(--main-title-size);
  font-weight: 600;
  margin-right: 15px;
} 

main .mainContainer .memberInfo .confirm 
{
  background-color: var(--main-color);
  border-radius: 30px;
  padding: 4px 20px;
  font-size: var(--button-text-size);
  color: var(--color-white);
  margin-right: 12px;
} 

/* 탭버튼 */
main .mainContainer .tabWrap 
{
  display: flex;
  align-items: center;
}

main .mainContainer .tabWrap .tabCon 
{
  display: flex;
  align-items: center;
  margin-right: 40px;
}

main .mainContainer .tabWrap .tabTitle a
{
  font-size: var(--sub-title-size);
  font-weight: 600;
  color: var(--color-black);
  margin-right: 12px;
}

main .mainContainer .tabWrap .tabNum a  
{
  font-size: var(--sub-title-size);
  font-weight: 600;
  color: var(--main-color);
}

/* 탭버튼 연동되는 con*/
main .mainContainer .cardWrap 
{
  margin-top: 20px;
  position: relative;
  margin-bottom: 20%;
}
main .mainContainer .cardWrap .cardConWrap 
{
  position: absolute;
  display: flex;
  gap: 20px;
  width: 100%;
}
main .mainContainer .cardWrap .cardConWrap .cardCon 
{
  width: 25%;
  padding: 20px;
  border: 1px solid var(--input-gray);
  border-radius: 6px;
}

.cardWrap .cardConWrap .cardCon .cardConTop 
{
  display: flex;
  align-items: center;
  margin-bottom: 20px;
}

.cardWrap .cardConWrap .cardCon .cardConTop .type 
{
  margin-right: 12px;
}

.cardWrap .cardConWrap .cardCon .cardConTop .type,
.cardWrap .cardConWrap .cardCon .cardConTop .date,
.cardWrap .cardConWrap .cardCon .cardConBottom .description 
{
  font-size: var(--small-text-size);
  color: #777;
  font-weight: 300;
}

.cardWrap .cardConWrap .cardCon .cardConBottom .title 
{
  font-size: 16px;
  color: var(--color-black);
  font-weight: 600;
  margin-bottom: 8px;
}


main .mainContainer .cardWrap .cardConWrap.company, 
main .mainContainer .cardWrap .cardConWrap.post,
main .mainContainer .cardWrap .cardConWrap.colsePost
{
  display: none;
}


/* 하단 공고/ 인재풀  */

button
{
  cursor: pointer;
}

main .subContainer
{
  display: flex;
  width: 1200px;
  gap: 40px;
}

main .subContainer .notice,
main .subContainer .resume
{
  width: 580px;
  height: 300px;
}

main .subContainer .notice .noticeTitle,
main .subContainer .resume .resumeTitle
{
  font-size: var(--font-size16);
  color: var(--color-black);
  font-weight: 300px;
}

main .subContainer .notice .noticeBody,
main .subContainer .resume .resumeBody
{
  max-width: 580px;
  height: 260px;
  margin-top: 20px;
  border: 1px solid var(--border-color-gray);
  border-radius: 10px;
}

main .subContainer .notice .noticeBody .noticeList
{
  display: flex;
  height: 65px;
  justify-content: center;
  align-items: center;
  box-sizing: border-box;
  padding: 0 20px;
  border-bottom: 1px solid var(--input-gray);
}

main .subContainer .notice .noticeBody .noticeList:last-child,
main .subContainer .resume .resumeBody .people:last-child
{
  border-bottom: none;
}

main .subContainer .notice .noticeBody .noticeList .noticeTitle
{
  font-size: var(--font-size16);
}

main .subContainer .notice .noticeBody .noticeList .noticeType
{
  font-size: var(--font-size12);
  color: var(--color-gray);
}

main .subContainer .notice .noticeBody .noticeList .noticeQual
{
  margin-left: auto;
  font-size: var(--font-size12);
  width: initial;
}
main .subContainer .notice .noticeBody .noticeList .noticeSetting
{
  border: 1px solid var(--button-gray);
  border-radius: 6px;
  padding: 5px 15px;
}

main .subContainer .notice .noticeBody .noticeList .getNotice
{
  border: 1px solid var(--button-gray);
  border-radius: 6px;
  padding: 5px 15px;
}


main .subContainer .resume .resumeBody .people
{
  display: flex;
  height: 65px;
  align-items: center;
  box-sizing: border-box;
  border-bottom: 1px solid var(--input-gray);
}

main .subContainer .resume .resumeBody .people .profile
{
  display: flex;
  gap: 20px;
  margin-right: 30px;
  padding: 0 20px;
}

main .subContainer .resume .resumeBody .people .stack
{
  display: flex;
  gap: 0 10px;
  margin-right: 30px;
}

main .subContainer .resume .resumeBody .people .ageGender,
main .subContainer .resume .resumeBody .people .career,
main .subContainer .resume .resumeBody .people .stack
{
  font-size: var(--font-size12);
}

main .subContainer .resume .resumeBody .people .stackName
{
  border: 1px solid var(--input-gray);
  border-radius: 6px;
  padding: 10px 20px;
  width: initial;
  background-color: var(--button-gray);
}

main .subContainer .resume .resumeBody .people .resumeDate
{
  font-size: var(--font-size14);
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
									<a href="#"><div>기업정보 관리</div></a>
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
						<h3 class="memberName">주니온 회원님</h3>
						<div class="confirm">인증</div>
					</div>

					<div class="tabWrap">
						<div class="tabCon All">
							<h3 class="tabTitle">
								<a href="#">전체 알림</a>
							</h3>
							<h3 class="tabNum">
								<a href="#">7</a>
							</h3>
						</div>
						<div class="tabCon company">
							<h3 class="tabTitle">
								<a href="#">추천 인재풀</a>
							</h3>
							<h3 class="tabNum">
								<a href="#">0</a>
							</h3>
						</div>                    
						<div class="tabCon post">
							<h3 class="tabTitle">
								<a href="#">진행중인 공고</a>
							</h3>
							<h3 class="tabNum">
								<a href="#">0</a>
							</h3>
						</div>
						<div class="tabCon colsePost">
							<h3 class="tabTitle">
								<a href="#">마감된 공고</a>
							</h3>
							<h3 class="tabNum">
								<a href="#">0</a>
							</h3>
						</div>
					</div><!--memberInfo-->

					<div class="cardWrap">
						<div class="cardConWrap All">
							<div class="cardCon">
								<div class="cardConTop">
									<h5 class="type">공고</h5>
									<h5 class="date">06.19</h5>
								</div>
								<div class="cardConBottom">
									<h3 class="title">Java, 백앤드 포지션 경력무관 채용공고</h3>
									<h5 class="description">공고에 이력서 지원이 왔습니다.</h5>
								</div>
							</div>
							<div class="cardCon">
								<div class="cardConTop">
									<h5 class="type">공고</h5>
									<h5 class="date">06.19</h5>
								</div>
								<div class="cardConBottom">
									<h3 class="title">Java, 백앤드 포지션 경력무관 모집합니다</h3>
									<h5 class="description">공고에 이력서 지원이 왔습니다.</h5>
								</div>
							</div>
							<div class="cardCon">
								<div class="cardConTop">
									<h5 class="type">인재풀</h5>
									<h5 class="date">06.19</h5>
								</div>
								<div class="cardConBottom">
									<h3 class="title">노 OO</h3>
									<h5 class="description">남 28세 2년/7개월 자바/Spring/MySQL</h5>
								</div>
							</div>
							<div class="cardCon">
								<div class="cardConTop">
									<h5 class="type">공고</h5>
									<h5 class="date">06.19</h5>
								</div>
								<div class="cardConBottom">
									<h3 class="title">Java, 백앤드 포지션 경력무관 모집합니다</h3>
									<h5 class="description">공고에 이력서 지원이 왔습니다.</h5>
								</div>
							</div>
						</div> <!-- cardConWrap All 끝 -->

						<div class="cardConWrap company"><!--추천인재풀-->
							<div class="cardCon">
								<div class="cardConTop">
									<h5 class="type">추천 인재</h5>
									<h5 class="date">2024.06.19</h5>
								</div>
								<div class="cardConBottom">
									<h3 class="title">Java, 백앤드 포지션 경력무관 모집합니다</h3>
									<h5 class="description">브레인즈컴퍼니</h5>
								</div>
							</div>
							<div class="cardCon">
								<div class="cardConTop">
									<h5 class="type">추천 인재</h5>
									<h5 class="date">2024.06.19</h5>
								</div>
								<div class="cardConBottom">
									<h3 class="title">Java, 백앤드 포지션 경력무관 모집합니다</h3>
									<h5 class="description">브레인즈컴퍼니</h5>
								</div>
							</div>
							<div class="cardCon">
								<div class="cardConTop">
									<h5 class="type">추천 인재</h5>
									<h5 class="date">2024.06.19</h5>
								</div>
								<div class="cardConBottom">
									<h3 class="title">Java, 백앤드 포지션 경력무관 모집합니다</h3>
									<h5 class="description">브레인즈컴퍼니</h5>
								</div>
							</div>
							<div class="cardCon">
								<div class="cardConTop">
									<h5 class="type">추천 인재</h5>
									<h5 class="date">2024.06.19</h5>
								</div>
								<div class="cardConBottom">
									<h3 class="title">Java, 백앤드 포지션 경력무관 모집합니다</h3>
									<h5 class="description">브레인즈컴퍼니</h5>
								</div>
							</div>
						</div> <!-- cardConWrap company 끝 -->


						<div class="cardConWrap post"><!--진행중인 공고-->
							<div class="cardCon">
								<div class="cardConTop">
									<h5 class="type">진행중인공고</h5>
									<h5 class="date">2024.06.19</h5>
								</div>
								<div class="cardConBottom">
									<h3 class="title">Java, 백앤드 포지션 경력무관 모집합니다</h3>
									<h5 class="description">브레인즈컴퍼니</h5>
								</div>
							</div>
							<div class="cardCon">
								<div class="cardConTop">
									<h5 class="type">진행중인공고</h5>
									<h5 class="date">2024.06.19</h5>
								</div>
								<div class="cardConBottom">
									<h3 class="title">Java, 백앤드 포지션 경력무관 모집합니다</h3>
									<h5 class="description">브레인즈컴퍼니</h5>
								</div>
							</div>
							<div class="cardCon">
								<div class="cardConTop">
									<h5 class="type">진행중인공고</h5>
									<h5 class="date">2024.06.19</h5>
								</div>
								<div class="cardConBottom">
									<h3 class="title">Java, 백앤드 포지션 경력무관 모집합니다</h3>
									<h5 class="description">브레인즈컴퍼니</h5>
								</div>
							</div>
							<div class="cardCon">
								<div class="cardConTop">
									<h5 class="type">진행중인공고</h5>
									<h5 class="date">2024.06.19</h5>
								</div>
								<div class="cardConBottom">
									<h3 class="title">Java, 백앤드 포지션 경력무관 모집합니다</h3>
									<h5 class="description">브레인즈컴퍼니</h5>
								</div>
							</div>
						</div> <!-- cardConWrap post 끝 -->


						<div class="cardConWrap colsePost"><!--마감된 공고-->
							<div class="cardCon">
								<div class="cardConTop">
									<h5 class="type">마감된 공고</h5>
									<h5 class="date">2024.06.19</h5>
								</div>
								<div class="cardConBottom">
									<h3 class="title">Java, 백앤드 포지션 경력무관 모집합니다</h3>
									<h5 class="description">브레인즈컴퍼니</h5>
								</div>
							</div>
							<div class="cardCon">
								<div class="cardConTop">
									<h5 class="type">마감된 공고</h5>
									<h5 class="date">2024.06.19</h5>
								</div>
								<div class="cardConBottom">
									<h3 class="title">Java, 백앤드 포지션 경력무관 모집합니다</h3>
									<h5 class="description">브레인즈컴퍼니</h5>
								</div>
							</div>
							<div class="cardCon">
								<div class="cardConTop">
									<h5 class="type">마감된 공고</h5>
									<h5 class="date">2024.06.19</h5>
								</div>
								<div class="cardConBottom">
									<h3 class="title">Java, 백앤드 포지션 경력무관 모집합니다</h3>
									<h5 class="description">브레인즈컴퍼니</h5>
								</div>
							</div>
							<div class="cardCon">
								<div class="cardConTop">
									<h5 class="type">마감된 공고</h5>
									<h5 class="date">2024.06.19</h5>
								</div>
								<div class="cardConBottom">
									<h3 class="title">Java, 백앤드 포지션 경력무관 모집합니다</h3>
									<h5 class="description">브레인즈컴퍼니</h5>
								</div>
							</div>
						</div> <!-- cardConWrap colsePost 끝 -->
					</div> <!-- cardWrap 끝 -->

					<div class="subContainer">
						<div class="notice">
							<a  href="#" class="noticeTitle">공고 작성하러 가기</a>
							<div class="noticeBody">
								<div class="noticeList">
									<div class="noticeContent">
										<div class="noticeTitle">
											Java, 백엔드 포지션 경력무관 채용공고
										</div> 
										<div class="noticeType">
											경력무관 | 학력무관 | 서울 성동구 | ~24.06.30
										</div>
									</div>
									<div class="noticeQual">
										<button type="button" class="noticeSetting">공고관리</button>
									</div>
								</div><!--noticeList-->
								<div class="noticeList">
									<div class="noticeContent">
										<div class="noticeTitle">
											[Web Product 팀] 프론트 엔드 엔지니어 (3년 이상)
										</div> 
										<div class="noticeType">
											3~5년 | 학력무관 | 서울 성동구 | ~24.06.30
										</div>
									</div>
									<div class="noticeQual">
										<button type="button" class="noticeSetting">공고관리</button>
									</div>
								</div><!--noticeList-->
								<div class="noticeList">
								<button type="button" class="getNotice">새 공고 작성
									<i class="fa-solid fa-plus"></i>
								</button>
								</div>
							</div><!--noticeBody-->
						</div><!--notice-->

						<div class="resume">
							<a href="#" class="resumeTitle">인재풀 바로가기</a>
							<div class="resumeBody">
								<div class="people">
									<div class="profile">
										<div class="name">노OO</div>
										<div class="ageGender">남 28세</div>
										<div class="career">2년7개월</div>
									</div>
									<div class="stack">
										<div class="stackName">자바</div>
										<div class="stackName">Spring</div>
										<div class="stackName">mySQL</div>
									</div>
									<div class="resumeDate">24.06.19</div>
								</div><!--people-->
								<div class="people">
									<div class="profile">
										<div class="name">노OO</div>
										<div class="ageGender">남 28세</div>
										<div class="career">2년7개월</div>
									</div>
									<div class="stack">
										<div class="stackName">자바</div>
										<div class="stackName">Spring</div>
										<div class="stackName">mySQL</div>
									</div>
									<div class="resumeDate">24.06.19</div>
								</div><!--people-->
								<div class="people">
									<div class="profile">
										<div class="name">노OO</div>
										<div class="ageGender">남 28세</div>
										<div class="career">2년7개월</div>
									</div>
									<div class="stack">
										<div class="stackName">자바</div>
										<div class="stackName">Spring</div>
										<div class="stackName">mySQL</div>
									</div>
									<div class="resumeDate">24.06.19</div>
								</div><!--people-->
								<div class="people">
									<div class="profile">
										<div class="name">노OO</div>
										<div class="ageGender">남 28세</div>
										<div class="career">2년7개월</div>
									</div>
									<div class="stack">
										<div class="stackName">자바</div>
										<div class="stackName">Spring</div>
										<div class="stackName">mySQL</div>
									</div>
									<div class="resumeDate">24.06.19</div>
								</div><!--people-->
							</div><!--resumeBody-->
						</div><!--resume-->
					</div><!--subContainer-->
				</div> <!-- mainContainer -->
		
			</main>
		</div><!-- mainContent -->
	</div><!-- container -->
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
		
        2024-06.29 임하진
        개인 마이페이지 가져오면서 탭 메뉴 이름 수정
        탭 메뉴 : 전체 , 추천인재풀, 진행중인 공고
    */

    $('.tabCon.All').click(function(){
        $('.cardConWrap').css({"display":"none"});
        $('.cardConWrap.All').css({"display":"flex"});
    });

    $('.tabCon.company').click(function(){
        $('.cardConWrap').css({"display":"none"});
        $('.cardConWrap.company').css({"display":"flex"});
    });

    $('.tabCon.post').click(function(){
        $('.cardConWrap').css({"display":"none"});
        $('.cardConWrap.post').css({"display":"flex"});//진행중인 공고
    });

    $('.tabCon.colsePost').click(function(){
        $('.cardConWrap').css({"display":"none"});
        $('.cardConWrap.colsePost').css({"display":"flex"});//마감된 공고
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