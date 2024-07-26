<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>개인-마이페이지-탈퇴</title>
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
	:root 
	{
	  /* 컬러 모음 */
	  --main-color:#FFA500;
	  --color-black: #111;
	  --color-white: #fff;
	  --color-gray: #787878;
	  --input-gray: #e5e5ec;
	  --button-gray: #f7f7f7;
	  --border-color-gray: #dadada;
	  --font-size32: 32px;
	  --font-size24: 24px;
	  --font-size16: 16px;
	  --font-size14: 14px;
	  --font-size12: 12px;
	}

	/* 네비게이션 옆 컨텐츠 영역 */
	.mainContent 
	{
	  width: calc( 100% - 260px);
	  min-height: 100vh;
	}
	

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
	
	
	
	/*메인콘텐츠 전체*/
	
	section
	{
	  display: flex;
	  justify-content: center;
	  min-width: 1200px;
	}
	

	/*메인콘텐츠 전체*/
	main
	{
	  display: flex;
	  justify-content: center;
	}
	main .mainContainer
	{
	  display: flex;
	  flex-direction: column; 
	  min-width: 1200px;
	  gap: 40px 0;
	}

	/*메인타이틀*/
	.mainContainer .mainTitle
	{
	  font-size: var(--font-size32);
	  margin-top: 70px;
	  color: var(--color-black);
	  gap : 0 20px;
	}

	/*서브 타이틀 + 숫자*/
	.mainContainer .subtitle
	{
	  display: flex;
	  align-items: center;
	  /* justify-content: center; */
	  gap : 0 10px;
	  font-size: var(--font-size24);
	}

	.mainContainer .subtitle .listNum
	{
	  color: var(--main-color);
	  /* margin: 0 10px 0 40px; */
	}


	/*sort tab 전체*/
	.mainContainer .listTable .searchWrap
	{
	  display: flex;
	  max-width: 1200px;
	  margin-bottom: 10px;
	  
	}


	/*sort tab 왼쪽*/
	.mainContainer .searchWrap .optionSortLeft
	{
	  display: flex;
	  align-items: center;
	  gap : 20px;
	  padding-left: 20px;
	}
	/*삭제 체크박스*/
	.mainContainer .searchWrap .optionSortLeft input
	{
	  width: 20px;
	  height: 20px;
	  border:1px solid var(--border-color-gray);
	  border-radius: 3px;
	  cursor: pointer;
	}

	/*삭제버튼*/
	.mainContainer .searchWrap .optionSortLeft button
	{
	  width: 65px;
	  height: 36px;
	  background-color: initial;
	  border:1px solid var(--border-color-gray);
	  color: var(--color-gray);
	  font-size: var(--font-size16);
	  border-radius: 6px;
	  align-items:center;
	  justify-content:center;
	  cursor: pointer;
	}



	/*sort tab 오른쪽( 최신순, 마감인박) */
	.mainContainer .searchWrap .optionSorRight
	{
	  display: flex;
	  gap : 35px;
	  margin-left: auto ;
	  align-items:center;
	  font-size: 14px;
	}

	/*sort tab 오른쪽( 최신순, 마감인박) */
	.mainContainer .searchWrap .optionSorRight span
	{
	  display: flex;
	  gap: 5px;
	  margin-left: auto ;
	  align-items:center;
	  color: #222;
	}
	.mainContainer .searchWrap .optionSorRight label
	{
	  cursor: pointer;

	}

	/*sort tab 오른쪽( 최신순, 마감인박) */
	.mainContainer .searchWrap .optionSorRight input
	{
	  width: 15px;
	  height: 15px;
	  border:1px solid var(--border-color-gray);
	  border-radius: 3px;
	}




	/*제안 리스트*/
	main .mainContainer .offerList
	{
	  display: flex;
	  flex-direction: column;
	  gap: 20px 0;
	}

	/*하나의 제안 박스*/
	.mainContainer .offerList .postBox
	{
	  display: flex;
	  border: 1px solid var(--input-gray);
	  border-radius: 10px;
	  box-sizing: border-box;
	  padding: 20px;
	  width: 1200px;
	  height: 140px;
	  justify-content: flex-start;
	}

	/*제안박스 왼쪽*/
	.mainContainer .offerList .postBox .boxLeft
	{
	  width: 170px;
	  white-space: nowrap;
	  display: flex;
	  align-items:center;
	  gap: 20px;
	  color: #222;
	}

	/*제안박스 왼쪽(체크박스)*/
	.mainContainer .offerList .postBox .boxLeft input
	{
	  width: 20px;
	  height: 20px;
	  cursor: pointer;
	}

	/*제안박스 중간- 기업정보*/
	.mainContainer .offerList .postBox .boxMiddle
	{
	  width: 650px;
	  display: flex;
	  flex-direction: column;
	  /* align-items:center; */
	  justify-content:center;
	  gap: 10px 0;
	  padding-left: 60px;
	  cursor: pointer;
	  color: #222;
	}

	/* 기업명 */
	.postBox .boxMiddle .comStar
	{
	  display: flex;
	  gap: 0 10px;
	}
	postBox .boxMiddle .comStar .com_name
	{
	  font-size: var(--font-size16);
	}

	.postBox .boxMiddle .comInfo
	{
	  /* display: flex; */
	  font-size: var(--font-size14);
	  
	}




	/*제안 박스 오른쪽*/
	.mainContainer .offerList .postBox .boxRight
	{
	  margin-left: auto;
	  /* width: 175px; */
	  display: flex;
	  /* justify-content:center; */
	  align-items:center;
	  gap: 20px;
	}

	/* 미응답 자세히보기 */
	.boxRight span
	{
	  display: flex;
	  width: 135px;
	  height: 32px;
	  /* box-sizing: ; */

	}

	/*미응답,제안거절,지원완료*/
	.boxRight .offer_agree button
	{
	  width: 135px;
	  font-size: var(--font-size16);
	  align-items:center;
	  justify-content:center; 
	  border: none;
	  background:none;
	  color: #222;
	}

	/*자세히보기 버튼*/
	.boxRight .open 
	{
	  width: 135px;
	  height: 32px;
	  background-color: var(--button-gray);
	  border:1px solid var(--border-color-gray);
	  color: var(--color-gray);
	  font-size: var(--font-size16);
	  border-radius: 6px;
	  cursor: pointer;
	}


	/*휴지통아이콘*/ 
	.postBox .boxRight .delIcon
	{
	  font-size: var(--font-size16);
	  cursor: pointer;
	  color: #222;
	}





	/*팝업*/ 

	.popUp
	{
	  display: none;
	}


	.popBg 
	{
	  position: fixed;
	  top: 0;
	  left: 0;
	  width: 100vw;
	  height: 100vh;
	  background:rgba(0,0,0,0.6);
	}

	.popCon
	{
	  background-color: #fff;
	  width: 800px;
	  /* height: 1000px; */
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%,-50%);
	  padding: 40px;
	}

	.postBox .popUp .popCon
	{
	  display: flex;
	  flex-direction: column;
	  gap: 40px 0;
	}

	.popH
	{
	  display: flex;
	  border-bottom: 1px solid var(--input-gray);
	  padding-bottom: 5px;
	}

	.popH .popHLeft
	{
	  display: flex;
	  flex-direction: column;
	  gap: 15px 0;
	}

	.popH h3
	{
	  font-size: var(--font-size24);
	}
	.popH h5
	{
	  font-size: var(--font-size14);
	}

	.popH .popHLeft .popH3
	{
	  display: flex;
	  gap:0 30px;
	}

	.popH .popHLeft .popH3 span
	{
	  display: flex;
	  gap: 0 5px;
	  color: var(--color-gray);
	}

	.popH .popHRight
	{
	  margin-left: auto;
	  width: 30px;
	  height: 30px;
	  font-size: 30px;
	}

	.popM
	{
	  display: flex;
	  flex-direction: column;
	  gap: 40px 0;
	  padding: 40px 0;
	}

	.popM .popM1
	{
	  line-height: 1.5em;
	  font-size: var(--font-size14);
	}

	/*이직제안 입력할 때 textarea로 넣은걸
	그대로 받으면 아래로 쓸수도 있음*/
	/* textarea {
	  width: 100%;
	  height: 6.25em;
	  border: none;
	  resize: none;
	} */


	.popM .popM2
	{
	  display: flex;
	  width: 720px;
	  height: 116px;
	  background-color: initial;
	  border:1px solid var(--border-color-gray);
	  border-radius: 10px;
	  align-items:center;
	  /* justify-content:center; */
	  padding: 20px;
	}

	.popM .popM2 .popM2Left
	{
	  display: flex;
	  flex-direction: column;
	  gap: 10px 0;
	  font-size: var(--font-size16);
	}

	.popM .popM2 .popM2Left .detail
	{
	  display: flex;
	  gap: 0 40px;
	}
	.popM .popM2 .popM2Left h5
	{
	  font-size: var(--font-size14);
	}

	.popM .popM2 .popM2Right
	{
	 margin-left: auto;
	}

	.popM .popM3
	{
	  display: flex;
	  flex-direction: column;
	  gap: 10px 0;
	}

	.popM .popM3 .popM3Con
	{
	  font-size: var(--font-size14);
	}


	.popM .popM4
	{
	  display: flex;
	  width: 720px;
	  height: 116px;
	  background-color: initial;
	  border:1px solid var(--border-color-gray);
	  border-radius: 10px;
	  align-items:center;
	  /* justify-content:center; */
	  padding: 20px;
	  gap: 0 40px;
	}

	.popM .popM4 .logo
	{
	  width: 120px;
	}

	.popM .popM4 .detail
	{
	  display: flex;
	  flex-direction: column;
	  gap: 10px 0;
	}

	.popM .popM4 .detail p
	{
	  font-size: var(--font-size1);
	}

	.popM .popM4 .detail label
	{
	  font-size: var(--font-size14);
	}

	.popM .popM4 .detail .detailB
	{
	  display: flex;
	  gap: 0 10px;
	}

	.popB
	{
	  display: flex;
	  gap: 0 20px;
	  justify-content: center;
	}

	.popB button
	{
	  width: 150px;
	  height: 46px;
	  background-color: initial;
	  border:1px solid var(--border-color-gray);
	  color: var(--color-gray);
	  font-size: var(--font-size16);
	  border-radius: 6px;
	  align-items:center;
	  justify-content:center;
	}



	/*페이징*/
	.mainContainer .listPaging
	{
	  display: flex;
	  justify-content:center;
	  max-width: 1200px;
	  margin-bottom: 70px;
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
	                 <div class="mainTitle">
	                     <h3>받은 제안</h3>
	                 </div><!-- mainTitle 끝 -->
	                 <div class="subtitle">
	                     <h4 class="title">총</h4>
	                     <h4 class="listNum">7</h4><!-- 받은제안 갯수 가져와야 -->
	                     <h4 class="end">개</h4>
	                 </div>
	                 <div class="listTable">
	                     <div class="searchWrap">
	                         <div class="optionSortLeft">
	                             <input type="checkbox" id="check_all" value="회사명">
	                             <button>삭제</button>
	                         </div><!-- optionSortLeft 끝 -->
	                         <div class="optionSorRight">
	                             <span>
	                                 <input type="checkbox" id="desc" value="최신순">
	                                 <label for="desc">최신순</label>
	                             </span>
	                             <span>
	                                 <input type="checkbox" id="urgent" value="마감임박">
	                                 <label for="urgent">마감임박</label>
	                             </span>
	                         </div> <!-- optionSorRight 끝 -->                   
	                     </div><!-- searchWrap 끝 -->  
	                     <div class="offerList">
	                         <div class="postBox"><!-- 제안박스하나 시작 -->  
	                             <div class="boxLeft">
	                                 <input type="checkbox" name="offerListRow"id= "" class="normal">
	                                 <p class="offer_date">2024.05.09 10:59</p><!--제안일 정보 가지고 와야--> 
	                             </div><!-- boxLeft 끝-->
	                             <div class="boxMiddle">
	                                 <h4 class="com_name">(주)티오에스코리아</h4>
	                                 <div class="comInfo">
	                                     <p>서울 국내·외 교육 관련 마케팅 및 컨설팀 업무 바이럴 및 온라인 마케팅 / 키워드 광고 / 등</p>
	                                 </div><!-- comInfo 끝-->
	                             </div><!-- boxMiddle  끝-->
	                             <div class="boxRight">
	                                 <span class="offer_agree"> 
	                                     <button onclick="location.href='#'">미응답</button><!-- 제안거절/지원완료/미응답-->
	                                 </span>
	                                 <spn class="open">
	                                     <input type="button" id="opendetail" class="open" value="자세히보기">
	                                 <!-- <label for="opendetail">자세히보기<label> -->
	                                 </spn>
	                                 <div class="delIcon">
	                                     <i class="fa-regular fa-trash-can"></i>
	                                 </div>
	                             </div><!-- boxRight 끝 -->   
	                             <!-- pop 영역 -->
	                             <div class="popUp disN">
	                                 <div class="popBg">
	                                     <div class="popCon disF flexD">
	                                         <div class="popH">
	                                             <div class="popHLeft">
	                                                 <div class="popH1">
	                                                     <h3 class="notice_title">[Junion][경력] 백엔드 개발자 채용</h3>
	                                                 </div>
	                                                 <div class="popH2">
	                                                     <h5 class="com_name">주니온</h5>
	                                                 </div>
	                                                 <div class="popH3">
	                                                     <span>
	                                                         <h5>제안일</h5>
	                                                         <h5>2024.05.31</h5>
	                                                     </span>
	                                                     <span>
	                                                         <h5>응답기한</h5>
	                                                         <h5>2024.06.31</h5>
	                                                     </span>
	                                                 </div>
	                                             </div><!-- popHLeft 끝 -->
	                                             <div class="popHRight" >
	                                                 <span class="icon cancel fs24">
	                                                     <i class="fa-solid fa-xmark"></i>
	                                                 </span>
	                                             </div>
	                                         </div><!-- popH 끝 -->  
	                                         <div class="popM">
	                                             <div class="popM1">
	                                                 <pre>안녕하세요. 주니온 입니다.<br>저희가 찾고있는 포지션에 적합한 인재라고 생각되어 이렇게 제안 드립니다.<br>긍정적인 검토 부탁 드리며, 관련 자세한 내용이 궁금하시다면 응답기간 내 회신 부탁 드립니다.</pre><!-- 제안입력단 textarea 정보랑 일치시킬 것 -->
	                                                 <!-- <textarea cols="50" rows="8"><c:out value="${content}" /></textarea>제안입력단 textarea 정보랑 일치시킬 것 -->
	                                             </div>
	                                             <div class="popM2">
	                                                 <div class="popM2Left">
	                                                     <h4 class="title">백엔드 개발자(경력) 채용</h4>
	                                                     <div class="detail">
	                                                         <p class="com_name">(주) 주니온</p>
	                                                         <p class="com_location">부산광역시 부산진구 중앙대로 123-123</p>
	                                                     </div>
	                                                 </div>
	                                                 <div class="popM2Right">
	                                                     <a href="#">
	                                                         <i class="fa-solid fa-chevron-right"></i>
	                                                     </a>
	                                                 </div>
	                                             </div>
	                                             <div class="popM3">
	                                                 <h4 class="popM3Con title">인사담당자 정보</h4>
	                                                 <p class="popM3Con">홍길동(총무부)</p>
	                                                 <p class="popM3Con">010 - 0000 - 0000</p>
	                                                 <p class="popM3Con">junion@junion.co.kr</p>
	                                             </div>
	                                             <div class="popM4">
	                                                 <div class="logo">
	                                                     <a href="#">
	                                                         <img src="images/logo.svg" alt="#">
	                                                     </a>
	                                                 </div>
	                                                 <div class="detail">
	                                                     <h4 class="com_name">(주) 주니온</h4>
	                                                     <div class="detailB">
	                                                         <label for="comInfo" class="com_info">기업정보 보러가기</label>
	                                                         <div id="comInfo" class="chevron-right">
	                                                             <a href="#">
	                                                                 <i class="fa-solid fa-chevron-right"></i>
	                                                             </a>
	                                                         </div>
	                                                     </div>
	                                                 </div>

	                                             </div>
	                                         </div><!-- popM 끝 --> 
	                                         <div class="popB">
	                                             <button class="submit tabBtn">거절</button>
	                                             <button class="submit tabBtn">지원하기</button><!-- 이미지원했으면 지원완료로 떠야함 -->
	                                         </div>    
	                                     </div>
	                                 </div> 
	                             </div><!-- pop 영역 끝 -->   
	                         </div><!-- postBox 하나의 제안 끝 --> 
							 
							 
	                         <div class="postBox"><!-- 제안박스하나 시작 -->  
	                             <div class="boxLeft">
	                                 <input type="checkbox" id= "" class="normal">
	                                 <p class="offer_date">2024.05.09 10:59</p><!--제안일 정보 가지고 와야--> 
	                             </div><!-- boxLeft 끝-->
	                             <div class="boxMiddle">
	                                 <h4 class="com_name">(주)티오에스코리아</h4>
	                                 <div class="comInfo">
	                                     <p>서울 국내·외 교육 관련 마케팅 및 컨설팀 업무 바이럴 및 온라인 마케팅 / 키워드 광고 / 등</p>
	                                 </div><!-- comInfo 끝-->
	                             </div><!-- boxMiddle  끝-->
	                             <div class="boxRight">
	                                 <span class="offer_agree"> 
	                                     <button onclick="location.href='#'">미응답</button><!-- 제안거절/지원완료/미응답-->
	                                 </span>
	                                 <spn class="open">
	                                     <input type="button" id="opendetail" class="open" value="자세히보기">
	                                 <!-- <label for="opendetail">자세히보기<label> -->
	                                 </spn>
	                                 <div class="delIcon">
	                                     <i class="fa-regular fa-trash-can"></i>
	                                 </div>
	                             </div><!-- boxRight 끝 -->   
	                             <!-- pop 영역 -->
	                             <div class="popUp disN">
	                                 <div class="popBg">
	                                     <div class="popCon disF flexD">
	                                         <div class="popH">
	                                             <div class="popHLeft">
	                                                 <div class="popH1">
	                                                     <h3 class="notice_title">[Junion][경력] 백엔드 개발자 채용</h3>
	                                                 </div>
	                                                 <div class="popH2">
	                                                     <h5 class="com_name">주니온</h5>
	                                                 </div>
	                                                 <div class="popH3">
	                                                     <span>
	                                                         <h5>제안일</h5>
	                                                         <h5>2024.05.31</h5>
	                                                     </span>
	                                                     <span>
	                                                         <h5>응답기한</h5>
	                                                         <h5>2024.06.31</h5>
	                                                     </span>
	                                                 </div>
	                                             </div><!-- popHLeft 끝 -->
	                                             <div class="popHRight" >
	                                                 <span class="icon cancel fs24">
	                                                     <i class="fa-solid fa-xmark"></i>
	                                                 </span>
	                                             </div>
	                                         </div><!-- popH 끝 -->  
	                                         <div class="popM">
	                                             <div class="popM1">
	                                                 <pre>안녕하세요. 주니온 입니다.<br>저희가 찾고있는 포지션에 적합한 인재라고 생각되어 이렇게 제안 드립니다.<br>긍정적인 검토 부탁 드리며, 관련 자세한 내용이 궁금하시다면 응답기간 내 회신 부탁 드립니다.</pre><!-- 제안입력단 textarea 정보랑 일치시킬 것 -->
	                                                 <!-- <textarea cols="50" rows="8"><c:out value="${content}" /></textarea>제안입력단 textarea 정보랑 일치시킬 것 -->
	                                             </div>
	                                             <div class="popM2">
	                                                 <div class="popM2Left">
	                                                     <h4 class="title">백엔드 개발자(경력) 채용</h4>
	                                                     <div class="detail">
	                                                         <p class="com_name">(주) 주니온</p>
	                                                         <p class="com_location">부산광역시 부산진구 중앙대로 123-123</p>
	                                                     </div>
	                                                 </div>
	                                                 <div class="popM2Right">
	                                                     <a href="#">
	                                                         <i class="fa-solid fa-chevron-right"></i>
	                                                     </a>
	                                                 </div>
	                                             </div>
	                                             <div class="popM3">
	                                                 <h4 class="popM3Con title">인사담당자 정보</h4>
	                                                 <p class="popM3Con">홍길동(총무부)</p>
	                                                 <p class="popM3Con">010 - 0000 - 0000</p>
	                                                 <p class="popM3Con">junion@junion.co.kr</p>
	                                             </div>
	                                             <div class="popM4">
	                                                 <div class="logo">
	                                                     <a href="#">
	                                                         <img src="images/logo.svg" alt="#">
	                                                     </a>
	                                                 </div>
	                                                 <div class="detail">
	                                                     <h4 class="com_name">(주) 주니온</h4>
	                                                     <div class="detailB">
	                                                         <label for="comInfo" class="com_info">기업정보 보러가기</label>
	                                                         <div id="comInfo" class="chevron-right">
	                                                             <a href="#">
	                                                                 <i class="fa-solid fa-chevron-right"></i>
	                                                             </a>
	                                                         </div>
	                                                     </div>
	                                                 </div>

	                                             </div>
	                                         </div><!-- popM 끝 --> 
	                                         <div class="popB">
	                                             <button class="submit tabBtn">거절</button>
	                                             <button class="submit tabBtn">지원하기</button><!-- 이미지원했으면 지원완료로 떠야함 -->
	                                         </div>    
	                                     </div>
	                                 </div> 
	                             </div><!-- pop 영역 끝 -->   
	                         </div><!-- postBox 하나의 제안 끝 --> 
	                         
	                     </div><!-- offerList 끝 -->    
	                 </div><!-- listTable 끝 --> 
	                 <div class="listPaging">
	                     <h5> 1  2  3  4  5  6  7  8 </h5>
	                 </div><!-- listPaging 끝 -->    
	             </div> <!-- mainContainer -->
	         </main>
	     </div><!-- mainContent-->
	 </div><!-- container 끝 -->
	<%@ include file="footer.jsp" %>
</body>
</html>
<script>
	$(document).ready(function()
	{
		/*
	    2024-07-02 서연주 
	    체크박스 선택
	    */
	   //체크박스 전체선택
	    $(".optionSortLeft input").on("click", function () {
	        var checked = $(this).is(":checked");
	        console.log("check_all");
	        console.log(checked);
	        
	        if(checked){
	            $(".offerList").find('input').prop("checked", true);
	        } else {
	            $(".offerList").find('input').prop("checked", false);
	        }
	    });
	    
	    // 체크박스 개별 선택
	    $(".normal").on("click", function() {
	        var checked = $(this).is(":checked");
	        console.log("click normal");
	        console.log(checked);
	    
	        if (!checked) {
	            $(".optionSortLeft input").prop("checked", false);
	        }else {
	            var is_checked = true;
	            
	            $(".normal").each(function(){
	              is_checked = is_checked && $(this).is(":checked");
	            });
	            
	            $(".optionSortLeft input").prop("checked", is_checked);
	          }
	    });
	
	    /*
	        2024-07-03 서연주
	     
	        자세히보기 
	    */
	    $("input.open").on("click",function(e){
	
	        e.preventDefault();
	        $(this).parents().siblings(".popUp").css({"display":"flex"});
	    });
	        
	    $('.popUp .icon.cancel').click(function(){
	        console.log("click");
	        $(this).parents('.popUp').css({"display":"none"}); 
	    }); 
	
	    $('button.cancel').click(function(){
	        console.log("click");
	        $(this).parents('.popUp').css({"display":"none"}); 
	    }); 
	
	
	
	
	     /*
	    2024-07-04 서연주 
	    휴지통 누르고 그 박스만 삭제하기
	    <휴지통아이콘 누른 그 박스를 선택하는 걸 못하겠음..>
	
	    */
	
	    $(".delIcon i").on("click",function(e){
	        e.preventDefault();
	        console.log("휴지통클릭");
	        
	        var this_checkbox =  document.getElementById('com_name');
	        // var this_checkbox =  $(this).parents('.boxLeft').children('#com_name');
	        // var this_checkbox =  $(this).parents('.boxLeft').children();
	        console.log(this_checkbox);
	        var checked= this_checkbox.checked;
	        
	        // var checked = this_checkbox.checked;
	        console.log(checked);
	
	        if(!checked){
	            alert("삭제할 공고를 선택해주세요.");
	        }else{
	            if(confirm("정말삭제하시겠습니까?") == true){
	            }else{
	                return;
	            }
	        }
	       
	
	    });




		/*
    2024-07-02 서연주 
    체크박스 누르고 삭제하기(체크한 그 목록이 없어지는지는 데이터넣고 확인!)
    */
    $(".selectDel").on("click",function(){
        var cnt = $("input[name='offerListRow']:checked").length;
        var arr = new Array();
        $("input[name='offerListRow']:checked").each(function() {
            arr.push($(this).attr('id'));
        });
        if(cnt == 0){
            alert("선택된 항목이 없습니다.");
        }
        else{
            alert("삭제되었습니다.")//데이터받아서 넘기고 받아야
            // $.ajax = {
            //     type: "POST"
            //     url: "OOOO.do"
            //     data: "RPRT_ODR=" + arr + "&CNT=" + cnt,
            //     dataType:"json",
            //     success: function(jdata){
            //         if(jdata != 1) {
            //             alert("삭제 오류");
            //         }
            //         else{
            //             alert("삭제 성공");
            //         }
            //     },
            //     error: function(){alert("서버통신 오류");}
            // };
        }


// 	 최신순오래된순 구현하는 스크립트 노션에 참고자료있음 java단도 만들어야 
// 
//     document.querySelector('#orderBy').addEventListener('change', function() {
//         var orderBy = document.querySelector('#orderBy').value;
//         window.location.href = '/board/view?id=' + id + '&orderBy=' + orderBy;
//     });



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