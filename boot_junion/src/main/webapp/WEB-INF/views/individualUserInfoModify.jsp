<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<% 
    String session_pw = (String) session.getAttribute("login_pw"); 
%>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
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

	.sectionInner
	{
	display: flex;
	justify-content: center;
	min-width: 1200px;
	}

	/*회원정보수정 타이틀*/

	.infoTitle
	{
	font-size: var(--font-size32);
	margin-top: 70px;
	}

	/*회원사진 + 테이블*/
	.infoConWrap
	{
	display : flex;
	gap: 50px;
	margin-top: 80px;
	
	
	}

	/*회원사진*/
	.infoCon img
	{
	width: 100px;
	}





	/*회원정보 테이블*/

	.userInfoTable/*th,td넣기전에 큰 사각형에는 radius먹힘*/
	{
	border: 1px solid var(--input-gray);
	border-radius: 10x;
	border-collapse: collapse;
	}
	.userInfoTable th
	{
	width: 300px;
	background-color: var(--button-gray);
	}

	

	/*수정내용 input박스*/
	.userInfoTable .input
	{
	box-sizing: border-box;
	height: 50px;
	/* width: inherit; */
	width: 750px;
	border: 1px solid var(--input-gray);
	font-size: 16px;
	border-radius : 6px;
	padding:0 10px;
	}

	.userInfoTable #readonly
	{
		border: none;
		color: var(--color-gray);
	}

	/*테이블의 행열*/
	.userInfoTable th, td
	{
	border: 1px solid var(--input-gray);
	padding: 0 20px;
	text-align: start;
	height: 60px;
	}

	/*희망직무, 기술스택 버튼들 */
	.userInfoTable .disF .position 
	{
	display: flex;
	align-items: center;
	gap: 20px;
	}

	/*희망직무,기술스택 추가하기 버튼*/
	.userInfoTable .disF .modify
	{
	margin-left:auto ;
	height: 44px;
	background-color: var(--main-color);
	border:none;
	color: var(--color-white);
	font-size: var(--font-size16);
	border-radius: 6px;
	cursor: pointer;
	}

	.userInfoTable .disF .stack,
	.userInfoTable .disF .workLocation 
	{
	display: flex;
	align-items: center;
	gap: 20px;

	}
	

	.wishJob, .myStack
	{
	box-sizing: border-box;
	height: 50px;
	/* width: 750px; */
	border: 1px solid var(--input-gray);
	font-size: 16px;
	border-radius : 6px;
	padding:0 10px;
	cursor: pointer;
	}


	/*수정내용 input박스*/
	input#stackInput, input#jobInput
	{
	box-sizing: border-box;
	height: 50px;
	/* width: inherit; */
	width: 750px;
	border: 1px solid var(--input-gray);
	font-size: 16px;
	border-radius : 6px;
	padding:0 10px;
	}

	.userInfoTable .disF .workLocation select
	{
	width: 120px;
	height: 44px;
	border: 1px solid var(--input-gray);
	color: #787878;
	border-radius: 6px;
	cursor: pointer;
	}



	.userInfoTable td .Btn
	{
	background-color: var(--button-gray);
	border: 1px solid var(--input-gray);
	font-size: var(--font-size16);
	color: var(--color-gray);
	/* width: 100px; */
	height: 44px;
	padding: 10px;
	border-radius: 6px;
	}



	/*수정버튼*/
	.modifyBtn
	{
	display: flex;
	justify-content: center;
	}
	.buttonModify
	{
	background-color: #999;
	border: none;
	/* border: 1px solid var(--input-gray); */
	border-radius: 6px;
	width: 240px;
	height: 56px;
	margin: 40px auto;
	font-size: 16px;
	color: var(--color-white);
	cursor: pointer;
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

            <section>
                <div class="sectionInner">

                    <div class="infoWrap">
                        <h2 class="infoTitle">회원 정보 수정</h2>
                        <!-- <form method="post" action="updateMemInfo.jsp"> -->
                        <!-- <form> -->
                            <div class="infoConWrap">
                                <div class="infoCon left">
									<div class="uploadResult">
<!--                                    <img src="images/people.svg" alt="#" class="resumeImage">-->
									</div>
                                </div>
                                <div class="infoCon right">
									<!-- <form id="userInfoForm"> -->
										<table class="userInfoTable">
											<form method="post" id="userInfoForm" name="userInfoForm" action="modifyInfo">
											<tr>
												<th>이름</th>
												<td><input class="input" id="readonly" type="text" name="user_name" value="${userInfo.user_name}" readonly="readonly"></td>
											</tr>
											<tr>
												<th>이메일</th>
												<td><input class="input" id="readonly" type="text" name="user_email" value="${userInfo.user_email}" readonly="readonly"></td>
											</tr>
                                            <tr>
                                                <th>생년월일</th>
                                                <td><input class="input" type="text" name="user_birthdate" value="${userInfo.user_birthdate}" placeholder="생년월일을 입력하세요" required></td>
                                            </tr>
                                            <tr>
                                                <th>성별</th>
                                                <td><input class="input" type="text" name="user_gender" value="${userInfo.user_gender}" placeholder="성별을 입력하세요" required></td>
                                            </tr>
                                            <tr>
                                                <th>휴대폰</th>
                                                <td><input class="input" type="text" name="user_tel" value="${userInfo.user_tel}" placeholder="전화번호를 입력하세요"></td>
                                            </tr>
                                            <tr>
                                                <th>희망직무</th>
												<td class="disF wide" >
                                                    <div class="position">
														<input type="text" id="jobInput" name="user_job" value="${user_job}" placeholder="희망직무를 선택해 주세요" onclick="openChild()" readonly>
														<!-- <input type="hidden" class="user_stack_value"> -->
                                                    </div>
                                                </td>
											</tr>
											<tr>
												<th>기술스택</th>
												<td class="disF wide">
													<div class="stack">
														<input type="text" id="stackInput" name="user_stack" value="${user_stack}" placeholder="주요기술을 선택해 주세요" onclick="openChild2()" readonly>
														<!-- <input type="hidden" class="user_position_value"> -->
													</div>
												</td>
											</tr>
                                            <tr>
												<th>희망근무지역</th>
                                                <td class="disF">
													<div class="workLocation">
                                                        <div class="search_box">
                                                            <select onchange="categoryChange(this)" class="region" name="user_location">
                                                                <option value>시/도 선택</option>
                                                                <!-- <option class="selected" value="${userInfo.user_location}"></option> -->
                                                                <option value="강원">강원</option>
                                                                <option value="경기">경기</option>
                                                                <option value="경남">경남</option>
                                                                <option value="경북">경북</option>
                                                                <option value="광주">광주</option>
                                                                <option value="대구">대구</option>
                                                                <option value="대전">대전</option>
                                                                <option value="부산">부산</option>
                                                                <option value="서울">서울</option>
                                                                <option value="울산">울산</option>
                                                                <option value="인천">인천</option>
                                                                <option value="전남">전남</option>
                                                                <option value="전북">전북</option>
                                                                <option value="제주">제주</option>
                                                                <option value="충남">충남</option>
                                                                <option value="충북">충북</option>
                                                            </select>
                                                            <!-- <input type="hidden" name="user_location" id="user_location" value="${userInfo.user_location}"> -->
                                                            <!-- <input type="hidden" name="user_location" id="user_location"> -->
                                                        </div>
                                                        <div class="search_box">
                                                            <select id="state" class="constituency" onchange="updateDistrict(this)"  name="user_location2">
                                                              <option>군/구 선택</option>
                                                            </select>
                                                            <!-- <input type="hidden" name="user_location2" value="${userInfo.user_location2}"> -->
                                                            <!-- <input type="hidden" name="user_location2"> -->
                                                        </div> 
                                                    </div>
                                                </td>
                                            </tr>
											<tr>
                                                <th>비밀번호 확인</th>
                                                <td>
													<input class="input" type="password" name="input_pw" placeholder="회원정보 보호를 위해 비밀번호를 입력하세요" required>
													<input type="hidden" name="session_pw" value="<%= session_pw %>"> 
												</td>
                                            </tr>
										</form><!-- userInfoForm 끝 -->
                                        </table>
                                </div><!-- infoCon right 끝 -->
                            </div> <!-- infoConWrap 끝-->
                            <div class="modifyBtn">
                                <button class="buttonModify" type="submit">수정완료</button>
                            </div>
					
                        <!-- </form> -->
                    </div> <!--infoWrap끝 : 개인정보  -->
                </div> <!-- sectionInner 끝 : 전체 1200 영역-->
            </section>
        </div><!-- mainContent-->
    </div>    
	<%@ include file="footer.jsp" %>
</body>
</html>
<script>
	
	$(document).ready(function(){
		//즉시실행함수
		/*
		2024-07-22 서연주
		이미지 파일 로딩
		*/
		(function(){
			console.log("@# document ready");//이 스크립트가 실행되는지 검증
			var user_email = "<c:out value='${userInfo.user_email}'/>"; 
			console.log("@# user_email=>"+user_email);//이 스크립트가 실행되는지 검증
			

			$.getJSON("/getFileList", {user_email:user_email}, function (arr){
				console.log("@# arr ="+arr);
				
				var str="";
				
				$(arr).each(function(i,attach){
					//image 판별
					if (attach.image) {
						var fileCallPath = encodeURIComponent(attach.uploadPath +"/s_"+ attach.uuid + "_" + attach.fileName);
						//str += "<li data-path='" + attach.uploadPath + "'";
						//str += " data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.image + "'"
						//str + " ><div>";
							
						//str += "<span>"+attach.fileName+"</span>";
						str += "<img src='/display?fileName="+fileCallPath+"' alt='#' class='resumeImage'>";//이미지 출력 처리(컨트롤러단)
						//str += "<span data-file=\'"+ fileCallPath +"\'data-type='image'> x </span>";
						//str += "</div></li>";
					} else {
						//var fileCallPath = encodeURIComponent(attach.uploadPath +"/"+ attach.uuid + "_" + attach.fileName);
						str += "<li data-path='" + attach.uploadPath + "'";
						str += " data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.image + "'"
						str + " ><div>";

						str += "<span>"+attach.fileName+"</span>";
						str += "<img src='./resources/img/attach.png'>";
						// str += "<span data-file=\'"+ fileCallPath +"\'data-type='file'> x </span>";
						str += "</div></li>";
					}
				});//end of arreach
				
				
				
				$(".uploadResult").html(str);//class uploadResult ul태그 안에 str 삽입 
			});//end of getJSON

		
		});//이미지 파일로딩 끝
		
		
		
		
		/*
		2024-07-12 서연주
		수정 버튼 누르면 formdate 가지고 컨트롤러로
		*/
		$("button.buttonModify").click(function(e) {
			e.preventDefault(); // 기본 폼 제출 동작 방지
			console.log("수정완료click");

			let formData = new FormData();
			let inputs = $("input");  //document의 input element 전부
			let selects = $("select"); //document의 select element 전부

			for (let i = 0; i < inputs.length; i++) {// FormData에 input에 담긴 데이터 담기
				const name = inputs[i].name;
				const value = inputs[i].value;

				formData.append(name, value);
			}

			for (let i = 0; i < selects.length; i++) {// FormData에 select에 담긴 데이터 담기
				const name = selects[i].name;
				const value = selects[i].value;

				formData.append(name, value);
			}
			
			for (let pair of formData.entries()) {// FormData에 데이터가 제대로 담겼는지 확인
				console.log(pair[0] + ', ' + pair[1]);
			}
			
			// formData.submit(); 배열정보가 있어서 그냥 submit 은 안되는듯..
			// AJAX 요청 수행
			$.ajax({
				type: "post", // 요청 메소드 유형
				processData:false,  // 문자열화 방지
				contentType:false, //application/x-www 방지 ...
				// dataType : 'json',
				data: formData, // 전송할 데이터
				enctype : 'multipart/form-data',
				async : false,
				url: "/modifyInfo", // 요청을 보낼 URL
				success: function(data) {
					alert("수정 완료"); // 성공 시 알림
					location.href = "userInfo"; // 성공 시 페이지 리다이렉트
				},
				error: function() {
					alert("수정을 완료하지 못했습니다. 비밀번호를 확인해 주세요"); // 오류 시 알림
				}
			});//end of jax
		});;//수정하기 버튼 클릭 function 끝

	
		
	});//end of document ready
	
	
	
	
	
	//추가하기 버튼 클릭시 희망직무/기술스택 팝업 오픈
	const value = openWin.document.getElementById("cInput").value;
	const value2 = openWin.document.getElementById("cInput2").value;
	let openWin;
	function openChild() 
	{
		// window.name = "부모창 이름"; 
		window.name = "parentForm";
		
		// window.open("open할 window", "자식창 이름", "팝업창 옵션");
		openWin = window.open("userInfoModifyPop", "childForm", "width=548, height=620, resizable = no, scrollbars = no");    
	}

	function openChild2() 
	{
		// window.name = "부모창 이름"; 
		window.name = "parentForm";
		
		// window.open("open할 window", "자식창 이름", "팝업창 옵션");
		openWin = window.open("userInfoModifyPop2", "childForm", "width=548, height=620, resizable = no, scrollbars = no");    
	}





		
	//희망근무지역 선택 셀렉박스 기능
	function categoryChange(e) {
	    const state = document.getElementById("state");
	  
	    const gangwon = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	    const gyeonggi = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
	    const gyeongsangnam = ["거제시", "김해시", "마산시", "밀양시", "사천시", "양산시", "진주시", "진해시", "창원시", "통영시", "거창군", "고성군", "남해군", "산청군", "의령군", "창녕군", "하동군", "함안군", "함양군", "합천군"];
	    const gyeongsangbuk = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
	    const gwangju = ["광산구", "남구", "동구", "북구", "서구"];
	    const daegu = ["남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군"];
	    const daejeon = ["대덕구", "동구", "서구", "유성구", "중구"];
	    const busan = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
	    const seoul = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	    const ulsan = ["남구","동구","북구","중구","울주군"];
	    const incheon = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
	    const jeonnam = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	    const jeonbuk = ["군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군", "무주군", "부안군", "순창군", "완주군", "임실군", "장수군", "진안군"];
	    const jeju = ["서귀포시","제주시","남제주군","북제주군"];
		const chungnam = ["천안시","아산시","서산시","당진시","홍성군","보령시","논산시","공주시","계룡시","서천군","부여군","청양군","태안군","금산군","예산군"];
	    const chungbuk = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
	    
	  
		if (e.value == "강원") {
            add = gangwon;
        } else if (e.value == "경기") {
            add = gyeonggi;
        } else if (e.value == "경남") {
            add = gyeongsangnam;
        } else if (e.value == "경북") {
            add = gyeongsangbuk;
        } else if (e.value == "광주") {
            add = gwangju;
        } else if (e.value == "대구") {
            add = daegu;
        } else if (e.value == "대전") {
            add = daejeon;
        } else if (e.value == "부산") {
            add = busan;
        } else if (e.value == "서울") {
            add = seoul;
        } else if (e.value == "울산") {
            add = ulsan;
        } else if (e.value == "인천") {
            add = incheon;
        } else if (e.value == "전남") {
            add = jeonnam;
        } else if (e.value == "전북") {
            add = jeonbuk;
        } else if (e.value == "제주") {
            add = jeju;
        } else if (e.value == "충남") {
            add = chungnam;
        } else if (e.value == "충북") {
            add = chungbuk;
        }
	  
	    state.options.length = 1;

		// "전체" 옵션 추가
        let allOption = document.createElement("option");
        allOption.value = "전체";
        allOption.innerHTML = "전체";
        state.appendChild(allOption);

	    // 군/구 갯수;
	  
	      for (property in add) {
	          let opt = document.createElement("option");
	          opt.value = add[property];
	          opt.innerHTML = add[property];
	          state.appendChild(opt);
	      }
		  document.getElementById("notice_area1").value = e.value; // 시/도 값을 설정
	  }
	  
	  function updateDistrict(element) {
	          document.getElementById("notice_area2").value = element.value; // 군/구 값을 설정
	  }

	 

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