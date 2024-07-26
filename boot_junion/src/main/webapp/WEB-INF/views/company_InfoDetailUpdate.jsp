<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>
<!--    <link rel="stylesheet" href="css/default.css">-->
<!--    <link rel="stylesheet" href="css/company_InfoDetailUpdate.css">-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/company_InfoDetailUpdate.css">
    <!-- import font-awesome, line-awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
    <!-- import pretendard font -->
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
    <!-- import js -->
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="js/index.js"></script>     
    <meta charset="utf-8"/>
	<title>Kakao 지도 시작하기</title>
</head>
<body>
   <%@ include file="header.jsp" %>
<!-- 섹션-->
        <section>    
                  
            <div class="wrap">

                
                <div class="left">
                    <div class="toptitle">
                        <h3 class="toptitle1" >상세 정보 수정</h3>
                        
                    </div>  

                    <!-- 컴퍼니 시작-->
                <form method="post" action="modify_Detail">
                    <input type="hidden" name="com_email" value="${companyInfo.com_email}">
                    <div class="company">
                        <label for="photo">
                            <div class="imgg">기업 사진 수정하기</div>
                        </label>
                        <input type="file" name="com_image" id="photo" accept="image/*,.txt">
                    </div>
                    <div class="main">
                        <div class="sub1">
                            <div class="namaing">
                                <h5 class="title">
                                    기업명
                                </h5>
                                <div class="write">
                                    <input  type="text" name="com_name" class="comname" placeholder="기업명을 입력해주세요">
                                </div>
                            </div>
       
                        

                            <div class="comadd">
                                <h5 class="title">창립일 </h5>
                                <div class="comadressyear">
                                    <input  type="date" name="" class="comadress">
                                    <!-- <input  type="date" name="com_year" class="comadress"> -->
                                </div>
                            </div>
                        </div>
                        
                    </div>


                    <!-- 컬럼 시작-->


                <div class="column"> 


                    <div class="col1">
                        <div class="columnA">
                            <h5 class="title">회사 소개</h5>
                        </div>
                        <div class="columnAA">
                            <textarea name="com_content" class="detailtext" placeholder="회사소개를 입력해주세요"></textarea>
                        </div>
                    </div>



                    <div class="col7">
                        <div class="columnA">
                            <h5 class="title">회사 위치</h5>
                        </div>
                        <div class="columnBB">
                            <div class="detail">
                                <div id="map" clss="map"></div>
                                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=de7cac757fedb4da8958fa692849033d"></script>
                                <script>
                                    var container = document.getElementById('map');
                                    var options = {
                                        center: new kakao.maps.LatLng(33.450701, 126.570667),
                                        level: 3
                                    };
                            
                                    var map = new kakao.maps.Map(container, options);
                                </script>
                            </div>
                                <div class="mapLocation">
                                    <input  type="" name="com_location" class="maptext" placeholder="지도상의 주소를 입력해주세요">
                                </div>
                        </div>
                    </div>

                    <div class="col8">
                        <div class="columnA">
                                <h5 class="title">
                                    기업정보
                                </h5>
                            </div>
                            <div class="content">
                                
                                <div class="contentDetail">
                                    <div class="comname1">
                                        <h5 class="name">
                                            매출액 (2024년)
                                        </h5>
                                    </div>
                                    <div class="comname2">
                                        <input type="text" name="com_sale" class="cominfotext" placeholder="정보를 입력해주세요">
                                    </div>
                                </div>

                                <div class="contentDetail">
                                    <div class="comname1">
                                        <h5 class="name">
                                            기업유형
                                        </h5>
                                    </div>
                                    <div class="comname2">
                                        <select name="com_type" id="com_type" class="cominfotext">
                                            <option name="com_type" value="" selected>유형을 선택해주세요</option>
                                            <option name="com_type" value="합명회사">합명회사</option>
                                            <option name="com_type" value="합자회사">합자회사</option>
                                            <option name="com_type" value="유한책임회사">유한책임회사</option>
                                            <option name="com_type" value="주식회사">주식회사</option>
                                            <option name="com_type" value="유한회사">유한회사</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="contentDetail">
                                    <div class="comname1">
                                        <h5 class="name">
                                            평균연봉
                                        </h5>
                                    </div>
                                    <div class="comname2">
                                        <input type="text" name="com_salary" class="cominfotext" placeholder="정보를 입력해주세요">
                                    </div>
                                </div>

                                <div class="contentDetail">
                                    <div class="comname1">
                                        <h5 class="name">
                                            대표자명
                                        </h5>
                                    </div>
                                    <div class="comname2">
                                        <input type="text" name="com_CEO" class="cominfotext" placeholder="정보를 입력해주세요">
                                    </div>
                                </div>

                                <div class="contentDetail">
                                    <div class="comname1">
                                        <h5 class="name">
                                            홈페이지
                                        </h5>
                                    </div>
                                    <div class="comname2">
                                        <input type="url" name="com_site" class="cominfotext" placeholder="정보를 입력해주세요">
                                    </div>
                                </div>

                                <div class="contentDetail">
                                    <div class="comname1">
                                        <h5 class="name">
                                            가입 사원수 (인원)
                                        </h5>
                                    </div>
                                    <div class="comname2">
                                        <input type="number" name="com_employee" class="cominfotext" placeholder="단위 : 명">
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                        <div class="submit">    
                            <input type="button" value="수정 취소" class="btn" onclick="location.href='company_InfoManagement'">
                            <input type="submit" class="btn" value="수정 완료">
                        </div>
                            
                    </div>



                </div><!-- 컬럼 끝-->
                </div> <!-- left 끝-->
                <!-- <div class="right">
                    
                </div> right 끝 -->
            </form>
            </div> <!-- wrap 끝-->
        </section> <!--section 끝 -->


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
    </div>
</html>