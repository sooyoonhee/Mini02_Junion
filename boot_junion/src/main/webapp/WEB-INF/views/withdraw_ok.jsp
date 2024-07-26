<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
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

main
{
    display: flex;
    justify-content: center;
    align-content: center;
    margin-top: 10%;
}

main .fa-solid
{
    color: var(--main-color);
    font-size: 120px;
}
main .content
{
    font-size: var(--font-size24);
}

main .return
{
    color: var(--color-gray);
}

main .deleteCreu
{

    justify-content: center;


}

main .delete1,
main .delete2
{
    margin-top: 30px;
}

main .delete1
{
    justify-content: center;
    display: flex;
}

main .delete2
{
    display: flex;
    justify-content: center;
}

</style>
</head>
<body>
    <main>
        <div class="deleteCrue">
            <div class="delete1">
                <i class="fa-solid fa-user-minus"></i>
            </div>
            <div class="delete2">
                <h5 class="content">회원 탈퇴가 완료되었습니다.<br>
                    이용해 주셔서 감사합니다.<br>
                    다음번엔 더 좋은 서비스로 만나요!
                </h5>
            </div>
            <div class="delete2">
                <a href="main" class="return">메인 페이지로 돌아가기</a>
            </div>
        </div>
    </main>
</body>
</html>