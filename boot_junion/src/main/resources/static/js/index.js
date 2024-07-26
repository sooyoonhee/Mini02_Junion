$(document).ready(function()
{
    /*
        2024-06-25 이재원 
        메뉴 눌렀을 때 메뉴 활성화 : active
    */
    $('.navMenu ul li').click(function(){
        $(this).addClass('active');
        $('.navMenu ul li').not(this).removeClass('active');
    });

    
    /*
        2024-06-25 이재원 
        글자수 제한 + 넘는건 ...처리
    */
    $('.cardConBottom > .title').each(function()
    {
        var length = 21; //표시할 글자 수 정하기
    
        $(this).each(function()
        {

            if($(this).text().length >= length)
            {
                $(this).text($(this).text().substr(0, length) + '...');	//지정한 글자수 이후 표시할 텍스트 '...'
            }
        });

    });

    /*
        2024-06-25 이재원 
        탭 메뉴 : 전체 , 포지션 제안, 관심기업
    */

    $('.tabCon.All').click(function(){
        $('.cardConWrap').css({"display":"none"});
        $('.cardConWrap.All').css({"display":"flex"});
    });

    $('.tabCon.proposal').click(function(){
        $('.cardConWrap').css({"display":"none"});
        $('.cardConWrap.proposal').css({"display":"flex"});
    });

    $('.tabCon.post').click(function(){
        $('.cardConWrap').css({"display":"none"});
        $('.cardConWrap.post').css({"display":"flex"});
    });


    // tab
    $(".toptitle1").on("click",function(e){
        $(".tabCon").css({"display":"none"});
        $(".tabCon.detail").css({"display":"block"});
        // $(".toptitle.toptitle2").addClass("color");
        // $(".toptitle.toptitle2").css({"color":"var(--#f7f7f7)"});
    });
    
    $(".toptitle2").on("click",function(e){
        $(".tabCon").css({"display":"none"});
        $(".tabCon.common").css({"display":"block"});
    });  

     

        

});
    
    
    

