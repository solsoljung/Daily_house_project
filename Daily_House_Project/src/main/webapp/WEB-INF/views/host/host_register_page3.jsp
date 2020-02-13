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
	
	// host_register_page2로 이동
	$("#btnPrev").click(function(e){
		e.preventDefault();
		$("#registerForm").attr("action", "/cy/registerHost2Post");
		$("#registerForm").submit();
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

		$("#registerForm").attr("action", "/cy/registerHost4Post");
		$("#registerForm").submit();
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
				<div class="progress-bar w-75"></div>
			</div><br>
			<label>3단계: 등록할 숙소의 사진과 정보를 입력해주세요.</label><br><br>
			
			<form role="form" method="post" id="registerForm" >
			roomVo: ${roomVo}
			<input type="hidden" name="room_type_num" value="${roomVo.room_type_num}"/>
			<input type="hidden" name="room_people" value="${roomVo.room_people}"/>
			<input type="hidden" name="room_bed" value="${roomVo.room_bed}"/>
			<input type="hidden" name="room_bathroom" value="${roomVo.room_bathroom}"/>
			<input type="hidden" name="room_options" value="${roomVo.room_options}"/>
			
				<!-- 사진 및 소개 등록 -->
				<div class="form-group">
					<label class="lblTitle2">숙소 이름을 입력해주세요.</label>
					<input type="text" class="form-control" name="room_title"/><br><br>
					
					<label class="lblTitle2">숙소 소개를 해주세요.</label>
					<textarea rows="10" cols="50" name="room_explain" style="width:100%;" maxlength="350" ></textarea><br><br>
					
					<label class="lblTitle2">가격을 정하세요.</label>
					<div class="row">
						<div class="col-md-3">
							<input type="text" class="form-control" name="room_price"/>
						</div>
						<div class="col-md-3"></div>
						<div class="col-md-3"></div>
						<div class="col-md-3"></div>
						</div>
					<br><br>
				</div><br><br><br>
					
				<!-- Button -->
				<br>
				<div class="row">
					<div class="col-md-3">
						<button type="button" class="btn btn-primary btn-block" id="btnPrev">Prev</button>
					</div>
					<div class="col-md-3"></div>
					<div class="col-md-3"></div>
					<div class="col-md-3" align="right">
						<button type="button" class="btn btn-primary btn-block" id="btnNext" >Next</button>
					</div>
				</div>
				
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</div><br><br><br>
<!-- host_register_page1 END -->

<%@ include file = "../../views/end.jsp"%> <!-- </body> -->