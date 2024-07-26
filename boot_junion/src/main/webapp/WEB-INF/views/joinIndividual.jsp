<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>개인_회원가입</title>
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




	/* 회원가입_개인 section */

	section
	{
		padding-top: 90px;
	    display: flex;
	    justify-content: center;
	}

	.sectionInner
	{
	    min-width: 1200px;
	    margin: 136px 0;
	}

	.sectionTitleJoinI 
	{
	    text-align: center;
	}

	.sectionTitleJoinI a
	{
	    font-size: var(--font-size32);
	    color: var(--color-black);
	}

	.sectionInnerWrapperJoinI 
	{
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    gap: 40px;  
	    margin-top: 40px; 
	}

	.inputDivEmail
	{
		display: flex;
		gap: 20px;
		align-items: center;
	}

	.inputDivEmail button#idCheck 
	{
		width: 120px;
    	height: 56px;
		border: 1px solid var(--input-gray);
		background-color: var(--color-white);
		font-size: var(--font-size14);
		color: var(--color-black);
		border-radius: 6px;
		cursor: pointer;
		font-weight: 300;
	}

	.inputDivEmail button#idCheck:hover 
	{
		border: 1px solid var(--main-color);
		background-color: var(--main-color);
		color:var(--color-white);
		font-weight: 300;
	}

	.sectionInnerWrapperJoinI .inputName
	{
	    font-size: var(--font-size16);
	    color: var(--color-black);
	    margin-top: 24px;
	    margin-bottom: 12px;
	}

	.sectionInnerWrapperJoinI .inputJoin
	{
	    font-size: var(--font-size16);
	    width: 500px;
	    height: 56px;
	    border-radius: 6px;
	    box-sizing: border-box;
	    border: solid 1px var(--input-gray);
	}

	.sectionInnerWrapperJoinI select.inputJoin 
	{
	    padding-left: 16px;
	    box-sizing: border-box;
	}

	.sectionInnerWrapperJoinI input
	{
	    padding-left: 16px;
	}

	.agreementWrap 
	{
		margin-top: 40px;
		display: flex;
		flex-direction: column;
		gap: 20px 0;
	}

	.sectionInnerWrapperJoinI .agreement
	{
	    display: flex;
	    gap: 10px;
	    align-items: center;
	}

	.sectionInnerWrapperJoinI .agreement input[type="checkbox"] 
	{
	    width: 24px;
	    height: 24px;
	    border-radius: 5px;
	    color: var(--input-gray);
	}
	.sectionInnerWrapperJoinI .agreement button{
	    margin-left: auto;
	}

	.sectionInnerWrapperJoinI .buttonJoin
	{
	    width: 500px;
	    height: 48px;
	    background-color: var(--main-color);
	    border:0;
	    color: var(--color-white);
	    font-size: var(--font-size16);
	    margin-top: 40px;
	    border-radius: 6px;
		cursor: pointer;
	}

	.popupAgree
	{
	    display: block;
	    background-color: transparent;
	    border: 0;
	    color: #777;
	    text-decoration: underline var(--color-gray);
	    cursor: pointer;
	}

	.popupCon
	{
	    display: none;
	    position: fixed;
	    top:0;
	    left: 0;
	    width: 100vw;
	    height: 100vh;
	    overflow: hidden;
	    background: rgba(0,0,0,0.5);
	}

	.popupCon .popupAgreeCon
	{
	    position: absolute;
	    width: 500px;
	    /* height: 494px; */
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    padding: 24px;
	    background: #fff;
	    border-radius: 15px;
	    padding-bottom: 28px;
	}

	.popupCon .close
	{
	    display: grid;
	    grid-auto-flow: column;
	    grid-template-columns: 1fr;
	}

	.popupCon .closebtn
	{
	    font-size: 24px;
	    cursor: pointer;
	}

	.popupAgreeCon h2
	{
	    font-size: var(--font-size24);
	    text-align: center;
	    margin: 3px;
	}

	.popupAgreeCon h5
	{
	    font-size: var(--font-size14);
		margin-top: 20px;
		font-weight: 300;
	}

	.popupAgreeCon h3
	{
		font-size: var(--font-size16);
	    margin-top: 20px;
	}

	.popupAgreeCon p
	{
	    font-size: var(--font-size14);
	    margin-top: 8px;
	}

	.popupAgreeCon table 
	{
	    width: 100%;
	    border-collapse: collapse;
	    margin-top: 20px;
	    margin-bottom: 16px;
	}

	.popupAgreeCon table th
	{
	    border: 1px solid var(--border-color-gray);
	    padding: 8px;
	    font-size: var(--font-size12);
	}

	.popupAgreeCon table th:first-child
	{
	    width: 100px;
	}

	.popupAgreeCon table td:first-child
	{
	    text-align: center;
	}

	.popupAgreeCon table td 
	{
	    border: 1px solid var(--border-color-gray);
	    padding: 10px;
	    text-align: left;
	    font-size: var(--font-size14);
	}

</style>
</head>
<body>
	<div class="container">
		<%@ include file="header.jsp" %>
		<section>
	        <div class="sectionInner">            
	            <h3 class="sectionTitleJoinI">
	                <a href="#">이메일 회원가입</a>
	            </h3>
	            <div class="sectionInnerWrapperJoinI">
	                <form method="post" action="joinOk" id="joinIndividual">
	                    <div class="inputName">이름</div>
	                    <input type="text" class="inputJoin" id="user_name" name="user_name" placeholder="이름을 입력해 주세요" required>
	                    
						<div class="inputName">이메일</div>
						<div class="inputDivEmail">
	                    	<input style="width:360px;" type="email" class="inputJoin" id="user_email" name="user_email" placeholder="이메일을 입력해 주세요" required>
							<input type="hidden" id="user_email_checked">
							<button onclick="return false;" type="button" id="idCheck">이메일 중복확인</button>
						</div>	                    
	                    
	                    <div class="inputName">비밀번호</div>
	                    <input type="password" class="inputJoin" name="user_pw" id="user_pw" placeholder="영문자, 숫자, 특수문자 포함 총 8~20자" required>
	                    
	                    <div class="inputName">비밀번호 확인</div>
	                    <input type="password" class="inputJoin" name="user_pw_check" id="user_pw_check" placeholder="비밀번호를 확인해 주세요" required>
	                    
						<div class="inputName" id="resultPassword"></div>

	                    <div class="inputName">이메일 / 비밀번호 분실 시 질문</div>
	                    <select name="user_questionNum" class="inputJoin" required>
	                        <option value="" disabled selected>질문을 선택해 주세요</option>
	                        <option value="1">다른 이메일 주소는?</option>
	                        <option value="2">나의 보물 1호는?</option>
	                        <option value="3">나의 출신 고등학교는?</option>
	                        <option value="4">나의 출신 고향은?</option>
	                        <option value="5">어머니 성함은?</option>
	                        <option value="6">아버지 성함은?</option>
	                        <option value="7">가장 좋아하는 색깔은?</option>
	                        <option value="8">가장 좋아하는 음식은?</option>
	                    </select>
	                    
	                    <div class="inputName">답변</div>
	                    <input type="text" class="inputJoin" name="user_questionAnswer" placeholder="답변을 입력해 주세요" required>
	                    
						<div class="agreementWrap">
							<div class="agreement">
								<input type="checkbox" name="agree_all" id="checkAll" >
								<label for="agreeAll">전체동의 (선택 항목에 대한 동의 포함)</label>
							</div>
							<div class="agreement">
								<input type="checkbox" class="check" name="agree_terms" id="agreeTerms" required>
								<label for="agreeTerms">개인회원 이용약관 동의 <span style="color:red;">*</span></label>
								<button type="button" class="popupAgree A">자세히 보기</button>
							</div>
							<div class="agreement">
								<input type="checkbox" class="check" name="agree_privacy" id="agreePrivacy" required>
								<label for="agreePrivacy">개인정보 수집 및 이용 동의 <span style="color:red;">*</span></label>
								<button type="button" class="popupAgree B">자세히 보기</button>
							</div>
							<div class="agreement">
								<input type="checkbox" class="check" name="agree_marketing" id="agreeMarketing">
								<label for="agreeMarketing">마케팅 수신 동의</label>
								<button type="button" class="popupAgree C">자세히 보기</button>
							</div>
						</div>	                    
	                    <button class="buttonJoin" type="button" onclick="check_ok();">회원가입</button>
	                </form>
	            </div> <!-- 회원가입_개인 sectionInnerWrapperJoinI 끝 -->
	        </div> <!-- 회원가입_개인 sectionInner 끝 -->
	        <div class="popupCon A">
	            <div class="popupAgreeCon">
	                <div class="close">
	                    <h2>주니온 개인회원 이용약관 동의</h2>
	                    <i class="fa-solid fa-xmark closebtn"></i>
	                </div>
	                <h5>주니온 개인회원 이용약관은 아래와 같습니다.</h5>
	                <h3>제 1 장 총칙</h3>
	                <h5>제1조 [목적]</h5>
	                <p>
	                    이 약관은 (주)그렙(이하 “회사”)이 운영하는 사이트에서 제공하는 “서비스”의 이용과 관련하여
	                     “회사”와 “개인회원”간의 이용조건, 제반 절차, 회원의 권리, 의무 및 책임 사항
	                     , 기타 필요한 사항을 규정함을 목적으로 한다.
	                </p>
	                <h5>제2조 [정의]</h5>
	                <p>
	                    본 약관에서 사용하는 용어의 정의는 다음과 같다.<br><br>
	                    ① “사이트”라 함은 “회사”가 “개인회원”에게 서비스를 제공하기 위해 단말기(PC, TV, 휴대형 단말기 등의 각종 유무선 장치를 포함) 
	                    등 정보 통신 설비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장을 말하며, “회사”가 운영하는 웹사이트인 
	                    programmers.co.kr, business.programmers.co.kr, school.programmers.co.kr, career.programmers.co.kr, certi.programmers.co.kr, community.programmers.co.kr 등이 이에 포함된다.<br><br>
	                    ② “서비스”라 함은 “회사”의 “사이트”에서 “개인회원”에게 유∙무료로 제공하는 모든 서비스를 일컫는다. 코딩 문제∙코딩 테스트∙학습 콘텐츠 등과 
	                    같은 교육 관련 콘텐츠 제공 서비스, 교육 플랫폼 제공을 통해 콘텐츠, 정보 등의 거래를 중개하는 통신판매중개 서비스, 개인이 등록한 자료를 관리하여 
	                    기업 정보를 제공하는 서비스, 개인이 교육과 구직을 목적으로 등록하는 자료를 DB화 하여 각각의 목적에 맞게 분류 및 가공, 집계하여 정보를 제공하는 서비스, 자격 시험을 운영하고 관리하는 서비스 및 모든 부대 서비스를 의미한다.<br><br>
	                    ③ “개인회원”이라 함은 “서비스”를 이용하기 위하여 동 약관에 동의하거나, 페이스북 등 연동된 서비스를 통해 “회사”와 이용 계약을 체결한 개인 회원을 말한다.
	                </p>
	            </div> <!--회원가입_개인 popupAgreeCon끝-->
	        </div> <!--회원가입_개인 popupCon A 끝-->
	
	        <div class="popupCon B">
	            <div class="popupAgreeCon">
	                <div class="close">
	                    <h2>주니온 개인정보 수집·이용 동의</h2>
	                    <i class="fa-solid fa-xmark closebtn"></i>
	                </div>
	                <h5>주니온은 서비스를 이용하는 귀하의 개인정보를 아래와 같이 수집∙이용합니다.</h5>
	                <h3>1. 수집하는 개인정보 항목 및 이용 목적</h3>
	                <table>
	                    <thead>
	                        <tr>
	                            <th>수집 방법</th>
	                            <th>수집 항목</th>
	                            <th>수집 및 이용 목적</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <tr>
	                            <td>회원 가입</td>
	                            <td>
	                                [필수] 성명, 이메일(아이디), 비밀번호, 중복가입확인정보
	                                [선택] 희망직무, 주요기술 등 서비스와의 연동을 위해 사용자가 설정한 계정 정보
	                            </td>
	                            <td>이용자 식별 및 본인 확인, 회원가입 의사의 확인</td>
	                        </tr>
	                        <tr>
	                            <td>채용서비스 이용</td>
	                            <td>
	                                [필수] 성명, 이메일(아이디), 전화번호
	                                [선택] Github 저장소, 블로그/웹사이트 주소, 희망 연봉, 간단소개, 업무경험, 학력사항, 개인 프로젝트, 수상/자격증, 활동, 외국어
	                            </td>
	                            <td>이력서 등록을 통한 입사지원 등 취업활동 서비스 제공, 각종 맞춤형 취업서비스 제공</td>
	                        </tr>
	                    </tbody>
	                </table>
	                <h3>2. 개인정보 보유 및 이용기간</h3>
	                <p>회사는 이용자의 개인정보를 고지 및 동의 받은 사항에 따라 수집 이용 목적이 달성되기 전 또는 이용자의 탈퇴 시까지 해당 정보를 보유합니다.</p>
	                <h3>3. 개인정보 수집 및 이용 동의를 거부할 권리</h3>
	                <p>귀하는 위 정보에 대한 수집 이용 동의를 거부할 수 있는 권리가 있으나, 이에 동의하지 않을 경우 주니온 서비스 이용에 제한 될 수 있습니다.</p>
	            </div> <!--회원가입_개인 popupAgreeCon끝-->
	        </div> <!--회원가입_개인 popupCon B 끝-->
	
	        <div class="popupCon C">
	            <div class="popupAgreeCon">
	                <div class="close">
	                    <h2>마케팅 활용 동의 및 광고 수신</h2>
	                    <i class="fa-solid fa-xmark closebtn"></i>
	                </div>
	                <h3>[선택] 마케팅 활용 동의 및 광고 수신</h3>
	                <table>
	                    <thead>
	                        <tr>
	                            <th>항목</th>
	                            <th>내용</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <tr>
	                            <td>수집 및 이용 목적</td>
	                            <td>
	                                개발자 이벤트, 강의 할인 쿠폰 등 개발자에게 유용한 정보 제공
	                            </td>
	                        </tr>
	                        <tr>
	                            <td>수집 항목</td>
	                            <td>이메일</td>
	                        </tr>
	                        <tr>
	                            <td>수집 항목</td>
	                            <td>이메일</td>
	                        </tr>
	                        <tr>
	                            <td>보유 및 이용 기간</td>
	                            <td>회원 탈퇴 시 또는 동의 철회 시 까지</td>
	                        </tr>
	                    </tbody>
	                </table>
	                <p>동의하지 않으셔도 회원가입이 가능하나, 이벤트 및 강의 할인 안내를 받으실 수 없습니다.</p>
	            </div> <!--회원가입_개인 popupAgreeCon끝-->
	        </div> <!--회원가입_개인 popupCon C 끝-->
	</section>
		<%@ include file="footer.jsp" %>	   
	</div>
</body>
</html>
<script>
	$(document).ready(function()
	{
		// 회원가입 _개인 약관 동의 팝업 (하지수)
	    $(".popupAgree.A").on("click", function() {
	        $(".popupCon.A").css("display", "block");
	    });
	    $(".popupAgree.B").on("click", function() {
	        $(".popupCon.B").css("display", "block");
	    });
	    $(".popupAgree.C").on("click", function() {
	        $(".popupCon.C").css("display", "block");
	    });

	    $(".closebtn").on("click", function() {
	        $(".popupCon").css("display", "none");
	    });

	    $(window).on("click", function(event) {
	        if ($(event.target).hasClass("popupCon")) {
	            $(".popupCon").css("display", "none");
	        }
	    });
		
		
		// 2024-07-02 체크박스 전체 체크
		document.querySelector("#checkAll");
		checkAll.addEventListener("click",function(e){
			const isChecked = checkAll.checked;

			if(isChecked) 
			{
				const checkboxes = document.querySelectorAll('.check');

				for(const checkbox of checkboxes) 
				{
					checkbox.checked = true;
				}
			}
			else 
			{
				const checkboxes = document.querySelectorAll('.check');

				for(const checkbox of checkboxes) 
				{
					checkbox.checked = false;
				}
			}
		});	
		
		// 체크박스 3개다 선택되면 자동으로 전체 체크박스에 체크되는 기능
		const checkboxes = document.querySelectorAll('.check');
		for(const checkbox of checkboxes)
		{
			checkbox.addEventListener('click',function(){
				
				const totalCnt = checkboxes.length;
			
				const checkedCnt = document.querySelectorAll('.check:checked').length;
				
				if(totalCnt == checkedCnt){
					document.querySelector('#checkAll').checked = true;
				}
				else{
					document.querySelector('#checkAll').checked = false;
				}
				
			});			
		} // 체크박스 끝

		$('#idCheck').on('click',function(e){
			e.preventDefault();

			// 이메일 형식 맞추기
			const user_email = $('#user_email').val();
			var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

			if(exptext.test(user_email)==false) 
			{
				alert("이메일 형식이 아닙니다.");
			}
			else 
			{
				$.ajax
				({
					url:"/emailCheck",
					type:"post",
					data: {user_email: user_email},
					success: function(result)
					{
						if(result ==1) 
						{
							alert("이미 사용중인 이메일입니다.");
							$("#user_email_checked").val("");
						}
						else 
						{
							alert("사용 가능한 이메일입니다.")
							$("#user_email_checked").val(user_email);
						}
					}
				}); // ajax 끝
			}			
		}); // idCheck click 끝
	}); //document.readt 끝

	function check_ok()
	{
		// 이름 필수값
		if(joinIndividual.user_name.value.length ==0) 
		{
			alert("이름을 입력하세요!");
			joinIndividual.user_name.focus();

			return;
		}
		
		// 이메일 필수값
		if(joinIndividual.user_email.value.length ==0) 
		{
			alert("이메일을 입력하세요!");
			joinIndividual.user_email.focus();

			return;
		}

		/* 로직 : *.중복체크하고 인풋값을 바꾸는 행위 방지 

		중복체크를 했을 때

		중복이면 ""
		중복 아니면 이메일값을 넣기

		이 값을 전체 유효성검사할때 
		히든에 있는 이메일 값이랑
		인풋에있는 이메일값이 같은지 체크 해서 같아야 통과

		중복체크하고 인풋값을 바꾸는 행위 방지 

		or

		중복체크 끝나면 이메일 input을 disabled 시켜버리기
		*/
		// input 이메일 값이랑 히든값 비교하기 : 이유 - 중복체크하고 인풋값을 바꾸는 행위 방지 
		var checked = $("#user_email_checked").val();
		var user_email = $("#user_email").val();

		if(user_email != checked) 
		{
			alert("이메일 중복체크 하세요");
			joinIndividual.user_email.focus();
			return;
		}

		// 질문 필수값
		if(joinIndividual.user_questionNum.value.length ==0) 
		{
			alert("질문을 선택하세요!");
			joinIndividual.user_questionNum.focus();

			return;
		}

		// 답변 필수값
		if(joinIndividual.user_questionAnswer.value.length ==0) 
		{
			alert("답변을 입력하세요!");
			joinIndividual.user_questionAnswer.focus();

			return;
		}

		var checkAll = document.querySelector('#checkAll');
		// 체크 필수값
		if(!checkAll.checked) 
		{
			alert("약관을 동의하세요!");
			checkAll.focus();

			return;
		}

		// 비밀번호 자릿수 체크 + 숫자&특문포함 + 중복일치			
		var passwordRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,20}$/;
		var newPassword = document.getElementById('user_pw').value;
		var confirmPassword = document.getElementById('user_pw_check').value;
		var resultPassword = document.getElementById('resultPassword');

		if(passwordRegex.test(newPassword)) 
		{
			if(newPassword == confirmPassword) 
			{
				resultPassword.innerHTML = '비밀번호가 일치하며 유효합니다';
				resultPassword.style.color = 'var(--main-color)';				
				$("#joinIndividual").submit();

				$("input").val("");					
				$("select").val("");								
				$("input[type='checkbox']").prop("checked",false);	
				resultPassword.val("");										
			}
			else 
			{
				resultPassword.innerHTML = '비밀번호가 일치하지않습니다';
				resultPassword.style.color = 'red';					
				return;
				$("#user_pw_check").focus();
			}
		}
		else 
		{
			resultPassword.innerHTML = '비밀번호는 최소 8자리에서 20자리까지, 영문자, 숫자, 특수문자를 포함해야합니다.';
			resultPassword.style.color = 'red';
			return;
		}

				
	} // check_ok 끝


</script>