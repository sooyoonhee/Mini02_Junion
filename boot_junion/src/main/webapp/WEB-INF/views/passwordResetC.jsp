<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
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

    /* 비밀번호찾기_재설정 section */

	section
	{
		padding-top: 90px;
		display: flex;
		justify-content: center;
	}

	.sectionInnerFPIC
	{
		min-width: 1200px;
		margin: 136px 0;
	}

	.sectionConFPIC 
	{
	display: grid;
	justify-content: center;
	}

	.sectionConInnerFPIC
	{
		margin-bottom: 15px;
	}

	.sectionConInnerFPIC h2
	{
		font-size: var(--font-size24);
	}

	.sectionConInnerFPIC p
	{
		margin-top: 9px;
		font-size: var(--font-size16);
		color: var(--color-gray);
	}
	
	.sectionInnerWrapperFPIC 
	{
		width: 678px;
		padding: 20px;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		border-radius: 10px;

		align-items: center;
		margin-top: 15px; 
		margin-bottom: 40px;
	}

	.sectionInnerWrapperFPIC .inputName
	{
		color: var(--color-black);
		margin-top: 24px;
		margin-bottom: 24px;
		margin-left: 30px;
		display: flex;
		align-items: center;
	}

	.sectionInnerWrapperFPIC .inputName h3
	{
		font-size: var(--font-size16);
		min-width: 110px;
	}

	.sectionInnerWrapperFPIC .inputJoin
	{
		font-size: var(--font-size16);
		width: 500px;
		height: 56px;
		border-radius: 6px;
		box-sizing: border-box;
		border: solid 1px var(--input-gray);
		padding-left: 16px;
	}

	.buttonRe
	{
		display: flex;
	}

	.buttonPrev
	{
		width: 250px;
		height: 48px;
		background-color: var(--color-white);
		border:solid 1px var(--input-gray);
		color: var(--color-gray);
		font-size: var(--font-size16);
		border-radius: 6px;
		margin: auto ;
		cursor: pointer;
	}

	.buttonRePW
	{
		width: 250px;
		height: 48px;
		background-color: var(--main-color);
		border:0;
		color: var(--color-white);
		font-size: var(--font-size16);
		border-radius: 6px;
		margin-right: auto ;
		cursor: pointer;
	}

   
</style>
</head>
<body>
    <div class="container">
        <%@ include file="header.jsp" %>
        <section>
            <div class="sectionInnerFPIC">            
                <div class="sectionConFPIC">
                    <div class="sectionConInnerFPIC">
                        <h2>비밀번호 재설정</h2>
                    </div> <!--sectionConInnerFPIC 끝-->

                    <div class="sectionInnerWrapperFPIC">
                        <form method="post" action="resetPWC" id="passwordReset">
							<input type="hidden" name="com_email" value="${comEmailP}">

                            <div class="inputName">
                                <h3>비밀번호 설정</h3>
                                <input type="password" class="inputJoin" id="com_pw" name="com_pw" placeholder="영문자, 숫자, 특수문자 포함 총 8~20자" required>
                            </div>
                            <div class="inputName">
                                <h3>비밀번호 확인</h3>
                                <input type="password" class="inputJoin" id="com_pw_check" name="com_pw_check" placeholder="비밀번호를 확인해 주세요" required>
                            </div>

							<div class="inputName" id="resultPassword"></div>

                    </div> <!-- 비밀번호찾기_재설정_개인 sectionInnerWrapperFPIC 끝 -->
                            <div class="buttonRe">
                                <button class="buttonPrev" type="button" onclick="location.href='findPasswordCompany'">이전</button>
                                <button class="buttonRePW" type="submit" onclick="check_ok();">비밀번호 재설정</button>
                            </div>
                        </form>
                </div> <!-- 비밀번호찾기_재설정_개인 sectionConFPIC 끝-->
            </div> <!-- 비밀번호찾기_재설정_개인 sectionInnerFPIC 끝 -->
        </section>
        <%@ include file="footer.jsp" %>
    </div>    
</body>
</html>
<script>
	
	// joinIndividual에서 가져옴

	function check_ok()
	{
		
		// 비밀번호 자릿수 체크 + 숫자&특문포함 + 중복일치			
		var passwordRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,20}$/;
		var newPassword = document.getElementById('com_pw').value;
		var confirmPassword = document.getElementById('com_pw_check').value;
		var resultPassword = document.getElementById('resultPassword');
		
		const $form = document.querySelector('form');

		if(passwordRegex.test(newPassword)) 
		{
			if(newPassword == confirmPassword) 
			{
				resultPassword.innerHTML = '비밀번호가 일치하며 유효합니다';
				resultPassword.style.color = 'var(--main-color)';				
				$("#passwordReset").submit();

				$("input").val("");					
				$("select").val("");								
				$("input[type='checkbox']").prop("checked",false);	
				resultPassword.innerHTML = '';		
				
				alert("비밀번호를 재설정 하였습니다")
			}
			else 
			{
				resultPassword.innerHTML = '비밀번호가 일치하지않습니다';
				resultPassword.style.color = 'red';					
	
				//submit 막기
				$form.addEventListener("submit", (event) => {
					event.preventDefault();
				});
				return;
				$("#com_pw_check").focus();
			}
		}
		else 
		{
			resultPassword.innerHTML = '비밀번호는 최소 8자리에서 20자리까지, 영문자, 숫자, 특수문자를 포함해야합니다.';
			resultPassword.style.color = 'red';

			//submit 막기
			$form.addEventListener("submit", (event) => {
				event.preventDefault();
			});
			return;
		}

				
	} // check_ok 끝

</script>