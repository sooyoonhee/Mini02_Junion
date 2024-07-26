<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이력서 목록페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/resumeList.css">
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
	                    <h3 class="memberName">이력서목록페이지</h3>
	                </div>

	                <div class="tabWrap">
	                    <div class="tabCon All">
	                        <h3 class="tabTitle">
	                            <a href="#">전체</a>
	                        </h3>
	                        <h3 class="tabNum">
	                            <a href="#">${pageMaker.total}</a>
	                        </h3>
	                    </div>                    
	                </div>
	                <div class="dataWrap">
	                    <div class="dataHeader">
	                        <input type="checkbox" id="allCheck" name="allCheck" >
	                        <button class="deleteData" onclick="deleteValue();">삭제</button>
	                        <button class="write" onclick="location.href='resumeWrite'">작성하기</button>							
	                    </div>						
	                    <div class="dataBody">                                          	
							<c:forEach items="${resumeList}" var="dto">							
								<div class="dataBodyCon">
									<input type="checkbox" class="checkbox" name="RowCheck" value="${dto.resume_num}">	                            
									<div class="resumeDiv">
										<h3 class="resumeTitle">
											<a href="resumeInfo?resume_num=${dto.resume_num}">${dto.resume_title}</a>
											<!--<a class="move_link" href="resumeInfo?resume_num=${dto.resume_num}">${dto.resume_title}</a>-->
										</h3>
										<div class="resumeOption">
											<input type="hidden" class="career_start" value="${dto.career_start}">
											<input type="hidden" class="career_end" value="${dto.career_end}">
											<div class="optionCon career">경력: ${dto.career_month}</div>	
											<div class="optionCon">희망직무: SI</div>
											<div class="optionCon">희망연봉: ${dto.resume_pay}</div>
											<div class="optionCon">희망지역: 창원</div>
										</div>
									</div>
									<div class="leftDataWrap">
										<select name="resume_offer" id="resume_offer" onchange="changeOfferState('${dto.resume_num}',this.value);">
											<option value="예"<c:if test="${dto.resume_offer == '예'}">selected='selected'</c:if>>적극 구직중이에요. 제안 받을게요</option>
											<option value="아니오" <c:if test="${dto.resume_offer == '아니오'}">selected='selected'</c:if>>제안 받지 않을래요.</option>
										</select>
										<div class="modifyDiv">
											<button class="modify" onclick="location.href='resumeModify?resume_num=${dto.resume_num}'">수정하기</button>
											
										</div>									
										<span class="icon delete">
											<i class="fa-regular fa-trash-can"></i>
										</span>
									</div>
									<div class="deletePop">
										<div class="popBlackBg">
											<div class="popDiv Pop">
												<div class="popH">
													<span class="icon cancel">
														<i class="fa-solid fa-xmark"></i>
													</span>
												</div>
												<div class="popM">
													<h3 class="title">지원내역을 삭제 하시겠습니까?</h3> 
												</div>
												<div class="popB">
													<div class="buttonWrap">
														<input type="button" value="예" class="btn buttonGray" onclick="deleteValue();">
														<button class="no buttonGray">아니오</button>
													</div> 
												</div>
											</div>
										</div>
									</div>    <!-- .deletePop 끝 -->                            
								</div> <!-- 끝-->										
							</c:forEach>	                        
	                    </div> <!-- data_body-->
						<!--<h3>${pageMaker}</h3>-->
						<div class="div_page">
							<ul>
								<c:if test="${pageMaker.prev}">
									<!-- <li>Previous</li> -->
									<li class="paginate_button">
										<a href="${pageMaker.startpage - 1}">
											Previous
										</a>
									</li>
								</c:if>
								<c:forEach var="num" begin="${pageMaker.startpage}" end="${pageMaker.endpage}">
									<!-- <li>${num}</li> -->
									<!-- <li ${pageMaker.cri.pageNum == num ? "style='color:#f00; font-weight: 600';'" : ""}>${num}</li> -->
									<!-- <li ${pageMaker.cri.pageNum == num ? "style='color:#f00; font-weight: 600';'" : ""}> -->
									<li class="paginate_button" ${pageMaker.cri.pageNum == num ? "style='border:2px solid #FFA500; font-weight: 900';'" : ""}>
										<a href="${num}">
											${num}
										</a>
									</li>
								</c:forEach>
								<c:if test="${pageMaker.next}">
									<!-- <li>next</li> -->
									<li class="paginate_button"><input type="hidden" name="">
										<a href="${pageMaker.endpage + 1}">
											Next
										</a>
									</li>
								</c:if>
							</ul>
						</div> <!-- div_page-->
						<!-- 데이터를 가지고 컨트롤러단으로 가기때문에 listWithPaging-->
						<!-- <form action="listWithPaging" method="get" id="actionForm"> -->
						<!-- <form action="list" method="get" id="actionForm"> -->
						<form method="get" id="actionForm">
							<!-- 페이지 번호를 "pageNum" 이라는 이름으로 가져감 이건 굳이 보일필요는없기때문에 hidden type-->
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
							<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						</form>
	                </div> <!-- dataWrap-->
	                                  
	            </div> <!-- mainContainer 끝 -->                              
	        </main>    
	    </div> <!-- mainContent -->		
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>
<script>

	
// 24-07-09 이재원
// 체크박스 삭제 기능
// 전체삭제 / 부분삭제 둘다 가능	
$(function(){
	var chkObj = document.getElementsByName("RowCheck");
	var rowCnt = chkObj.length;
	
	$("input[name='allCheck']").click(function(){
		var chk_listArr = $("input[name='RowCheck']");
		for(var i =0; i<chk_listArr.length; i++) 
		{
			chk_listArr[i].checked = this.checked;
		}
	});
	$("input[name='RowCheck']").click(function(){
		if($("input[name='RowCheck']:checked").length == rowCnt) 
		{
			$("input[name='allCheck']")[0].checked = true;
		}
		else 
		{
			$("input[name='allCheck']")[0].checked = false;
		}	
	});
});	

function deleteValue() 
{
	var url="resumeDelete";
	var valueArr = new Array();
	var list = $("input[name='RowCheck']");
	for(var i=0; i < list.length; i++) 
	{
		if(list[i].checked) 
		{
			valueArr.push(list[i].value);
		}
	}
	if(valueArr.length ==0) 
	{
		alert("선택된 글이 없습니다.");
	}
	else 
	{
		var chk = confirm("정말 삭제하시겠습니까?");
		$.ajax
		({
			url:url,
			type:'POST',
			traditional : true,
			data: 
			{
				valueArr : valueArr
			},
			success : function(jdata) 
			{
				if(jdata =1) 
				{
					alert("삭제성공");
					location.replace("resumeList")
				}
				else 
				{
					alert("삭제실패");
				}
			}
		});// ajax 끝
	}	
}
	
$(document).ready(function()
{					
	/* 삭제 */
	$(".icon.delete").click(function(){
		$(this).parent().siblings(".deletePop").show();
	});

	$(".icon.cancel").on("click",function(){
		$(this).parents(".deletePop").hide();
	});		
});

// 셀렉트 박스 설정 시 DB 업데이트 구현
function changeOfferState(resume_num, resume_offer) 
{
	$.ajax
	({
		url: "changeOfferState",
		type:"POST",
		data: {"resume_num":resume_num,"resume_offer":resume_offer},
		success: function() 
		{
			alert("변경 성공!");			                                                                                                                                    
			console.log(data);
		},
		error: function(error) 
		{
			console.log(error);
			alert("실패");
		}
	});
}	
</script>
<script>
	var actionForm = $("#actionForm");

	// 페이지번호 처리
	$(".paginate_button a").on("click", function(e){
		// 기본 동작 막음
		e.preventDefault();
		console.log("@# href=>"+$(this).attr("href"));

		// 게시글 클릭 후 뒤로가기 누른 후 다른 페이지 클릭할때 &boardNo= 번호 계속 누적되는거 방지
		var bno = actionForm.find("input[name='resume_num']").val();
		if(bno != "") 
		{
			actionForm.find("input[name='resume_num']").remove();
		}

		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		// actionForm.submit();

		// ★ 뒤로가기했다가 다른번호 누르면 페이징 기능 고장나는거 수정 form action="list"를 빼고 이렇게 속성
		actionForm.attr("action","resumeList").submit(); 
	}); // paginate_button 클릭 끝

	// 게시글 처리
	$(".move_link").on("click", function(e){
		e.preventDefault();
		console.log("@@move_link click");
		console.log("@# href=>"+$(this).attr("href"));

		var targetBno = $(this).attr("href");

		// ★ 뒤로가기했다가 다른번호 누르면 앞에 번호가 남아있어서 앞에번호 날리는 기능
		// 컨텐트 뷰로 가기전에 글번호
		var bno = actionForm.find("input[name='resume_num']").val();
		if(bno != "") 
		{
			actionForm.find("input[name='resume_num']").remove();
		}


		// "content_view?boardNo=${dto.boardNo}" 를 actionForm로 처리
		actionForm.append("<input type='hidden' name='resume_num' value='"+targetBno+"'>")
		
		// actionForm.submit(); => content_view로 가야하는데 얘는 list로 감
		// 컨트롤러에 있는 content_view로 찾아감
		// content_view?boardNo=294 에서 밑에로 변경됌
		// content_view?pageNum=1&amount=10&boardNo=294  boardNo이 추가됌
		actionForm.attr("action","resumeInfo").submit(); 

		//목록보기에서 해당페이지 목록으로 가려면 content_view.jsp에서 처리해야함.
		
	}); // move_link 클릭 끝
	// contentView -> 페이지번호(클릭시)+ 페이징처리(cri 값들 : 페이지번호, amount) 
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