<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.Map, java.util.HashMap" %>

<%
    // contactTypeMap 정의
    Map<Integer, String> contactTypeMap = new HashMap<>();
    contactTypeMap.put(1, "정규직");
    contactTypeMap.put(2, "계약직");
    contactTypeMap.put(3, "인턴직");
    contactTypeMap.put(4, "프리랜서");
    pageContext.setAttribute("contactTypeMap", contactTypeMap);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공고확인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/comRegistCheck.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
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
                        <h3>채용공고와 지원자 관리를 한번에 ! 빠르고 쉽게 채용하세요.</h3>
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
                                <a href="#">진행중인 공고</a>
                            </h3>
                            <h3 class="tabNum">
                                <a href="#">1</a>
                            </h3>
                        </div>                    
                        <div class="tabCon post">
                            <h3 class="tabTitle">
                                <a href="#">마감된 공고</a>
                            </h3>
                            <h3 class="tabNum">
                                <a href="#">10</a>
                            </h3>
                        </div>
                    </div><!-- tabWrap 끝-->
                    
                    <div class="filterall">
                        <div class="filters">
                            <button class="filter1">최근등록일순</button>
                            <div class="filter2">
                                <select onchange="categoryChange(this)" class="custom-select">
                                    <option value="">채용유형</option>
                                    <option value="정규직">정규직</option>
                                    <option value="계약직">계약직</option>
                                    <option value="인턴직">인턴직</option>
                                    <option value="프리랜서">프리랜서</option>
                                </select>
                            </div>
                        </div>
                        <div class="writebtn">
                            <button type="button" class="wbtn" onclick="location.href='comRegistUpload'">공고작성</button>
                        </div>
                    </div>
                    
                    <div class="conWrap recent" id="jobList	">
                        <c:forEach var="notice" items="${noticeList}">
                            <div class="box recent disB">
                                <div class="left">
                                    <!-- Contact Type을 정수에서 문자열로 변환 -->
                                    <div class="label">
                                        <c:out value="${contactTypeMap[notice.notice_contactType]}"/>
                                    </div>
                                    <div class="job-infoWrap"> 
                                        <h5 class="job-title">${notice.notice_title}</h5>
                                        <div class="job-option">
                                            <div class="dates">
                                                <fmt:formatDate value="${notice.notice_startDate}" pattern="yyyy.MM.dd" />~
                                                <fmt:formatDate value="${notice.notice_endDate}" pattern="yyyy.MM.dd" />
                                            </div>
                                            <div class="progress"> 
                                                공고: 
                                                <c:choose>
                                                    <c:when test="${today >= notice.notice_startDate && today <= notice.notice_endDate}">
                                                        진행중    
                                                    </c:when>
                                                    <c:otherwise>
                                                        마감
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>                                
                                    </div>
                                </div>
                                <div class="right">
                                    <button class="btn" onclick="location.href='공고페이지'">공고확인</button>
                                    <input type="button" class="btn" value="복사" id="copy_btn">
                                    <input type="button" class="btn" value="삭제" id="insert_btn">
                                    <button class="listbtn" onclick="location.href='지원자확인페이지'">지원자목록</button>
                                </div>
                            </div>
                        </c:forEach>
                    </div><!-- conWrap recent 끝-->

                </div> <!-- container끝 -->
            </main>
			<h3>${pageMaker}</h3> 
				<div class="div_page">
					<ul>
						<c:if test="${pageMaker.prev}">
							<!-- <li>[Previous]</li> -->
							<li class="paginate_button">
								<a href="${pageMaker.startPage - 1}">
									[Previous]
								</a>
							</li>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<!-- <li>[${num}]</li> -->
							<li class="paginate_button" ${pageMaker.cri.pageNum == num ? "style='background-color: yellow;'" : ""}>
								<!-- [${num}] -->
								<a href="${num}">
									[${num}]
								</a>
							</li>
						</c:forEach>
						<c:if test="${pageMaker.next}">
							<!-- <li>[Next]</li> -->
							<li class="paginate_button">
								<a href="${pageMaker.endPage + 1}">
									[Next]
								</a>
							</li>
						</c:if>
					</ul>
				</div>
				<form id="actionForm" method="get">
						<!-- pageNum의 이름으로 pageMaker.cri.pageNum 전송 -->
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<!-- amount 이름으로 pageMaker.cri.amount 전송 -->
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
					</form>
        </div> <!-- //main-content -->

    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>
<script>
    $(document).ready(function() {
        // 메뉴 활성화
        $('.navMenu ul li').click(function(){
            $(this).addClass('active');
            $('.navMenu ul li').not(this).removeClass('active');
        });

        // 글자수 제한 + 넘는건 ...처리
        $('.cardConBottom > .title').each(function() {
            var length = 21; //표시할 글자 수 정하기
            if($(this).text().length >= length) {
                $(this).text($(this).text().substr(0, length) + '...'); //지정한 글자수 이후 표시할 텍스트 '...'
            }
        });

        // 탭 메뉴
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

        // 복사 버튼
        $("#copy_btn").click(function(){
            if(confirm("정말복사하시겠습니까?") == true){
                alert("복사되었습니다");
            } else {
                return;
            }
        });

        // 삭제 버튼
        $("#insert_btn").click(function(){
            if(confirm("정말삭제하시겠습니까?") == true){
                alert("삭제되었습니다");
            } else {
                return;
            }
        });

// <!--        // 필터-->
// <!--        $(".filter1").on("click",function(e){-->
// <!--            $(".conWrap.value").css({"display":"none"});-->
// <!--            $(".conWrap.recent").css({"display":"block"});-->
// <!--        });-->

// <!--        $(".filter2").on("click",function(e){-->
// <!--            $(".conWrap.recent").css({"display":"none"});-->
// <!--            $(".conWrap.value").css({"display":"block"}	);-->
// <!--        });  -->
// <!--    });-->


    document.addEventListener('DOMContentLoaded', (event) => {
                function getContactTypeText(contactTypeValue) {
                    let contactTypeText;
                    switch (contactTypeValue) {
                        case 1:
                            contactTypeText = "정규직";
                            break;
                        case 2:
                            contactTypeText = "계약직";
                            break;
                        case 3:
                            contactTypeText = "인턴직";
                            break;
                        case 4:
                            contactTypeText = "프리랜서";
                            break;
                        default:
                            contactTypeText = "알 수 없음";
                    }
                    return contactTypeText;
                }

                // 저장된 값 불러오기
                let contactTypeValue = parseInt(localStorage.getItem("contactTypeValue"));
                let contactTypeText = getContactTypeText(contactTypeValue);

                // 값 출력
                document.getElementById("contactTypeText").innerText = contactTypeText;
            });
            
            
            
            function categoryChange(selectElement) {
                const selectedValue = selectElement.value;

                // AJAX 요청을 보내서 필터링된 데이터를 가져옴
                $.ajax({
                    url: '${pageContext.request.contextPath}/filterJobs',
                    type: 'GET',
                    data: { contactType: selectedValue },
                    success: function(response) {
                        // 서버로부터 필터링된 데이터를 받아서 jobList를 업데이트
                        $('#jobList').html(response);
                    },
                    error: function(xhr, status, error) {
                        console.error('AJAX 요청 실패:', status, error);
                    }
                });
            }
            
            
            /*페이징*/
            // 위의 form id actionForm
                var actionForm = $("#actionForm");

                // 페이지번호처리
                $(".paginate_button a").on("click",function(e){
                    //기본 동작 막음
                    e.preventDefault();
                    console.log("click!!!");
                    console.log("@# href=>"+$(this).attr("href"));

                    // 게시글 클릭후 뒤로가기 누른후 다른게시글 클릭할때 &boardNo 번호 계속 누적되는거 방지
                    var bno = actionForm.find("input[name='notice_num']").val();
                    if(bno != ""){
                        actionForm.find("input[name='notice_num']").remove();
                    }	

                    // actionForm이 가져오는 페이지번호를 전송
                    // attr = 속성
                    actionForm.find("input[name='pageNum']").val($(this).attr("href"));
                    //클릭한게시물의 해당페이지번호로 이동
                    // actionForm.submit();
                    actionForm.attr("action","list").submit();
                    
                });//end of paginate_button click

                //게시글처리
                $(".move_link").on("click",function(e){
                    e.preventDefault();

                    console.log("@# move_link click~");
                    console.log("@# href=>"+$(this).attr("href"));

                    var targetBno = $(this).attr("href");

                    // 게시글 클릭후 뒤로가기 누른후 다른게시글 클릭할때 &boardNo 번호 계속 누적되는거 방지
                    var bno = actionForm.find("input[name='notice_num']").val();
                    if(bno != ""){
                        actionForm.find("input[name='notice_num']").remove();
                    }


                    // content_view?boardNo=${dto.boardNo} 를 actionForm으로 처리
                    // boardNo를 가져와야함
                    // http://localhost:8400/content_view?pageNum=12&amount=10&boardNo=187
                    actionForm.append("<input type='hidden' name='notice_num' value='"+targetBno+"'>");
                    // 그냥서브밋으론 이동불가능
                    // actionForm.submit();
                    // 컨트롤러에 content_view 로 찾아감
                    actionForm.attr("action","comRegistCheck").submit();
                });//end of move_link
            

                
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