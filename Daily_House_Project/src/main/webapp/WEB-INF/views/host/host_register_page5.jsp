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
	height: 400px;
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
	
	// https://sub0709.tistory.com/46
	
	$("#fileDrop").on("dragenter dragover", function(e) {
		e.preventDefault();
	});
	
	var file = "";
	var v = 0;
	
	$("#fileDrop").on("drop", function(e) {
		e.preventDefault(); // 브라우저로 파일 열기 안하기
		file = e.originalEvent.dataTransfer.files[0];
		console.log(file);
		
		var formData = new FormData(); // <form>
		formData.append("file", file); // <input name="file"/>
		
		var url = "/upload/uploadAjax"; // UploadController.java
		v++;
		if(v > 5){
			alert("사진은 5장까지만 올릴 수 있습니다.");
			return;
		}
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
	"<img class='img-thumbnail' src='/upload/displayFile?fileName=" + thumbnailName + "'/><br>";
				} else {
					html += 
	"<img class='img-thumbnail' src='/resources/images/file_image.png'/><br>";
				}
// 				html += "<span>" + fileName + "</span>";
				html += "<a href='"+fullName+"' class='attach-del' ><span class='right' float='right'>x</span></a>";
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
				v--;
				that.parent().remove();
			}
		});
	});
	
	// registerHost으로 이동
	$("#btnNext").click(function(e){
		e.preventDefault();
		
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
		
		$("#registerForm").attr("action", "/cy/registerHost");
		$("#registerForm").submit();
		
	});
	
});
</script>


<!-- host_register_page1 START -->
<br><br><br><br>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8"><br><br>
			<label class="lblTitle1">마지막으로 숙소의 사진을 올려주세요~</label><br>
			<div class="progress">
				<div class="progress-bar" style="width: 100%"></div>
			</div><br>
			<label>5단계: 숙소의 사진을 등록해주세요.</label><br><br><br>
			
			<form role="form" method="post" id="registerForm" >
<%-- 			roomVo: ${roomVo} --%>
			<input type="hidden" name="room_type_num" value="${roomVo.room_type_num}"/>
			<input type="hidden" name="room_people" value="${roomVo.room_people}"/>
			<input type="hidden" name="room_bed" value="${roomVo.room_bed}"/>
			<input type="hidden" name="room_bathroom" value="${roomVo.room_bathroom}"/>
			<input type="hidden" name="room_location" value="${roomVo.room_location}"/>
			<input type="hidden" name="room_location_detail"  value="${roomVo.room_location_detail}"/>
			<input type="hidden" name="room_title" value="${roomVo.room_title}"/>
			<input type="hidden" name="room_explain" value="${roomVo.room_explain}"/>
			<input type="hidden" name="room_price" value="${roomVo.room_price}"/>
			<input type="hidden" name="room_option_code" value="${roomVo.room_option_code}"/>
<%-- 			<c:if test="${not empty roomVo.room_option_code}"> --%>
<%-- 			<c:forEach var="room_option_code" items="${roomVo.room_option_code}" varStatus="status"> --%>
<%-- 				<input type="hidden" name="room_option_code" value="${roomVo.room_option_code[status.index]"/> --%>
<%-- 			</c:forEach> --%>
<%-- 			</c:if> --%>
			<input type="hidden" name="pics" />
			
					<!-- 파일 첨부 -->
					<div class="form-group">
						<label for="fileDrop" class="lblTitle2">첨부할 파일을 드래그, 드롭하세요</label>
						<div id="fileDrop"></div>
					</div>
					
					<!-- 썸네일 이미지 -->
					<div class="form-group" id="uploadedList" style="display: inline;">
					
					</div>
					
				<br><br>
					
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