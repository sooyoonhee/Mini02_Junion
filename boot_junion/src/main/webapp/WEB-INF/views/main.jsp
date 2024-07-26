<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MainPage</title>
<!--    <link rel="stylesheet" href="css/default.css">-->
<!--    <link rel="stylesheet" href="css/style.css">-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
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
    <%@ include file="header.jsp" %>

    <main>
        <div class="banner">
            <div class="mainBanner">
                <div class="content">
                    <h5 class="comTitle">JUNION</h5>
                    <h5 class="mainTitle">주니온에서 지원하는</h5>
                    <h5 class="mainTitle">신입개발자 취업성공패키지</h5>
                    <div class="descText">면접에서부터 실무에서 필요한 스킬력까지 책임집니다.</div>
                    <div class="descText">면접에서부터 실무에서 필요한 스킬력까지 책임집니다.</div>
                </div>
                <div class="bannerImage"></div>
            </div>
        </div><!--banner 끝-->
            <div class="innerCon">
                <section>
                    <div class="sectionA">
                        <div class="sectionName">
                            <div class="subtitle">신입 개발자 채용</div>
                                <a href="#" class="more">더보기
                                    <i class="fa-solid fa-angle-right"></i>
                                </a>
                        </div><!--sectionName-->
                        <div class="cardPost">
                            <a class="con">
                                <div class="image"></div>
                                <div class="postSub">
                                    <div class="category">
                                        IT / 컨텐츠
                                    </div>
                                    <div class="name">
                                        하이퍼 커넥터
                                    </div>
                                </div>
                            </a><!--con-->
                            <a href="#" class="con">
                                <div class="image"></div>
                                <div class="postSub">
                                    <div class="category">
                                        IT / 컨텐츠
                                    </div>
                                    <div class="name">
                                        하이퍼 커넥터
                                    </div>
                                </div>
                            </a><!--con-->
                            <a href="#" class="con">
                                <div class="image"></div>
                                <div class="postSub">
                                    <div class="category">
                                        IT / 컨텐츠
                                    </div>
                                    <div class="name">
                                        하이퍼 커넥터
                                    </div>
                                </div>
                            </a><!--con-->
                            <a href="#" class="con">
                                <div class="image"></div>
                                <div class="postSub">
                                    <div class="category">
                                        IT / 컨텐츠
                                    </div>
                                    <div class="name">
                                        하이퍼 커넥터
                                    </div>
                                </div>
                            </a><!--con-->
                        </a><!--cardPost-->
                    </div><!--sectionA 끝-->
                    <div class="sectionB">
                        <div class="sectionName">
                            <div class="subtitle">테마 기업</div>
                            <a href="#" class="more">더보기
                                <i class="fa-solid fa-angle-right"></i>
                            </a>
                        </div><!--sectionName-->
                        <div class="themaCon">
                            <div class="postThema">
                                <div class="sectionName">
                                    <h5 class="subtitle"><span>신입</span>TOP 50</h5>
                                    <a href="#" class="moreView">더보기
                                        <i class="fa-solid fa-angle-right"></i>
                                    </a>
                                </div><!--sectionName-->
                                <div class="themaSection">
                                    <ul class="one">
                                        <li class="data a">
                                            <h5 class="number"><strong>1</strong></h5>
                                            <div class="name">
                                                <div class="conTitle">현대자동차</div>
                                                <div class="conSub">6월 공개채용</div>
                                            </div>
                                            <div class="dDay"><span>D-4</span></div>
                                        </li><!--data 영역-->
                                        <li class="data b">
                                            <h5 class="number"><strong>2</strong></h5>
                                            <div class="name">
                                                <div class="conTitle">현대자동차</div>
                                                <div class="conSub">6월 공개채용</div>
                                            </div>
                                            <div class="dDay"><span>D-4</span></div>
                                        </li><!--data 영역-->
                                        <li class="data c">
                                            <h5 class="number">3</h5>
                                            <div class="name">
                                                <div class="conTitle">현대자동차</div>
                                                <div class="conSub">6월 공개채용</div>
                                            </div>
                                            <div class="dDay"><span>D-4</span></div>
                                        </li><!--data 영역-->
                                        <li class="data d">
                                            <h5 class="number">4</h5>
                                            <div class="name">
                                                <div class="conTitle">현대자동차</div>
                                                <div class="conSub">6월 공개채용</div>
                                            </div>
                                            <div class="dDay"><span>D-4</span></div>
                                        </li><!--data 영역-->
                                        <li class="data e">
                                            <h5 class="number">5</h5>
                                            <div class="name">
                                                <div class="conTitle">현대자동차</div>
                                                <div class="conSub">6월 공개채용</div>
                                            </div>
                                            <div class="dDay"><span>D-4</span></div>
                                        </li><!--data 영역-->
                                    </ul>
                                </div><!--themaSection 리스트 영역-->
                            </div><!--thema 영역-->
                            <div class="postThema">
                                <div class="sectionName">
                                    <div class="subtitle"><span>경력</span> 인기 TOP 50</div>
                                    <a href="#" class="moreView">더보기
                                        <i class="fa-solid fa-angle-right"></i>
                                    </a>
                                </div><!--sectionName-->
                                <div class="themaSection">
                                    <ul class="one">
                                        <li class="data a">
                                            <h5 class="number"><span>1</span></h5>
                                            <div class="name">
                                                <div class="conTitle">현대자동차</div>
                                                <div class="conSub">6월 공개채용</div>
                                            </div>
                                            <div class="dDay"><span>D-4</span></div>
                                        </li><!--data 영역-->
                                        <li class="data b">
                                            <h5 class="number">2</h5>
                                            <div class="name">
                                                <div class="conTitle">현대자동차</div>
                                                <div class="conSub">6월 공개채용</div>
                                            </div>
                                            <div class="dDay"><span>D-4</span></div>
                                        </li><!--data 영역-->
                                        <li class="data c">
                                            <h5 class="number">3</h5>
                                            <div class="name">
                                                <div class="conTitle">현대자동차</div>
                                                <div class="conSub">6월 공개채용</div>
                                            </div>
                                            <div class="dDay"><span>D-4</span></div>
                                        </li><!--data 영역-->
                                        <li class="data d">
                                            <h5 class="number">4</h5>
                                            <div class="name">
                                                <div class="conTitle">현대자동차</div>
                                                <div class="conSub">6월 공개채용</div>
                                            </div>
                                            <div class="dDay"><span>D-4</span></div>
                                        </li><!--data 영역-->
                                        <li class="data e">
                                            <h5 class="number">5</h5>
                                            <div class="name">
                                                <div class="conTitle">현대자동차</div>
                                                <div class="conSub">6월 공개채용</div>
                                            </div>
                                            <div class="dDay"><span>D-4</span></div>
                                        </li><!--data 영역-->
                                    </ul>
                                </div><!--themaSection 리스트 영역-->
                            </div><!--thema 영역-->
                            <div class="postThema">
                                <div class="sectionName">
                                    <div class="subtitle"><span>오늘</span> 뜬 인기 TOP 50</div>
                                    <a href="#" class="moreView">더보기
                                        <i class="fa-solid fa-angle-right"></i>
                                    </a>
                                </div><!--sectionName-->
                                <div class="themaSection">
                                    <ul class="one">
                                        <li class="data a">
                                            <h5 class="number"><span>1</span></h5>
                                            <div class="name">
                                                <div class="conTitle">현대자동차</div>
                                                <div class="conSub">6월 공개채용</div>
                                            </div>
                                            <div class="dDay"><span>D-4</span></div>
                                        </li><!--data 영역-->
                                        <li class="data b">
                                            <h5 class="number">2</h5>
                                            <div class="name">
                                                <div class="conTitle">현대자동차</div>
                                                <div class="conSub">6월 공개채용</div>
                                            </div>
                                            <div class="dDay"><span>D-4</span></div>
                                        </li><!--data 영역-->
                                        <li class="data c">
                                            <h5 class="number">3</h5>
                                            <div class="name">
                                                <div class="conTitle">현대자동차</div>
                                                <div class="conSub">6월 공개채용</div>
                                            </div>
                                            <div class="dDay"><span>D-4</span></div>
                                        </li><!--data 영역-->
                                        <li class="data d">
                                            <h5 class="number">4</h5>
                                            <div class="name">
                                                <div class="conTitle">현대자동차</div>
                                                <div class="conSub">6월 공개채용</div>
                                            </div>
                                            <div class="dDay"><span>D-4</span></div>
                                        </li><!--data 영역-->
                                        <li class="data e">
                                            <h5 class="number">5</h5>
                                            <div class="name">
                                                <div class="conTitle">현대자동차</div>
                                                <div class="conSub">6월 공개채용</div>
                                            </div>
                                            <div class="dDay"><span>D-4</span></div>
                                        </li><!--data 영역-->
                                    </ul>
                                </div><!--themaSection 리스트 영역-->
                            </div><!--thema 영역-->
                        </div><!--themaCon-->
                    </div><!--sectionB 끝-->
                </section>
            </div><!--innerCon 끝-->

            <div class="subBanner">
                <a href="#" class="content">
                    <div class="bannerTitle">주니온에서 지원하는 신입개발자 취업성공패키지</div>
                    <div class="bannerSubTitle">면접에서 부터 실무에서 필요한 스킬력까지 책임집니다.</div>
                </a><!--content 끝-->
            </div><!--subBanner 끝-->
            
            <div class="innerCon">
                <div class="sectionC">
                    <div class="sectionName">
                        <div class="subtitle">퇴사율 5% 미만 기업</div>
                        <a href="#" class="more">더보기
                            <i class="fa-solid fa-angle-right"></i>
                        </a>
                    </div><!--sectionName 끝-->
                    <div class="postSection">
                        <div class="a">
                            <div class="conImage"></div>
                            <div class="conProfile">
                                <div class="conTitle">투썸플레이스</div>
                                <div class="conSec">숙박, 음식점</div>
                            </div>
                            <button type="button" class="more">바로가기</button>
                        </div>
                        <div class="a">
                            <div class="conImage"></div>
                            <div class="conProfile">
                                <div class="conTitle">투썸플레이스</div>
                                <div class="conSec">숙박, 음식점</div>
                            </div>
                            <button type="button" class="more">바로가기</button>
                        </div>
                        <div class="a">
                            <div class="conImage"></div>
                            <div class="conProfile">
                                <div class="conTitle">투썸플레이스</div>
                                <div class="conSec">숙박, 음식점</div>
                            </div>
                            <button type="button" class="more">바로가기</button>
                        </div>
                        <div class="a">
                            <div class="conImage"></div>
                            <div class="conProfile">
                                <div class="conTitle">투썸플레이스</div>
                                <div class="conSec">숙박, 음식점</div>
                            </div>
                            <button type="button" class="more">바로가기</button>
                        </div>
                        <div class="a">
                            <div class="conImage"></div>
                            <div class="conProfile">
                                <div class="conTitle">투썸플레이스</div>
                                <div class="conSec">숙박, 음식점</div>
                            </div>
                            <button type="button" class="more">바로가기</button>
                        </div>
                        <div class="a">
                            <div class="conImage"></div>
                            <div class="conProfile">
                                <div class="conTitle">투썸플레이스</div>
                                <div class="conSec">숙박, 음식점</div>
                            </div>
                            <button type="button" class="more">바로가기</button>
                        </div>
                        <div class="a">
                            <div class="conImage"></div>
                            <div class="conProfile">
                                <div class="conTitle">투썸플레이스</div>
                                <div class="conSec">숙박, 음식점</div>
                            </div>
                            <button type="button" class="more">바로가기</button>
                        </div>
                        <div class="a">
                            <div class="conImage"></div>
                            <div class="conProfile">
                                <div class="conTitle">투썸플레이스</div>
                                <div class="conSec">숙박, 음식점</div>
                            </div>
                            <button type="button" class="more">바로가기</button>
                        </div>
                        <div class="a">
                            <div class="conImage"></div>
                            <div class="conProfile">
                                <div class="conTitle">투썸플레이스</div>
                                <div class="conSec">숙박, 음식점</div>
                            </div>
                            <button type="button" class="more">바로가기</button>
                        </div>
                        <div class="a">
                            <div class="conImage"></div>
                            <div class="conProfile">
                                <div class="conTitle">투썸플레이스</div>
                                <div class="conSec">숙박, 음식점</div>
                            </div>
                            <button type="button" class="more">바로가기</button>
                        </div>
                        <div class="a">
                            <div class="conImage"></div>
                            <div class="conProfile">
                                <div class="conTitle">투썸플레이스</div>
                                <div class="conSec">숙박, 음식점</div>
                            </div>
                            <button type="button" class="more">바로가기</button>
                        </div>
                        <div class="a">
                            <div class="conImage"></div>
                            <div class="conProfile">
                                <div class="conTitle">투썸플레이스</div>
                                <div class="conSec">숙박, 음식점</div>
                            </div>
                            <button type="button" class="more">바로가기</button>
                        </div>
                    </div><!--postSection 끝-->
                </div><!--sectionC 끝-->
            </div><!--innerCon 끝-->
        </main>



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
        </footer><!--footer 끝-->
    </div>
</body>
</html>