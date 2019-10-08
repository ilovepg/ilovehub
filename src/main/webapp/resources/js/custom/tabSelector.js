const recentStudyPostTab=$("#study-new-post-tab").find('a'); //Study 최신글 탭
const recentStudyReplyTab=$("#study-new-reply-tab").find('a');//Study 최신댓글 탭
const recentStudyPost =  $("#study-new-post-document"); //Study최신글
const recentStudyReply = $("#study-new-reply-document"); //Study 최신댓글
//Study 최신글, 최신댓글 마우스 오버, 클릭 시 active 바뀌게
recentStudyPostTab.on("mouseover click",function(e){
    e.preventDefault();
    //Tab
    recentStudyPostTab.addClass('active');
    recentStudyReplyTab.removeClass('active');
    //Tab content tab-active
    recentStudyPost.addClass('tab-active');
    recentStudyReply.removeClass('tab-active');
});
recentStudyReplyTab.on("mouseover click",function(e){
    e.preventDefault();
    recentStudyReplyTab.addClass('active');
    recentStudyPostTab.removeClass('active');
    //Tab content tab-active
    recentStudyReply.addClass('tab-active'); 
    recentStudyPost.removeClass('tab-active');
});
    
