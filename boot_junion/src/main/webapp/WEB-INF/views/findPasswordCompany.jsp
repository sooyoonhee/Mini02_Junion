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


    /* 비밀번호,이메일찾기_기업 section */

	section
	{
		padding-top: 90px;
		display: flex;
		justify-content: center;
	}

	.sectionInnerFEC , .sectionInnerFPC
	{
		min-width: 1200px;
		margin: 136px 0;
	}


	.sectionTitleFEC , .sectionTitleFPC
	{
		text-align: center;
	}

	.sectionTitleFEC a , .sectionTitleFPC a
	{
		font-size: var(--font-size24);
		color: var(--color-black);
		margin: 0 35px;
	}

	.sectionTitleFEC a.findEmail , .sectionTitleFEC a.findPassword
	{
		color: var(--color-gray);
	}

	.sectionTitleFEC a.findEmail.active , .sectionTitleFEC a.findPassword.active
	{
		color: var(--color-black);
		padding-bottom: 4px;
		border-bottom: 3px solid var(--main-color);
	}

	.sectionConFEC , .sectionConFPC
	{
	margin-top: 58px;
	display: grid;
	justify-content: center;
	}

	.sectionConInnerFEC , .sectionConInnerFPC
	{
		margin-bottom: 15px;
	}

	.sectionConInnerFEC h2 , .sectionConInnerFPC h2
	{
		font-size: 20px;
	}

	.sectionConInnerFEC p , .sectionConInnerFPC p
	{
		margin-top: 9px;
		font-size: var(--font-size16);
		color: var(--color-gray);
	}
	
	.sectionInnerWrapperFEC , .sectionInnerWrapperFPC
	{
		width: 678px;
		padding: 20px;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		border-radius: 10px;

		align-items: center;
		margin-top: 15px; 
	}

	.sectionInnerWrapperFEC .inputName , .sectionInnerWrapperFPC .inputName
	{
		color: var(--color-black);
		margin-top: 24px;
		margin-bottom: 24px;
		margin-left: 30px;
		display: flex;
		align-items: center;
	}

	.sectionInnerWrapperFEC .inputName h3 , .sectionInnerWrapperFPC .inputName h3
	{
		font-size: var(--font-size16);
		min-width: 110px;
	}

	.sectionInnerWrapperFEC .inputJoin , .sectionInnerWrapperFPC .inputJoin
	{
		font-size: var(--font-size16);
		width: 500px;
		height: 56px;
		border-radius: 6px;
		box-sizing: border-box;
		border: solid 1px var(--input-gray);
	}

	.sectionInnerWrapperFEC input , .sectionInnerWrapperFPC input
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

	.sectionConFEC
	{
		display: none;
	}

	.sectionConFEC.active
	{
		display: grid;
	}

   
</style>
</head>
<body>
    <div class="container">
        <%@ include file="header.jsp" %>
        <section>
            <div class="sectionInnerFEC">  
                <h3 class="sectionTitleFEC">
                    <a href="#" id="findEmailC" class="findEmail">이메일 찾기</a>
                    <a href="#" id="findPasswordC" class="findPassword  active">비밀번호 찾기</a>
                </h3>
                <div class="sectionConFEC">
                    <div class="sectionConInnerFEC">
                        <h2>회원정보 입력</h2>
                        <p>･가입 시 입력한 본인정보를 입력해주세요.</p>
                    </div> <!--이메일찾기_기업 sectionConInnerFEC 끝-->

                    <div class="sectionInnerWrapperFEC">
                        <div class="inputName">기업회원</div>
                        <form method="post" action="findEC">
                            <div class="inputName">
                                <h3>기업명</h3>
                                <input type="text" class="inputJoin" id="inputCon1" name="com_name" placeholder="기업명을 입력해 주세요" required>
                            </div>
                            <div class="inputName">
                                <h3>사업자번호</h3>
                                <input type="text" class="inputJoin" id="inputCon2" name="com_serial_number" placeholder="사업자번호를 입력해 주세요" required>
                            </div>
                    </div> <!-- 이메일찾기_기업 sectionInnerWrapperFEC 끝 -->
                            <button class="buttonFind" type="submit">이메일 찾기</button>
                        </form>
                </div> <!--이메일찾기_기업 sectionConFEC 끝-->

                <div class="sectionConFPC">
                    <div class="sectionConInnerFPC">
                        <h2>회원정보 입력</h2>
                        <p>･가입 시 입력한 본인정보를 입력해주세요.</p>
                    </div> <!--sectionConInnerFPC 끝-->

                    <div class="sectionInnerWrapperFPC">
                        <div class="inputName">기업회원</div>
                        <form method="post" action="findPWC">
                            <div class="inputName">
                                <h3>이메일</h3>
                                <input type="email" class="inputJoin" id="inputCon3" name="com_email" placeholder="이메일을 입력해 주세요" required>
                            </div>
                            <div class="inputName">
                                <h3>기업명</h3>
                                <input type="text" class="inputJoin" id="inputCon4" name="com_name" placeholder="기업명을 입력해 주세요" required>
                            </div>
                            <div class="inputName">
                                <h3>사업자번호</h3>
                                <input type="text" class="inputJoin" id="inputCon5" name="com_serial_number" placeholder="사업자번호를 입력해 주세요" required>
                            </div>
                    </div> <!-- 비밀번호찾기_기업 sectionInnerWrapperFPC 끝 -->
                            <button class="buttonFind" type="submit">비밀번호 찾기</button>
                        </form>
                </div> <!--비밀번호찾기_기업 sectionConFPC 끝-->
            </div> <!-- 비밀번호,이메일찾기_기업 sectionInnerFEC 끝 -->
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
            }
        });
        
        // 탭 눌렀을 때 input 정보 삭제
        function clearForm() {
            document.getElementById('inputCon1').value = '';
			document.getElementById('inputCon2').value = '';
			document.getElementById('inputCon3').value = '';
			document.getElementById('inputCon4').value = '';
			document.getElementById('inputCon5').value = '';
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
		// 기업 비밀번호, 이메일 찾기 탭 (하지수)
    
		$('#findEmailC').click(function () {
			$('#findEmailC').addClass('active');
			$('#findPasswordC').removeClass('active');
			$(".sectionConFEC").addClass('active');
			$(".sectionConFEC").show();
			$(".sectionConFPC").hide();
		});

		$('#findPasswordC').click(function () {
			$('#findPasswordC').addClass('active');
			$('#findEmailC').removeClass('active');
			$(".sectionConFEC").hide();
			$(".sectionConFPC").show();
		});
    
    });
</script>