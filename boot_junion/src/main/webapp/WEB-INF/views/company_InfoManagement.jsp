<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Company_InfoManagement</title>
<!--    <link rel="stylesheet" href="css/default.css">-->
<!--    <link rel="stylesheet" href="css/style.css">-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/company_InfoMamagement.css">
    <!-- import font-awesome, line-awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
    <!-- import pretendard font -->
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
    <!-- import js -->
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="js/index.js"></script> 
</head>
<body>
<div class="container">
    <div class="navigation">

        <div class="logo">
            <a href="#">
                <img src="images/logo.svg" alt="#">
            </a>
            <!-- <h1>
                <span class="las la-otter"></span>
                Madia-Study-App
            </h1> -->
        </div> <!-- nav-brand 끝-->
    
        <div class="navMenu">
            <ul>
                <li>
                    <a href="#">
                        <span class="icon">
                            <i class="fa-regular fa-pen-to-square"></i>
                        </span>
                        <span class="title">공고등록</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon">
                            <i class="fa-regular fa-file-lines"></i>
                        </span>
                        <span class="title">공고·지원자관리</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon">
                            <i class="fa-solid fa-users"></i>
                        </span>
                        <span class="title">인재풀</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon">
                            <i class="fa-regular fa-building"></i>
                        </span>
                        <span class="title">기업정보관리</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon">
                            <i class="fa-regular fa-address-book"></i>
                        </span>
                        <span class="title">기업인재상 등록</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon">
                            <i class="fa-regular fa-trash-can"></i>
                        </span>
                        <span class="title">기업회원탈퇴</span>
                    </a>
                </li>                 
            </ul>
        </div>  <!-- nav-menu 끝-->    
    </div> <!-- navigation 끝-->
	
<!--	${companyInfo}-->
    <div class="mainContent">
        <header>
            <div class="userWrapper">
                <img src="images/people.svg"alt="">
                <h4 class="name">${companyInfo.com_name}</h4>
                <span class="icon">
                    <i class="fa-solid fa-caret-down"></i>
                </span>
             </div>
        </header>    
        <main>
            <div class="containe">
                
                
                <div class="toptitle">
                    <h3 class="toptitle1" >기업 기본 정보</h3>
                    <h3 class="toptitle2" >기업 상세 정보</h3>
                </div>
                
                    <div class="tabCon common">

                        <!-- 섹션시작 -->
                        <section class="tabCon common disN" >            
                            <div class="wrap">
                
                
                                <div class="left">
                
                
                                    <!-- 컴퍼니 시작 -->
                
                                    <div class="company">
                                        <img class="imgg" src="images/company.svg" alt="#">
                                    </div>
                                    <div class="main">
                                        <div class="sub1">
                                            <h5 class="name">${companyInfo.com_name}</h5>
                                            <h5 class="locationC">${companyInfo.com_location}</h5>
                                        </div>
                                    </div>
                
                
                                    <!-- 컬럼 시작 -->
                
                
                                    <div class="column"> 
                
                
                                    <div class="col1">
                                        <div class="columnA">
                                            <h5 class="title">회사 소개</h5>
                                        </div>
                                        <div class="boerder"></div>
                                        <div class="columnAA">
                                            <h5 class="detail">
                                                ${companyInfo.com_content}
                                            </h5>
                                        </div>
                                    </div>
                
                
                
                                    <div class="col7">
                                        <div class="columnA">
                                            <h5 class="title">회사 위치</h5>
                                        </div>
                                        <div class="columnBB">
                                            <h5 class="detail">
                                                <div id="map" style="width:730px;height:250px;"></div>
                                                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=de7cac757fedb4da8958fa692849033d"></script>
                                                <script>
                                                    var container = document.getElementById('map');
                                                    var options = {
                                                        center: new kakao.maps.LatLng(33.450701, 126.570667),
                                                        level: 3
                                                    };
                                            
                                                    var map = new kakao.maps.Map(container, options);
                                                </script>
                                                <h5 class="loc">${companyInfo.com_location}</h5>
                                            </h5>
                                        </div>
                                    </div>
                
                                    <div class="col8">
                                        <div class="columnA">
                                                <h5 class="title">
                                                    기업정보
                                                </h5>
                                            </div>
                                            <div class="content">
                                                <div class="comname1">
                                                    <h5 class="name">
                                                        연혁
                                                    </h5>
                                                </div>
                                                <div class="comname2">
                                                    <h5 class="name">
                                                        ${companyInfo.com_year}
                                                    </h5>
                                                </div>
                                                <div class="comname1">
                                                    <h5 class="name">
                                                        매출액 (2024년)
                                                    </h5>
                                                </div>
                                                <div class="comname2">
                                                    <h5 class="name">
                                                        ${companyInfo.com_sale} 
                                                    </h5>
                                                </div>
                                                <div class="comname1">
                                                    <h5 class="name">
                                                        기업유형
                                                    </h5>
                                                </div>
                                                <div class="comname2">
                                                    <h5 class="name">
                                                        ${companyInfo.com_type} 
                                                    </h5>
                                                </div>
                                                <div class="comname1">
                                                    <h5 class="name">
                                                        평균연봉
                                                    </h5>
                                                </div>
                                                <div class="comname2">
                                                    <h5 class="name">
                                                        ${companyInfo.com_salary} 
                                                    </h5>
                                                </div>
                                                <div class="comname1">
                                                    <h5 class="name">
                                                        대표자명
                                                    </h5>
                                                </div>
                                                <div class="comname2">
                                                    <h5 class="name">
                                                        ${companyInfo.com_CEO} 
                                                    </h5>
                                                </div>
                                                <div class="comname1">
                                                    <h5 class="name">
                                                        홈페이지
                                                    </h5>
                                                </div>
                                                <div class="comname2">
                                                    <h5 class="name">
                                                        ${companyInfo.com_site} 
                                                    </h5>
                                                </div>
                                                <div class="comname1">
                                                    <h5 class="name">
                                                        가입 사원수 (인원)
                                                    </h5>
                                                </div>
                                                <div class="comname2">
                                                    <h5 class="name">
                                                        ${companyInfo.com_employee}명 
                                                    </h5>
                                                </div>
                                            </div>
                                    </div>
                
                
                
                                </div><!-- 컬럼 끝 -->
								<div class="modify">
								    <input type="button" value="기업정보수정" class="commodify" onclick="location.href='company_InfoDetailUpdate'">
								</div>
                                </div><!-- left 끝 -->
					
                
                            </div><!-- wrap 끝 -->
                        </section><!-- section 끝 -->
                        
                    </div>
                    
                    <div class="tabCon detail">
                        <table class="tabCon detail disB" width="1200px" height="300px">
                            <tr>
                                <th>기업이메일</th>
                                <td>${companyInfo.com_email}</td>
                            </tr>
                            <tr>
                                <th>사업자등록번호 </th>
                                <td>${companyInfo.com_serial_number}</td>
                            </tr>
                            <tr>
                                <th>이름</th>
                                <td>${companyInfo.com_person}</td>
                            </tr>
                            <tr>
                                <th>연락처</th>
                                <td>${companyInfo.com_tel}</td>
                            </tr>
                            <tr>
                                <th>비밀번호</th>
                                <td><input type="button" value="변경하기" class="changepw" onclick="location.href=비밀번호수정페이지"></td>
                            </tr>
                        </table>
<!--						 table끝 -->
                        
                    <div class="modify">
                        <input type="button" value="기업정보수정" class="commodify" onclick="location.href='company_InfoUpdate'">
<!--                        <input type="button" value="기업정보수정" class="commodify" onclick="location.href='company_InfoUpdate?com_email=${companyInfo.com_email}'">-->
                    </div>
                    </div>
                    
                   
                   
                
                

                
            </div><!-- containe끝 -->
        </main>
    
    </div><!-- main-content -->
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