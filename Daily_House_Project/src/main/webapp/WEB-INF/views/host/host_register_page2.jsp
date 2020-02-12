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
	$("#btnPrev").click(function(){
		location.href = "/cy/registerHost1";
	});
	$("#btnNext").click(function(){
		location.href = "/cy/registerHost3";
	});
	
	var data_option = "";
	$(".chb").on("click", function(e){
		data_option = $(this).attr("data-option");
		console.log(data_option);
	});
	
});
</script>


<form id="save_form">
	
</form>


<!-- host_register_page1 START -->
<br><br><br><br>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<label class="lblTitle1">숙소 등록이 거의 다 되어갑니다!</label><br>
			<div class="progress">
				<div class="progress-bar w-50"></div>
			</div><br>
			<label>2단계: 상세한 사항을 입력하세요</label><br><br>
			
			<form role="form">
			
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