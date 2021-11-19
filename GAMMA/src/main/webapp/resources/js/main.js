$(document).ready(function() {
	// 취소
	$(".loginBtn").on("click", function() {
		location.href = "/user/naverLogin";
	})
	$(".joinBtn").on("click", function() {
		location.href = "/user/agreeJoin";
	})
	
	$(".consumer").mouseover(function(){
		$(".consumer__info").show();
	});

	$(".consumer").mouseout(function(){
		$(".consumer__info").hide();
	});
	
});