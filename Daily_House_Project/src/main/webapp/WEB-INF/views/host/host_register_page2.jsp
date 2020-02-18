<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 데이터피커X -->					
<%@ include file = "../../views/title2.jsp"%> <!-- <head> -->					
					
<%@ include file = "../../views/casahotel/casahotel_link2.jsp" %>					
<%@ include file = "../../views/islagrande/islagrande_link.jsp" %>					
					
<%@ include file = "../../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->					
<!-- 데이터피커X -->	

<style>
	.lblTitle1{ font-size: 30px; font-weight: bold;}
	.lblTitle2{ font-size: 20px;}
	.lblTitle3{ font-size: 15px; font-weight: bold;}
	
	#fileDrop {
	width: 100%;
	height: 100px;
	border: 1px dashed #fb929e;
	background-color: #F2F2F2;
	margin: auto;
}
</style>

<script src="/js/myscript.js"></script>
<script>
$(function(){
	// 현재 클릭된 메뉴를 활성화
	$(".nav-item:eq(0)").attr("class", "nav-item");
	$(".nav-item:eq(5)").attr("class", "nav-item active");
	
	$("#fileDrop").on("dragenter dragover", function(e) {
		e.preventDefault();
	});
	
	// 첨부파일 삭제랑 여기는 host_register_page4로 이동
	$("#fileDrop").on("drop", function(e) {
		e.preventDefault(); // 브라우저로 파일 열기 안하기
		var file = e.originalEvent.dataTransfer.files[0];
		console.log(file);
		var formData = new FormData(); // <form>
		formData.append("file", file); // <input name="file"/>
		
		var url = "/upload/uploadAjax"; // UploadController.java
		
		// <form enctype="multipart/form-data"
		// -> enctyp의 기본값: application/x-www-form-urlencoded
		// "processData":false, "contentType":false
		$.ajax({
			"type" : "post",
			"url" : url,
			"processData" : false,
			"contentType" : false,
			"data" : formData,
			"success" : function(fullName) {
				console.log(fullName); 
				// 파일명 얻기
				var underScoreIndex = fullName.indexOf("_");
				var fileName = fullName.substring(underScoreIndex + 1); // Penguins.jpg
				// 썸네일 이미지의 이름 얻기
				var thumbnailName = getThumbnailName(fullName); // myscript.js
				console.log("thumbnailName:	" + thumbnailName);
				var isImage = checkImage(thumbnailName);
				console.log("isImage:" + isImage);
				var html = "<div data-filename='"+fullName+"' style='display: inline;'>";
				if (isImage == true) {
					html +=
	"<img class='img-thumbnail' src='/upload/displayFile?fileName=" + thumbnailName + "' /><br>";
				} else {
					html += 
	"<img class='img-thumbnail' src='/resources/images/file_image.png'/><br>";
				}
				html += "<span>" + fileName + "</span>";
				html += "<a href='"+fullName+"' class='attach-del'><span>x</span></a>";
				html += "</div><br>";
				$("#uploadedList").append(html);
			}
		}); // $.ajax()
	}); // $("#fileDrop").on("drop",
			
	// 첨부 파일 삭제 링크
	$("#uploadedList").on("click", ".attach-del", function(e) {
		e.preventDefault();
		var that = $(this);
		var fullName = that.attr("href");
		console.log("fullName:" + fullName);
		var url = "/upload/deleteFile";
		var sendData = {"fileName" : fullName};
		$.get(url, sendData, function(rData) {
			console.log(rData);
			if (rData == "success") {
				that.parent().remove();
			}
		});
	});
	
	// host_register_page3으로 이동
	$("#btnNext").click(function(e){
		e.preventDefault();
		
		var room_title = $("input[name=room_title]").val();
		var room_explain = $("textarea[name=room_explain]").val();
		var room_price = $("input[name=room_price]").val();
		
		if(room_title == null || room_title == ""){
			alert("숙소 이름을 입력해주세요.");
			return;
		}
		if(room_explain == null || room_explain == ""){
			alert("숙소 소개를 해주세요.");
			return;
		}
		if(room_price == null || room_price == ""){
			alert("숙소 가격을 정하세요.");
			return;
		}
		
		var upDiv = $("#uploadedList > div");
		var pics = [];
		console.log("upDiv: " + upDiv);
		
		upDiv.each(function(index) {
			var pic_uri = $(this).attr("data-filename");
			console.log(pic_uri);
			pics.push(pic_uri);
			
		});
		console.log("pics: " + pics);
		$("input[name=pics]").val(pics);
		console.log("input[name=pics]: " + $("input[name=pics]").val());
		
		$("#registerForm").attr("action", "/cy/registerHost3Post");
		$("#registerForm").submit();
		
// 		upDiv.each(function(index) {
// 			var pic_uri = $(this).attr("data-filename");
// 			console.log(pic_uri);
// 			var hiddenInput = "<input type='hidden' name='pics["+index+"]'" 
// 							+ " value='"+pic_uri+"'/>";
// 			console.log("hiddenInput: " + hiddenInput);
// 		$("#registerForm").attr("action", "/cy/registerHost3Post");
// 		$("#registerForm").submit();
// 		});
	});
	
	// room_price는 숫자만 입력할 수 있도록 설정
	$("input[name=room_price]").on("keyup", function() {
	    $(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	
});
</script>


<!-- host_register_page1 START -->
<br><br><br><br>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<label class="lblTitle1">숙소를 소개해주세요~</label><br>
			<div class="progress">
				<div class="progress-bar w-50"></div>
			</div><br>
			<label>2단계: 등록할 숙소의 사진과 정보를 입력해주세요.</label><br><br>
			
			<form role="form" method="post" id="registerForm" >
			roomVo: ${roomVo}
			<input type="hidden" name="room_location" value="${roomVo.room_location}"/>
			<input type="hidden" name="room_location_detail"  value="${roomVo.room_location_detail}"/>
			<input type="hidden" name="pics" />
			
				<!-- 사진 및 소개 등록 -->
				<div class="form-group">
					<label class="lblTitle2">숙소 이름을 입력해주세요.</label>
					<input type="text" class="form-control" name="room_title"
						<c:if test="${not empty roomVo.room_title}">value="${roomVo.room_title}"</c:if>					
					/><br><br>
					
					<label class="lblTitle2">숙소 소개를 해주세요.</label>
					<textarea rows="10" cols="50" name="room_explain" style="width:100%;" maxlength="350"><c:if test="${not empty roomVo.room_explain}">
${roomVo.room_explain}</c:if></textarea><br><br>
					
					<label class="lblTitle2">가격을 정하세요.</label>
					<div class="row">
						<div class="col-md-3">
							<input type="text" class="form-control" name="room_price"
								<c:if test="${roomVo.room_price != 0}">value="${roomVo.room_price}"</c:if>				
							/>
						</div>
						<div class="col-md-3"></div>
						<div class="col-md-3"></div>
						<div class="col-md-3"></div>
						</div>
					<br><br>
					
					<!-- 파일 첨부 -->
					<div class="form-group">
						<label for="fileDrop" class="lblTitle2">첨부할 파일을 드래그, 드롭하세요</label>
						<div id="fileDrop"></div>
					</div>
					
					<!-- 썸네일 이미지 -->
					<div class="form-group" id="uploadedList" style="display: inline;">
					
					</div>
					
				</div><br><br><br>
					
				<!-- Button -->
				<br>
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-3"></div>
					<div class="col-md-3"></div>
					<div class="col-md-3" align="right">
						<button type="button" class="btn btn-primary btn-block py-3 px-5" id="btnNext" style="font-size:15px;" >Next</button>
					</div>
				</div>
				
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</div><br><br><br>
<!-- host_register_page1 END -->

<%@ include file = "../../views/end.jsp"%> <!-- </body> -->