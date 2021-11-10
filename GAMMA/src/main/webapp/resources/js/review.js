$(document).ready(function() {
	$("#modifyBtn").click(function(){
		$("#reviewInfo").hide();
		$("#modifyBtn").hide();
		$("#removeReview").hide();
		$("#reviewModify").css("display", "flex");
	});
	
	$("#modifyCancel").click(function(){
		$("#reviewInfo").show();
		$("#modifyBtn").show();
		$("#removeReview").show();
		$("#reviewModify").css("display", "none");
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

	function removeReview() {
		if(confirm("리뷰를 삭제하시겠습니까?")) {
			let choice = document.getElementById("removeReview");
			choice.submit();
		} else {
			location.href="/review/reviewDetail/${review.grnum}";
		}
	}

	function removeReviewComment() {
		if(confirm("댓글을 삭제하시겠습니까?")) {
			let choice = document.getElementById("removeReviewComment");
			choice.submit();
		} else {
			location.href="/review/reviewDetail/${review.grnum}";
		}
	}
});