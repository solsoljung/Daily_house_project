<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
	
	// checkbox에서 checked인 room_option을 저장할 배열
	var data_options = [];
	
	// 전송페이지로 이동
	$("#btnNext").click(function(e){
		e.preventDefault();
		$(".chb:checked").each(function() { 
			data_options.push($(this).attr("data-option"));
	    });
		console.log("data_options: " + data_options);
		$("input[name=room_options]").val(data_options);
		console.log("input data_options" + $("input[name=room_options]").val());
		console.log("${roomVo}");
		
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
		<div class="col-md-8">
			<label class="lblTitle1">숙소 등록이 거의 다 되어갑니다!</label><br>
			<div class="progress">
				<div class="progress-bar w-100"></div>
			</div><br>
			<label>4단계: 상세한 사항을 입력하세요</label><br><br>
			
			<form role="form" id="registerForm" method="post">
			
			roomVo: ${roomVo}
			<input type="hidden" name="room_type_num" value="${roomVo.room_type_num}"/>
			<input type="hidden" name="room_people" value="${roomVo.room_people}"/>
			<input type="hidden" name="room_bed" value="${roomVo.room_bed}"/>
			<input type="hidden" name="room_bathroom" value="${roomVo.room_bathroom}"/>
			<input type="hidden" name="room_location" value="${roomVo.room_location}"/>
			<input type="hidden" name="room_location_detail"  value="${roomVo.room_location_detail}"/>
			<input type="hidden" name="room_title" value="${roomVo.room_title}"/>
			<input type="hidden" name="room_explain" value="${roomVo.room_explain}"/>
			<input type="hidden" name="room_price" value="${roomVo.room_price}"/>
			<input type="hidden" name="room_options" />
			
				<!-- 편의시설 -->
				<div class="form-group">
					<label class="lblTitle2">어떤 편의시설을 제공하시나요?</label>
					
					<div class="checkbox">
						<label class="lblTitle2" ><input type="checkbox" class="chb" data-option="에어컨"/> 에어컨</label><br>
						<label class="lblTitle2" ><input type="checkbox" class="chb" data-option="무선인터넷"/> 무선인터넷</label><br>
						<label class="lblTitle2" ><input type="checkbox" class="chb" data-option="TV"/> TV</label><br>
						<label class="lblTitle2" ><input type="checkbox" class="chb" data-option="조식"/> 조식</label><br>
						<label class="lblTitle2" ><input type="checkbox" class="chb" data-option="주차공간"/> 주차공간</label><br>
						<label class="lblTitle2" ><input type="checkbox" class="chb" data-option="흡연가능"/> 흡연가능</label><br>
						<label class="lblTitle2" ><input type="checkbox" class="chb" data-option="반려동물"/> 반려동물</label><br>
						<label class="lblTitle2" ><input type="checkbox" class="chb" data-option="옷장"/> 옷장</label><br>
						<label class="lblTitle2" ><input type="checkbox" class="chb" data-option="헤어드라이"/> 헤어드라이</label>
					</div> 
					
				</div><br><br><br>
				
				<!-- Button -->
				<br>
				<div class="row">
					<div class="col-md-3">
<!-- 						<button type="button" class="btn btn-primary btn-block" id="btnPrev">Prev</button> -->
					</div>
					<div class="col-md-3"></div>
					<div class="col-md-3"></div>
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