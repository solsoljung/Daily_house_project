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
	$("#btnNext").click(function(){
		console.log("btnNext click");
		location.href = "/cy/registerHost2";
	});
	
	// select room_type_num
	var room_type_num = "";
	$("#room_type_num").change(function() {
		room_type_num = $(this).val();
		console.log(room_type_num);
	});
	
	
	// 수량 버튼 SRATR
	// .plus
	$(".plus").on("click", function(e){
		var num = $(this).parent().find(".numBox").val();
		var plusNum = Number(num) + 1;
		var max = 50;
		
		var target = $(this).parent().find(".numBox");
		if(plusNum > max) {
			target.val(num);
		} else {
		    target.val(plusNum);          
		}
	});
	
	// .minus
	$(".minus").on("click", function(e){
		var num = $(this).parent().find(".numBox").val();
		var minusNum = Number(num) - 1;
		   
		var target = $(this).parent().find(".numBox");
		if(minusNum <= 0) {
			target.val(num);
		} else {
			target.val(minusNum);          
		}
	});
	// 수량 버튼 END
	
	// test Button
	$("#btnTest").click(function(){
		var room_people = $("input[name=room_people]").val();
		var room_bed = $("input[name=room_bed]").val();
		var room_bathroom = $("input[name=room_bathroom]").val();
		
		if(room_type_num == null || room_type_num == ""){
			alert("CHECK room_type_num");
		}
		
		console.log("room_type_num: " + room_type_num);
		console.log("room_people: " + room_people);
		console.log("room_bed: " + room_bed);
		console.log("room_bathroom: " + room_bathroom);
	});
	
});
</script>


<!-- host_register_page1 START -->
<br><br><br><br>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<label class="lblTitle1">숙소 등록을 시작해 볼까요?</label><br>
			<div class="progress">
				<div class="progress-bar w-25"></div>
			</div><br>
			<label>1단계: 기본 사항을 입력하세요</label><br><br>

			<form role="form">
			
				<!-- 건물 유형 -->
				<div class="form-group">
					<label class="lblTitle2">건물 유형을 선택하세요</label>
					<select class="browser-default custom-select" name="room_type_num" id="room_type_num">
				        <option selected="">하나를 선택해주세요.</option>
						<!-- 값은 DB에서 불러와서 하기 -->
				        <option value="1">아파트</option>
				        <option value="2">주택</option>
				        <option value="3">게스트하우스</option>
				     </select>
				</div><br><br><br>
				
				<!-- 인원수 -->
				<div class="form-group">
					<label class="lblTitle2">숙소에 얼마나 많은 인원이 숙박할 수 있나요?</label>
					<br>
					
					<div class="row">
						<div class="col-md-3">
							<label class="lblTitle3">최대 숙박 인원</label>
						</div>
						<div class="col-md-3">
							<button type="button" class="minus" style="border: none; background: none;">-</button>
									<input type="number" class="numBox" min="1" max="20" value="4" readonly="readonly" name="room_people"/>
							<button type="button" class="plus" style="border: none; background: none;">+</button>
						</div>
						<div class="col-md-3"></div>
						<div class="col-md-3"></div>
					</div>
				</div><br><br><br>
				
				<!-- 침대수 -->
				<div class="form-group">
					<label class="lblTitle2">게스트가 사용할 수 있는 침대는 몇 개인가요?</label>
					<br>
					
					<div class="row">
						<div class="col-md-3">
							<label class="lblTitle3">침대</label>
						</div>
						<div class="col-md-3">
							<button type="button" class="minus" style="border: none; background: none;">-</button>
									<input type="number" class="numBox" min="1" max="20" value="1" readonly="readonly" name="room_bed"/>
							<button type="button" class="plus" style="border: none; background: none;">+</button>
						</div>
						<div class="col-md-3"></div>
						<div class="col-md-3"></div>
					</div>
				</div><br><br><br>
				
				<!-- 욕실수 -->
				<div class="form-group">
					<label class="lblTitle2">욕실 수를 선택해주세요.</label>
					<br>
					
					<div class="row">
						<div class="col-md-3">
							<label class="lblTitle3">욕실</label>
						</div>
						<div class="col-md-3">
							<button type="button" class="minus" style="border: none; background: none;">-</button>
									<input type="number" class="numBox" min="1" max="20" value="1" readonly="readonly" name="room_bathroom"/>
							<button type="button" class="plus" style="border: none; background: none;">+</button>
						</div>
						<div class="col-md-3"></div>
						<div class="col-md-3"></div>
					</div>
				</div><br>
				
				
				<!-- Button -->
				<br>
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-3"></div>
					<div class="col-md-3">
						<button type="button" class="btn btn-primary btn-block" id="btnTest" >TEST</button>
					</div>
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