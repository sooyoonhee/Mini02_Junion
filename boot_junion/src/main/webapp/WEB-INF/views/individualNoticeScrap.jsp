<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>개인-스크랩 공고</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/individualMain.css">
<!--<link rel="stylesheet" href="src/main/resources/static/css/style.css">-->
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
  
	/* 네비게이션 옆 컨텐츠 영역 */
	.mainContent 
	{
	  width: calc( 100% - 260px);
	  min-height: 100vh;
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
main
{
  display: flex;
  justify-content: center;
}
main .mainContainer
{
  display: flex;
  flex-direction: column; 
  min-width: 1200px;
  gap: 40px 0;
}

/*최근공고 타이틀+숫자*/

.mainContainer .recentJobPost
{
  display: flex;
  font-size: var(--font-size32);
  margin-top: 70px;
  gap : 0 20px;
  
}
.mainContainer .recentJobPost .title 
{
  color: var(--color-black);
  /* margin-top: 70px; */
  
}

.mainContainer .recentJobPost .listNum 
{
  color: var(--main-color);
  margin-right:200px;
}


/*sort tab 전체*/
.mainContainer .searchWrap
{
  display: flex;
  max-width: 1200px;
  margin-bottom: 10px;
  padding-left: 20px;
}

/*sort tab 왼쪽*/
.mainContainer .searchWrap .optionSortLeft
{
  display: flex;
  align-items: center;
  gap : 10px;
}

/*sort tab 왼쪽*/
.mainContainer .searchWrap .optionSortLeft input[type="checkbox"]
{
  width: 20px;
  height: 20px;
  border-radius: 3px;
  border:1px solid var(--border-color-gray);
  cursor: pointer;
}



/*삭제버튼*/
.mainContainer .searchWrap .optionSortLeft button
{
  width: 65px;
  height: 36px;
  background-color: initial;
  border:1px solid var(--border-color-gray);
  color: var(--color-gray);
  font-size: var(--font-size16);
  border-radius: 6px;
  align-items:center;
  justify-content:center;
}
/* sort 탭*/
.mainContainer .searchWrap .optionSortLeft .custom-select
{
  width: 180px;
  height: 36px;
  border:1px solid var(--input-gray);
  font-size: var(--font-size16);
  border-radius: 6px;
  padding-left: 15px;
  color: #222;
  cursor: pointer;
}


/*sort tab 오른쪽 검색하기*/
.mainContainer .searchWrap .optionSorRight
{
  margin-left: auto ;
}
.mainContainer .searchWrap .optionSorRight .search_Form
{
  display: flex;
  gap : 10px;
}


/* 검색창*/
.mainContainer .searchWrap .optionSorRight input
{
  width: 240px;
  height: 36px;
  border:1px solid var(--input-gray);
  font-size: var(--font-size16);
  border-radius: 6px;
  padding-left: 15px;
}

/*검색하기 버튼*/
.mainContainer .searchWrap .optionSorRight button
{
  width: 78px;
  height: 36px;
  background-color: var(--main-color);
  border:none;
  color: var(--color-white);
  font-size: var(--font-size16);
  border-radius: 6px;
  align-items:center;
  justify-content:center;
  box-sizing: border-box;
  cursor: pointer;
}


/*공고 박스 리스트*/
main .mainContainer .jobPostList
{
  display: flex;
  flex-direction: column;
  gap: 20px 0;
}

/*하나의 공고 박스*/
.mainContainer .jobPostList .postBox
{
  display: flex;
  border: 1px solid var(--input-gray);
  border-radius: 10px;
  box-sizing: border-box;
  padding: 20px;
  width: 1200px;
  height: 140px;
}

/*공고 박스 왼쪽*/
.mainContainer .jobPostList .postBox .boxLeft
{
  width: 166px;
  display: flex;
  align-items:center;
  gap: 0 20px;
  }
.mainContainer .jobPostList .postBox .boxLeft input
{
  width: 20px;
  height: 20px;
  border:1px solid var(--border-color-gray);
  cursor: pointer;
}
.mainContainer .jobPostList .postBox .boxLeft label
{
  font-size: var(--font-size14);
  color: var(--color-gray);
}

/*공고 박스 중간*/
.mainContainer .jobPostList .postBox .boxMiddle
{
  width: 794px;
  display: flex;
  flex-direction: column;
  /* align-items:center; */
  justify-content:center;
  gap: 10px 0;
  /* margin-left: 40px; */
}

.postBox .boxMiddle .jobPostTitle
{
  font-size: var(--font-size16);
  color: #555;
  cursor: pointer;
}

.postBox .boxMiddle .jobPostInfo
{
  display: flex;
  gap: 10px;
  font-size: var(--font-size14);
  color: var(--color-gray);
  
}

.postBox .boxMiddle .resumeInfo 
{
  display: flex;
  gap: 10px;
  align-items: baseline;
  cursor: pointer;
}
.postBox .boxMiddle .resumeInfo a
{
  color: var(--color-gray);
}
.postBox .boxMiddle .resumeInfo .submitStatus .statusCon
{
  display: flex;
  gap: 7px;
  align-items: baseline;
  cursor: pointer;
}

.postBox .boxMiddle .resumeInfo i
{
  font-size: 14px;
}


.postBox .boxMiddle .resumeInfo .submitStatus 
{
  display: flex;
  gap: 10px;
}
.postBox .boxMiddle .resumeInfo .submitStatus .resumeIcon
{
  height: 16px;
}
.postBox .boxMiddle .resumeInfo .submitStatus p
{
  font-size: var(--font-size14);
  text-decoration: underline;
}

.boxMiddle .resumeInfo .submitDate 
{
  display: flex;
  gap: 10px;
  font-size: var(--font-size14);
  color: var(--color-gray);
}


/*공고 박스 오른쪽*/
.mainContainer .jobPostList .postBox .boxRight
{
  width: 200px;
  display: flex;
  font-size: var(--font-size14);
  gap: 10px;
  color: var(--color-gray);
}

/*지원상태 탭*/
.postBox .boxRight .submitCon
{
  width: 80px;
  display: flex;
  flex-direction: column;
  gap: 10px;
  align-items:center;
  margin-top: 34px;
}

.postBox .boxRight .submitCon button
{
  width: 80px;
  height: 32px;
  background-color: var(--button-gray);
  border:1px solid var(--border-color-gray);
  color: var(--color-gray);
  font-size: var(--font-size16);
  border-radius: 6px;
  align-items:center;
  justify-content:center;
}
/*채용진행상태 탭*/
.postBox .boxRight .postCon
{
  width: 80px;
  display: flex;
  flex-direction: column;
  gap: 10px;
  align-items:center;
  margin-top: 34px;
}

.postBox .boxRight .postCon button
{
  width: 80px;
  height: 32px;
  background-color: var(--button-gray);
  border:1px solid var(--border-color-gray);
  color: var(--color-gray);
  font-size: var(--font-size16);
  border-radius: 6px;
  align-items:center;
  justify-content:center;
}
/*휴지통아이콘*/
.postBox .boxRight .delIcon
{
  width: 20px;
  display: flex;
  align-items:center;
  justify-content:center;
  cursor: pointer;
}
.postBox .boxRight .delIcon i
{
  font-size: 16px;
  color: var(--color-black);
}

/*페이징*/
.listPaging
{
  display: flex;
  /* align-items:center; */
  justify-content:center;
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
                    <div class="recentJobPost">
                      <h3 class="title">스크랩 공고</h3>
                      <h3 class="listNum">${noticeList.size()}</h3>
                    </div>
                    <div class="listTable">
                        <div class="searchWrap">
                            <div class="optionSortLeft">
                                <input type="checkbox" id="check_all" value="회사명">
                                <button class="selectDel">삭제</button>
                                <!-- 아래는 타임리프문법이라 바꾸긴 해야됨 -->
                                <select id="orderBy" class="custom-select" 
                                        th:onchange="|location.href='?searchText=' + document.querySelector('#searchText').value + '&amp;orderBy=' + this.value;|">
                                    <option value="desc" th:selected="${orderBy == 'desc'}">최신순</option>
                                    <option value="asc" th:selected="${orderBy == 'asc'}">오래된순</option>
                                </select>
                                <select id="orderBy" class="custom-select" 
                                        th:onchange="|location.href='?searchText=' + document.querySelector('#searchText').value + '&amp;orderBy=' + this.value;|">
                                    <option value="desc" th:selected="${orderBy == 'desc'}">지원완료</option>
                                    <option value="asc" th:selected="${orderBy == 'asc'}">미지원</option>
                                </select>
                                <select id="orderBy" class="custom-select"
                                        th:onchange="|location.href='?searchText=' + document.querySelector('#searchText').value + '&amp;orderBy=' + this.value;|">
                                    <option value="desc" th:selected="${orderBy == ''}">채용중</option>
                                    <option value="asc" th:selected="${orderBy == ''}">접수마감</option>
                                </select>
                                <!-- <select class="scrapDate" name="sort" id="sort" title="정렬순서" onchange="location.href=this.value">
                                    <option value="/zf_user/pds-resume/resume-download/order/id" label="">최근 등록순</option>
                                    <option value="//경로적어야//" label="최근등록순">최근 등록순</option>
                                    <option value="//경로적어야//" label="오래된순">오래된순</option>
                                </select>//이건 네이버게시판 -->
                            </div><!-- optionSortLeft 끝 -->
                            <div class="optionSorRight">
                                <form method="get" id="searchForm">
                                    <div class="search_Form">
                                        <input type="text" id="keyword" name="keyword" placeholder="기업명, 채용공고제목" required >
                                        <!-- <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> -->
                                        <!-- <input type="hidden" name="amount" value="${pageMaker.cri.amount}">페이징 처리를 위한 amount -->
                                        <button class="searchBtn" type="submit">검색하기</button>
                                    </div>
                                </form><!-- searchForm / optionSortBtn right 끝 --> 
                            </div>                   
                        </div><!-- searchWrap 끝 -->  
                        <div class="jobPostList">
                          <c:forEach items="${noticeList}" var="dto">		
                            <div class="postBox">
                                <div class="boxLeft">
                                    <input type="checkbox" name="postListRow" id="com_name" class="normal"><!-- id값에 기업명가져와서 넣어줘야함-->
                                    <!-- <label for="com_name">브레인즈컴퍼니</label> -->
                                    <label for="com_name"><a href="/comDetail?com_email=${dto.com_email}">${dto.com_name}</a></label>
                                </div><!-- boxLeft 끝-->
                                <div class="boxMiddle">
                                    <!-- <h3 class="jobPostTitle">[Web Product 팀] 프론트 엔드 엔지니어 (3년 이상)</h3> -->
                                    <a class="jobPostTitle" href="jobPostDetail?notice_num=${dto.notice_num}">${dto.notice_title}</a>
                                    <div class="jobPostInfo">
                                        <!-- <p class="notice_area">서울 성동구</p> -->
                                        <p class="notice_area">${dto.notice_area1} ${dto.notice_area2}</p>
                                        <!-- <p class="notice_job">경력 3-5년</p> -->
                                        <p class="notice_job">${dto.notice_career}</p>
                                    </div><!-- jobPostInfo 끝-->
                                    <div class="resumeInfo">
                                        <!-- 지원완료:지원한이력서력서보기(지원일자), 미지원:기본이력서로지원하기 분기처리해야함 --> 
                                        <a class="submitStatus" href="#">
                                            <div class="statusCon">
                                                <span class="resumeIcon">
                                                    <i class="fa-regular fa-file-lines"></i>
                                                </span>
                                                <p class="title">지원한 이력서 보기</p>
                                            </div>
                                        </a>
                                        <div class="submitDate">
                                            <p class="text_date">지원일자</p>
                                            <p class="data_date">2024.05.31</p>
                                        </div>
                                    </div><!-- resumeInfo 끝-->
                                </div><!-- boxMiddle  끝-->
                                <div class="boxRight">
                                    <div class="submitCon">
                                        <button class="submitTab" value="submit_status">지원완료</button><!-- 지원완료/미지원 분기 --> 
                                        <p value-"resume_submitDate">2024.05.31</p><!-- 지원완료/미지원 분기 -->
                                    </div> <!-- btnCon 끝 -->     
                                    <div class="postCon">
                                        <button class="postStatus" value="post_status">채용중</button><!-- 채용마감/채용중 분기 -->
                                        <p value-"notice_endDate">~24.06.31</p>
                                    </div>  
                                    <div class="delIcon">
                                        <i class="fa-regular fa-trash-can"></i>
                                    </div>
                                </div><!-- boxRight 끝 -->   
                            </div><!-- postBox 하나의 공고 박스 끝 --> 
                          </c:forEach> 
                        </div><!-- jobPostList 끝 -->    
                    <!-- </div>listTable 끝  -->
                    <!-- <div class="listPaging"> -->
                        <!-- <h5> 1  2  3  4  5  6  7  8 </h5> -->
                    <!-- </div>listPaging 끝     -->
                </div> <!-- mainContainer -->
            </main>
        </div><!-- mainContent-->
    </div><!-- container 끝 -->
	<%@ include file="footer.jsp" %>
</body>
</html>
<script>
	$(document).ready(function()
	{
		
    /*
    2024-07-02 서연주 
    기업명,공고제목으로 검색하기
    */
    $("button.searchBtn").on("click",function(e){
        e.preventDefault();
        var keyword = document.getElementById('keyword');
        console.log(keyword);
        var searchForm = $("#searchForm");
        // var keyword1 =searchForm.find(keyword).val();
        if( keyword.value.length == 0){
            alert("키워드를 입력하세요.");
        }else{
            searchForm.attr("action","#").submit();//serachForm 정보를 들고 컨트롤러단으로 감
        }
    });


    /*
    2024-07-02 서연주 
    체크박스 선택
    */
   //체크박스 전체선택
   $(".optionSortLeft input").on("click", function () {
    var checked = $(this).is(":checked");
    console.log("check_all");
    console.log(checked);
    
    if(checked){
        $(".jobPostList").find('input').prop("checked", true);
    } else {
        $(".jobPostList").find('input').prop("checked", false);
    }
});

// 체크박스 개별 선택
$(".normal").on("click", function() {
    var checked = $(this).is(":checked");
    console.log("click normal");
    console.log(checked);

    if (!checked) {
        $(".optionSortLeft input").prop("checked", false);
    }else {
        var is_checked = true;
        
        $(".normal").each(function(){
          is_checked = is_checked && $(this).is(":checked");
        });
        
        $(".optionSortLeft input").prop("checked", is_checked);
    }
});

   

    /*
    2024-07-02 서연주 
    체크박스 누르고 삭제하기(체크한 그 목록이 없어지는지는 데이터넣고 확인!)
    */
    $(".selectDel").on("click",function(){
        var cnt = $("input[name='postListRow']:checked").length;
        var arr = new Array();
        $("input[name='postListRow']:checked").each(function() {
            arr.push($(this).attr('id'));
        });
        if(cnt == 0){
            alert("선택된 항목이 없습니다.");
        }
        else{
            alert("삭제되었습니다.")//데이터받아서 넘기고 받아야
            // $.ajax = {
            //     type: "POST"
            //     url: "OOOO.do"
            //     data: "RPRT_ODR=" + arr + "&CNT=" + cnt,
            //     dataType:"json",
            //     success: function(jdata){
            //         if(jdata != 1) {
            //             alert("삭제 오류");
            //         }
            //         else{
            //             alert("삭제 성공");
            //         }
            //     },
            //     error: function(){alert("서버통신 오류");}
            // };
        }

    });


    

    /*
    2024-07-02 서연주 
    자세히보기 누르면 기업정보 상세페이지로 새창(기업아이디를 가지고 이동해야함)
    */
    // $('button.detailBtn').click(function(e){
    //     console.log("자세히보기 click");
    //     window.open('http://www.naver.com','com_detail','top=100, left=200, width=1200, height=600, status=no, menubar=no, toolbar=no, resizable=yes');
    // });



    /*
    2024-07-04 서연주 
    휴지통 누르고 그 박스만 삭제하기
    <휴지통아이콘 누른 그 박스를 선택하는 걸 못하겠음..>

    */

    $(".delIcon i").on("click",function(e){
        e.preventDefault();
        console.log("휴지통클릭");
        
        var this_checkbox =  document.getElementById('com_name');
        // var this_checkbox =  $(this).parents('.boxLeft').children('#com_name');
        // var this_checkbox =  $(this).parents('.boxLeft').children();
        console.log(this_checkbox);
        var checked= this_checkbox.checked;
        
        // var checked = this_checkbox.checked;
        console.log(checked);

        if(!checked){
            alert("삭제할 공고를 선택해주세요.");
        }else{
            if(confirm("정말삭제하시겠습니까?") == true){
            }else{
                return;
            }
        }
       

    });

// 	 최신순오래된순 구현하는 스크립트 노션에 참고자료있음 java단도 만들어야 
// 
//     document.querySelector('#orderBy').addEventListener('change', function() {
//         var orderBy = document.querySelector('#orderBy').value;
//         window.location.href = '/board/view?id=' + id + '&orderBy=' + orderBy;
//     });


	});
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