<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>인재풀(개인) 목록페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jobpostingIndividualSupport.css">
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<!-- import js -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<!--   <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>-->

</head>

<body>
	<%@ include file="header.jsp" %>

	<!-- 섹션-->
	        <section> 
	            <div class="wrap">     
	                <div class="devlist">


	                    <div class="personpool">
	                        <h5 class="t1">
	                            원하는 직무에 딱 맞는 우수한 인재를 찾아보세요
	                        </h5>
	                    </div>


<!--	                    <div class="filterbox">
	                        <div class="left">
	                            <div class="sbox">
	                                <form>
	                                    <select class="select1" id="select" name="select">
	                                      <option value="">직군 · 직무</option>
	                                        <option value="s1">공지사항</option>
	                                        <option value="s1">이벤트</option>
	                                    </select>
	                                  </form>
	                            </div>  selectbox 끝 
	                            <div class="sbox">
	                                <form>
	                                    <select class="select1" id="select" name="select">
	                                      <option value="">지역</option>
	                                        <option value="s1">공지사항</option>
	                                        <option value="s1">이벤트</option>
	                                    </select>
	                                  </form>
	                            </div>  selectbox 끝 
	                            <div class="sbox">
	                                <form>
	                                    <select class="select1" id="select" name="select">
	                                      <option value="">경력</option>
	                                        <option value="s1">공지사항</option>
	                                        <option value="s1">이벤트</option>
	                                    </select>
	                                  </form>
	                            </div>  selectbox 끝 




	                        </div>  레프트 끝

	                        <div class="right">
	                            <button class="fil2">
	                                <div class="f1">
	                                    <h5 class="but1">
	                                        검색
	                                    </h5>
	                                </div>
	                            </button>
	                        </div>   라이트 끝

	                    </div>  filterbox 끝 -->

	                    <div class="selbox">
	                        <div class="sel">
	                            <a href="#" class="li">
	                                <h5 class="li">
	                                    <!--추천순-->
	                                </h5>
	                            </a>
	                        </div>
	                        <div class="sel">
	                            <a href="#" >
	                                <h5 class="li">
	                                    <!--최신순-->
	                                </h5>
	                            </a>
	                        </div>
	                    </div>

						<c:forEach items="${jobpostingIndividualSupport}" var="sup">
		                    <div class="pplist"> <!--  pplist 시작-->
								<a href="resumeInfo?resume_num=${sup.resume_num}">
									<div class="pp"> 
										<div class="imgbox">
											<img src="images/people.svg" alt="#" class="img">
										</div> 
										<div class="tt">
											<h5 class="t1">
												${sup.user_name}
											</h5>
										</div>
										<div class="tt">
											<h5 class="t1">
												${sup.resume_gender} ${sup.resume_age}세
											</h5>
										</div>
										<div class="tt">
											<h5 class="t1">
												${sup.career_month}
											</h5>
										</div>
										<div class="buttbox1">
											<div class="b1" id="stack">
												<!-- ${sup.resume_stack} -->
											</div>
										</div>
										
										<div class="right">
											<div class="buttbox2">
	<!--		                                    <h5 class="b2">
													이력서열람
												</h5>-->
											</div> 
											<div class="buttbox2">
	<!--		                                    <h5 class="b2">
													제안하기
												</h5>-->
											</div> 
		
										
											<div class="date">
												<h5 class="d1">
													${sup.resume_writeDate}
												</h5>
											</div>
										</div>
		
									</div>  
								</a>
		                    </div>  <!--  pplist 끝-->
						</c:forEach>
						<!-- 반복문 끝 -->
	                    

	                </div> <!-- devlist 끝 -->
	            </div> <!-- wrap 끝 -->
	        </section> <!--section 끝 -->

		<%@ include file="footer.jsp" %>
</body>







</html>
<script>

	$(document).ready(function(){

		const resumeStack = "${jobpostingIndividualSupport}";
		console.log("@####"+resumeStack);
		return false;
		const stacks = resumeStack.split(','); // 콤마로 나눠서 배열로 저장
		console.log(stacks);
		let output = "";
		for (let i = 0; i < stacks.length; i++) {
			output += "<div class=mm1>" + stacks[i].trim() + "</div>";
		}
		console.log("@# output=>" + output);
		$('#stack').html(output);
	});


	var actionForm = $("#actionForm");

	//	페이지번호 처리
	// $(".paginate_button").on("click", function (e){
	$(".paginate_button a").on("click", function (e){
		//기본 동작 막음: 페이지 링크를 통해서 이동
		e.preventDefault();
		console.log("click~!!!");
		console.log("@# href=>"+$(this).attr("href"));
		
		// stmt.executeUpdate(s);

		// 게시글 클릭후 뒤로가기 누른후 다른 페이지 클릭할때 &boardNo=번호 계속 누적되는거 방지
		var bno = actionForm.find("input[name='board_no']").val();
		if(bno != ""){
			actionForm.find("input[name='board_no']").remove();
		}

		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		// actionForm.submit();
		actionForm.attr("action","boardList").submit();
	});//end of paginate_button clcik

	
	
	
	// 	게시글 처리
	$(".move_link").on("click", function(e){
		e.preventDefault();

		console.log("@# move_link click~!!!");
		console.log("@# href=>"+$(this).attr("href"));

		
		
		var targetBno = $(this).attr("href");
	
		// 게시글 클릭후 뒤로가기 누른후 다른 게시글 클릭할때 &boardNo=번호 계속 누적되는거 방지
		var bno = actionForm.find("input[name='board_no']").val();
		if(bno != ""){
			actionForm.find("input[name='board_no']").remove();
		}

		// "content_view?boardNo=${dto.boardNo}" 를 actionForm 로 처리
		actionForm.append("<input type='hidden' name='board_no' value='"+targetBno+"'>");
		// actionForm.submit();
		// 컨트롤러에 content_view 로 찾아감
		actionForm.attr("action","boardDetailView").submit();
	});//end of move_link click
	
	
	var searchForm = $("#searchForm");
	
	
	// search 버튼 클릭
//	$("#searchForm").on("click", function(){
	$("#searchForm button").on("click", function(){
		// alert("검색");
		
		
		// 아래는 검색 종류까지만 할때 참고
		//  if (!searchForm.find("option:selected").val()){
		//	 alert("검색종류를 선택하세요");
		// 	 return false;
		//  }
		
		if(searchForm.fin("option:selected").val() != "" && !searchForm.find ("input[name = 'keyword']").val()){
			alert("키워드를 입력하세요");
			return false;
			
		}
		
		searchForm.attr("action","boardList").submit();
		
	}); // searchForm click 끝
	
	
	// type 콤보박스 변경
	$("#searchForm select").on("change",function(){
		// 전체일때
		if(searchForm.find("option:selected").val() == ""){
			// 키워드를 null값으로 변경함
			searchForm.find("input[name = 'keyword']").val("");
		}
	}); // searchForm select change 끝
</script>













