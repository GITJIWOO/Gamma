$(document).ready(function() {

	$("#modifyBtn").click(function(){
		$("#reviewInfo").hide();
		$("#modifyBtn").hide();
		$("#removeReview").hide();
		$("#reviewModify").css("display", "flex");
		$(".fa-thumbs-down").toggleClass().addClass("fas fa-thumbs-down fa-lg");
		$(".fa-thumbs-up").toggleClass().addClass("fas fa-thumbs-up fa-lg");
	});
	
	$("#modifyCancel").click(function(){
		$("#reviewInfo").show();
		$("#modifyBtn").show();
		$("#removeReview").show();
		$("#reviewModify").css("display", "none");
		$(".fa-thumbs-down").toggleClass().addClass("fas fa-thumbs-down fa-2x");
		$(".fa-thumbs-up").toggleClass().addClass("fas fa-thumbs-up fa-2x");
	});
	
	$("div#notLike").click(function() {
		let isCheck = $(".isLike").is(":checked");
		$(".notLike").prop("checked", true);
		$("#notLike").toggleClass().addClass("btn btn-danger");
		$(".fa-thumbs-down").toggleClass().addClass("fas fa-thumbs-down fa-lg");
		if(isCheck === true) {
			$(".isLike").prop("checked", false);
			$("#isLike").toggleClass().addClass("btn btn-secondary");
			$(".fa-thumbs-up").toggleClass().addClass("far fa-thumbs-up fa-lg");
		}
	});
	
	$("div#isLike").click(function() {
		let notCheck = $(".notLike").is(":checked");
		$(".isLike").prop("checked", true);
		$("#isLike").toggleClass().addClass("btn btn-success");
		$(".fa-thumbs-up").toggleClass().addClass("fas fa-thumbs-up fa-lg");
		if(notCheck === true) {
			$(".notLike").prop("checked", false);
			$("#notLike").toggleClass().addClass("btn btn-secondary");
			$(".fa-thumbs-down").toggleClass().addClass("far fa-thumbs-down fa-lg");
		}
	});
	
	$("#reviewUpdate").click(function updateCheck(){
		let isCheck = $(".isLike").is(":checked");
		let notCheck = $(".notLike").is(":checked");
		
		if(isCheck === false && notCheck === false) {
			alert("평가를 선택하십시오.");
			return false;
		} else {
			return true;
		}
	});
	

});