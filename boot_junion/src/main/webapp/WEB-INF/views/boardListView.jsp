<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판 목록페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board_list.css">
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
	            <div class="board">



	                <div class="headbox">
	                    <h5 class="head">
	                        커뮤니티
	                    </h5>
	                </div> 

	                <div class="subbox">

	                    <div class="sub">
	                        <h5 class="s1">
	                            번호
	                        </h5>
	                    </div>
	                    <div class="sub">
	                        <h5 class="s1">
	                            제목
	                        </h5>
	                    </div>
	                    <div class="sub">
	                        <h5 class="s1">
	                            
	                        </h5>
	                    </div>
	                    <div class="sub">
	                        <h5 class="s1">
	                            작성자
	                        </h5>
	                    </div>
	                    <div class="sub">
	                        <h5 class="s1">
	                            날짜
	                        </h5>
	                    </div>
	                    <div class="sub">
	                        <h5 class="s1">
	                            조회
	                        </h5>
	                    </div>
	                    <div class="sub">
	                        <h5 class="s1">
	                            추천
	                        </h5>
	                    </div>
	                </div>
	                
	                <div class="listbox">
						
						<c:forEach items="${boardList}" var="dto"> <!--list 반복문 시작-->
							
		                    <div class="list">
		                        <div class="ll">
		                            <div class="num">
		                                <h5 class="l1">
		                                    ${dto.board_no}
		                                </h5>
		                            </div>
		                            <a class="move_link" href="${dto.board_no}">
		                                <div class="title">
		                                    <h5 class="l1">
												${dto.board_title}
		                                    </h5>
		                                </div>
		                            </a>
		                            <div class="kate">
		                                <h5 class="l1">
		                            
		                                </h5>
		                            </div>
		                            <div class="writer">
		                                <h5 class="l1">
											${dto.user_email}
		                                </h5>
		                            </div>
		                            <div class="date">
		                                <h5 class="l1">
											${dto.create_date}
		                                </h5>
		                            </div>
		                            <div class="hit">
		                                <h5 class="l1">
											${dto.board_hit}
		                                </h5>
		                            </div>
		                            <div class="reco">
		                                <h5 class="l1">
											${dto.board_like}
		                                </h5>
		                            </div>
		                        </div>
		                    </div> <!-- 리스트 끝-->
							
						</c:forEach> <!--list 반복문 끝-->
						
	                </div> <!-- 리스트박스 끝-->







	                <div class="buttonbox">
						<a href="boardWriteView">
		                    <button class="button">
		                        <h5 class="but1">글쓰기</h5>
		                    </button>
						</a>

	                </div><!--버튼 끝 -->

					
<!--						 리스트 search 시작 
						
					<form method = "get" id="searchForm">
						<select name="type">
							<option value="" <c:out value = "${pageMaker.cri.type == null ? 'selected' : ''}"/> >전체</option>	
							<option value="T" <c:out value = "${pageMaker.cri.type eq T ? 'selected' : ''}"/> >제목</option>	
							<option value="C" <c:out value = "${pageMaker.cri.type eq C ? 'selected' : ''}"/> >내용</option>	
							<option value="W"<c:out value = "${pageMaker.cri.type eq W ? 'selected' : ''}"/> >작성자</option>	
							<option value="TC"<c:out value = "${pageMaker.cri.type eq TC ? 'selected' : ''}"/> >제목 or 내용</option>	
							<option value="TW"<c:out value = "${pageMaker.cri.type eq TWC ? 'selected' : ''}"/> >제목 or 작성자</option>	
							<option value="TCW"<c:out value = "${pageMaker.cri.type eq TCW ? 'selected' : ''}"/> >제목 or 내용 or 작성자<option>	
						</select>
						 Criteria를 이용하여 키워드 값을 넘김
						<input type = "text" name="keyword" value = "${pageMaker.cri.keyword}">
						<input type = "hidden" name="pageNum" value = "${pageMaker.cri.pageNum}">>
						 전체 검색중 5페이지에서 22키워드로 검색시 안나올때 처리
						 @@ 15페이지 보고있다가 1페이지분량 검색될때 15페이지말고 1페이지로 넘겨줌 value = 1 : 1페이지 고정
						<input type = "hidden" name="pageNum" value = "1">
						<input type = "hidden" name="amount" value = "${pageMaker.cri.amount}">
						<button>Search</button>
					</form>
					
					 리스트 search 끝 -->

					 <!-- 페이징 기능 시작-->

					 <!--<h3>${pageMaker}</h3>-->
					 <div class="div_page">
					 	<ul>
					 		<c:if test="${pageMaker.prev}">
					 			<!-- <li>[Previous]</li> -->
					 			<li class="paginate_button">
					 				<a href="${pageMaker.startpage - 1}">
					 					[Previous]
					 				</a>
					 			</li>
					 		</c:if>
					 		<c:forEach var="num" begin="${pageMaker.startpage}" end="${pageMaker.endpage}">
					 			<!-- <li>[${num}]</li> -->
					 			<!-- <li ${pageMaker.cri.pageNum == num ? "style='color: red'" : ""}> -->
					 				<!-- 				현재 페이지는 배경색 노란색으로 표시 -->
					 			<li class="paginate_button" ${pageMaker.cri.pageNum == num ? "style='background-color: yellow'" : ""}>
					 				<!-- [${num}] -->
					 				<a href="${num}">
					 					[${num}]
					 				</a>
					 			</li>
					 		</c:forEach>
					 		<c:if test="${pageMaker.next}">
					 			<!-- <li>[Next]</li> -->
					 			<li class="paginate_button">
					 				<a href="${pageMaker.endpage + 1}">
					 					[Next]
					 				</a>
					 			</li>
					 		</c:if>
					 	</ul>
					 </div>


					 <!-- <form id="actionForm" method="get" action="listWithPaging"> -->
					 <!-- <form id="actionForm" method="get" action="list"> -->
					 	
					 <!-- 액션 폼 -->
					 <form id="actionForm" method="get">
					 	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
					 	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
					 	<!-- 페이징 검색시 페이지번호 클릭할때 필요한 파라미터-->
					 	<input type="hidden" name="type" value="${pageMaker.cri.type}">
					 	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
					 </form>

					 <!-- 페이징 기능 끝 -->

					 
	            </div> <!--보드 끝-->


	        </div> <!-- wrap 끝 -->
	    </section> <!--section 끝 -->

		<%@ include file="footer.jsp" %>
</body>







</html>
<script>
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













