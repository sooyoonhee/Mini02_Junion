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

    /* 비밀번호찾기,이메일찾기_개인 section */

	section
	{
		padding-top: 90px;
		display: flex;
		justify-content: center;
	}

	.sectionInnerFEI , .sectionInnerFPI
	{
		min-width: 1200px;
		margin: 136px 0;
	}


	.sectionTitleFEI , .sectionTitleFPI 
	{
		text-align: center;
	}

	.sectionTitleFEI a , .sectionTitleFPI a
	{
		font-size: var(--font-size24);
		color: var(--color-black);
		margin: 0 35px;
	}

	.sectionTitleFEI a.findPassword
	{
		color: var(--color-gray);
	}

	.sectionTitleFEI a.findEmail
	{
		color: var(--color-gray);
	}

	.sectionTitleFEI a.findEmail.active , .sectionTitleFEI a.findPassword.active 
	{
		color: var(--color-black);
		padding-bottom: 4px;
		border-bottom: 3px solid var(--main-color);
	}

	.sectionConFEI , .sectionConFPI 
	{
	margin-top: 58px;
	display: grid;
	justify-content: center;
	}

	.sectionConInnerFEI , .sectionConInnerFPI
	{
		margin-bottom: 15px;
	}

	.sectionConInnerFEI h2 , .sectionConInnerFPI h2
	{
		font-size: 20px;
	}

	.sectionConInnerFEI p , .sectionConInnerFPI p
	{
		margin-top: 9px;
		font-size: var(--font-size16);
		color: var(--color-gray);
	}
	
	.sectionInnerWrapperFEI , .sectionInnerWrapperFPI 
	{
		width: 678px;
		padding: 20px;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		border-radius: 10px;

		align-items: center;
		margin-top: 15px; 
		padding-bottom: 55px;
	}

	.sectionInnerWrapperFEI .inputName , .sectionInnerWrapperFPI .inputName
	{
		color: var(--color-black);
		margin-top: 24px;
		margin-bottom: 12px;
		margin-left: 55px;
		display: flex;
		align-items: center;
	}

	.sectionInnerWrapperFEI .inputName h3 , .sectionInnerWrapperFPI .inputName h3
	{
		font-size: var(--font-size16);
		min-width: 60px;
	}

	.sectionInnerWrapperFEI .inputJoin , .sectionInnerWrapperFPI .inputJoin
	{
		font-size: var(--font-size16);
		width: 500px;
		height: 56px;
		border-radius: 6px;
		box-sizing: border-box;
		border: solid 1px var(--input-gray);
	}

	.sectionInnerWrapperFEI select.inputJoin , .sectionInnerWrapperFPI select.inputJoin 
	{
		padding-left: 16px;
		box-sizing: border-box;
	}

	.sectionInnerWrapperFEI input , .sectionInnerWrapperFPI input
	{
		padding-left: 16px;
	}

	.buttonFind
	{
		width: 500px;
		height: 48px;
		background-color: var(--main-color);
		border:0;
		color: var(--color-white);
		font-size: var(--input-tab-size);
		border-radius: 6px;
		margin: 40px auto;
		cursor: pointer;
	}

	.sectionConFEI
	{
		display: none;
	}

	.sectionConFEI.active
	{
		display: grid;
	}
   
</style>
</head>
<body>
    <div class="container">
        <%@ include file="header.jsp" %>
        <section>
            <div class="sectionInnerFEI">  
                <h3 class="sectionTitleFEI">
                    <a href="#" id="findEmailI" class="findEmail">이메일 찾기</a>
                    <a href="#" id="findPasswordI" class="findPassword  active">비밀번호 찾기</a>
                </h3>
                <div class="sectionConFEI">
                    <div class="sectionConInnerFEI">
                        <h2>회원정보 입력</h2>
                        <p>･가입 시 입력한 본인정보를 입력해주세요.</p>
                    </div> <!--이메일찾기_개인 sectionConInnerFEI 끝-->

                    <div class="sectionInnerWrapperFEI">
                        <div class="inputName">개인회원</div>
                        <form method="post" action="findEI">
                            <div class="inputName">
                                <h3>이름</h3>
                                <input type="text" class="inputJoin" id="inputCon1" name="user_name" placeholder="이름을 입력해 주세요" required>
                            </div>
                            <div class="inputName">
                                <h3>질문</h3>
                                <select name="user_questionNum" id="inputCon2" class="inputJoin" required>
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
                            </div>
                            <div class="inputName">
                                <h3>답변</h3>
                                <input type="text" class="inputJoin" id="inputCon3" name="user_questionAnswer" placeholder="답변을 입력해 주세요" required>
                            </div>
                    </div> <!-- 이메일찾기_개인 sectionInnerWrapperFEI 끝 -->
                            <button class="buttonFind" type="submit">이메일 찾기</button>
                        </form>
                </div> <!--이메일찾기_개인 sectionConFEI 끝-->

                <div class="sectionConFPI">    
                    <div class="sectionConInnerFPI">
                        <h2>회원정보 입력</h2>
                        <p>･가입 시 입력한 본인정보를 입력해주세요.</p>
                    </div> <!--sectionConInnerFPI 끝-->

                    <div class="sectionInnerWrapperFPI">
                        <div class="inputName">개인회원</div>
                        <form method="post" action="findPWI">
                            <div class="inputName">
                                <h3>이메일</h3>
                                <input type="email" class="inputJoin" id="inputCon4" name="user_email" placeholder="이메일을 입력해 주세요" required>
                            </div>
                            <div class="inputName">
                                <h3>이름</h3>
                                <input type="text" class="inputJoin" id="inputCon5" name="user_name" placeholder="이름을 입력해 주세요" required>
                            </div>
                            <div class="inputName">
                                <h3>질문</h3>
                                <select name="user_questionNum" id="inputCon6" class="inputJoin" required>
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
                            </div>
                            <div class="inputName">
                                <h3>답변</h3>
                                <input type="text" class="inputJoin" id="inputCon7" name="user_questionAnswer" placeholder="답변을 입력해 주세요" required>
                            </div>
                    </div> <!-- 비밀번호찾기_개인 sectionInnerWrapperFPI 끝 -->
                            <button class="buttonFind" type="submit">비밀번호 찾기</button>
                        </form>
                </div> <!--비밀번호찾기_개인 sectionConFPI 끝-->
            </div> <!-- 비밀번호찾기,이메일찾기_개인 sectionInnerFEI 끝 -->
        </section>
        <%@ include file="footer.jsp" %>
    </div>    

	<script>
        // 뒤로가기 눌렀을 때 input 정보 삭제 
        window.addEventListener('pageshow', function(event) {
            if (event.persisted) {
                document.getElementById('inputCon1').value = '';
                document.getElementById('inputCon2').value = '';
                document.getElementById('inputCon3').value = '';
                document.getElementById('inputCon4').value = '';
                document.getElementById('inputCon5').value = '';
                document.getElementById('inputCon6').value = '';
                document.getElementById('inputCon7').value = '';
            }
        });
        
        // 탭 눌렀을 때 input 정보 삭제
        function clearForm() {
            document.getElementById('inputCon1').value = '';
            document.getElementById('inputCon2').value = '';
            document.getElementById('inputCon3').value = '';
            document.getElementById('inputCon4').value = '';
            document.getElementById('inputCon5').value = '';
            document.getElementById('inputCon6').value = '';
            document.getElementById('inputCon7').value = '';
        }
    
        document.addEventListener('DOMContentLoaded', function() {
            var findEmail = document.querySelector('.findEmail');
            var findPassword = document.querySelector('.findPassword');
            if (findEmail) {
                findEmail.addEventListener('click', clearForm);
            }
            if (findPassword) {
                findPassword.addEventListener('click', clearForm);
            }
        });
    
    </script>

</body>
</html>
<script>
    $(document).ready(function () {
		// 개인 이메일, 비밀번호 찾기 탭 (하지수)
    
		$('#findEmailI').click(function () {
			$('#findEmailI').addClass('active');
			$('#findPasswordI').removeClass('active');
			$(".sectionConFEI").addClass('active');
			$(".sectionConFEI").show();
			$(".sectionConFPI").hide();
		});

		$('#findPasswordI').click(function () {
			$('#findPasswordI').addClass('active');
			$('#findEmailI').removeClass('active');
			$(".sectionConFEI").hide();
			$(".sectionConFPI").show();
		});
    
    });
</script>