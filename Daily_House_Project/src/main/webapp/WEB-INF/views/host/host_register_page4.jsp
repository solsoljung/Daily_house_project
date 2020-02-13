<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<%@ include file = "../../views/title.jsp"%> <!-- <head> -->

<%@ include file = "../../views/casahotel/casahotel_link.jsp" %>
<%@ include file = "../../views/islagrande/islagrande_link.jsp" %>

<%@ include file = "../../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->

<style>
	.lblTitle1{ font-size: 30px; font-weight: bold;}
	.lblTitle2{ font-size: 20px;}
	.lblTitle3{ font-size: 15px; font-weight: bold;}
</style>

<script>
$(function(){
	// 현재 클릭된 메뉴를 활성화
	$(".nav-item:eq(0)").attr("class", "nav-item");
	$(".nav-item:eq(5)").attr("class", "nav-item active");
	
	// host_register_page3으로 이동
	$("#btnPrev").click(function(){
		location.href = "/cy/registerHost3";
	});

	// room_location을 저장할 공간
	var room_location = "";
	
	// test Button
	$("#btnTest").click(function(){
		var location1 = $("input[name=location1]").val();
		var location2 = $("input[name=location2]").val();
		var location3 = $("input[name=location3]").val();
		var location4 = $("input[name=location4]").val(); // 선택사항
		var location5 = $("input[name=location5]").val();
		
		if(location1 == null || location1 == ""){
			alert("시/도를 입력하세요.");
			return;
		}
		if(location2 == null || location2 == ""){
			alert("시/군/구를 입력하세요.");
			return;
		}
		if(location3 == null || location3 == ""){
			alert("도로명 주소를 입력하세요.");
			return;
		}
		if(location5 == null || location5 == ""){
			alert("우편번호를 입력하세요.");
			return;
		}
		
		room_location += location1 + " " + location2 + " " + location3; 
		if(!location4 == null && !location4 == ""){
			room_location += " " + location4 
		}
		room_location += " " + location5;
		
		console.log("room_location: " + room_location);
	});
});
</script>


<!-- host_register_page1 START -->
<br><br><br><br>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<label class="lblTitle1">숙소의 위치를 알려주세요.</label><br>
			<div class="progress">
				<div class="progress-bar w-100"></div>
			</div><br>
			<label>4단계: 등록할 숙소의 상세 주소를 입력해주세요.</label><br><br>

			<form role="form">
			
				<!-- 위치등록 -->
				<div class="form-group">
					<div class="row">
						<div class="col-md-6">
							<label class="lblTitle2">시/도</label>
							<input type="text" class="form-control" name="location1" placeholder="예) 서울특별시"/>
						</div>
						<div class="col-md-6">
							<label class="lblTitle2">시/군/구</label>
							<input type="text" class="form-control" name="location2" placeholder="예) 강남구"/>
						</div>
					</div><br><br>
					
					<label class="lblTitle2">도로명 주소</label>
					<input type="text" class="form-control" name="location3" placeholder="예) 언주로 406"/><br><br>
					
					<label class="lblTitle2">동호수(선택 사항)</label>
					<input type="text" class="form-control" name="location4" placeholder="예) 202동 201호"/><br><br>
					
					<label class="lblTitle2">우편번호</label>
					<input type="text" class="form-control" name="location5" placeholder="예) 135-919"/><br><br>
					
				</div><br><br><br>
					
				<!-- Button -->
				<br>
				<div class="row">
					<div class="col-md-3">
						<button type="button" class="btn btn-primary btn-block" id="btnPrev">Prev</button>
					</div>
					<div class="col-md-3"></div>
					<div class="col-md-3">
						<button type="button" class="btn btn-primary btn-block" id="btnTest" >TEST</button>
					</div>
					<div class="col-md-3" align="right">
						<button type="button" class="btn btn-primary btn-block" id="btnNext" >Complete</button>
					</div>
				</div>
				
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</div><br><br><br>
<!-- host_register_page1 END -->

<%@ include file = "../../views/end.jsp"%> <!-- </body> -->