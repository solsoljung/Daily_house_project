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
	
	var room_type_num = "${roomVo.room_type_num}";
	
	// host_register_page4로 이동
	$("#btnNext").click(function(e){
		e.preventDefault();
		
		if(room_type_num == null || room_type_num == ""){
			alert("건물 유형을 선택해주세요.");
			return;
		}
		$("input[name=room_people]").val($("#room_people").val());
		$("input[name=room_bed]").val($("#room_bed").val());
		$("input[name=room_bathroom]").val($("#room_bathroom").val());
		
		$("#registerForm").submit(); //location.href = "/cy/registerHost4";
	});
	
	// select room_type_num
	$("#room_type_num").change(function() {
		room_type_num = $(this).val();
		$("input[name=room_type_num]").val(room_type_num);
		//console.log($("#room_type_num").val());
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
	
});
</script>


<!-- host_register_page1 START -->
<br><br><br><br>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<label class="lblTitle1">숙소에 얼마나 많은 인원이 숙박할 수 있나요?</label><br>
			<div class="progress">
				<div class="progress-bar w-75"></div>
			</div><br>
			<label>3단계: 모든 게스트가 편안하게 숙박할 수 있도록 침대가 충분히 구비되어있는지 확인하세요.</label><br><br>

			<form role="form" id="registerForm" action="/cy/registerHost4Post" method="post">
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
			
				<!-- 건물 유형 -->
				<div class="form-group">
					<label class="lblTitle2">건물 유형을 선택하세요</label>
					<select class="browser-default custom-select" id="room_type_num">
				        <option selected="">하나를 선택해주세요.</option>
						<!-- 값은 DB에서 불러와서 하기 -->
				        <option value="1"
				        	<c:if test="${roomVo.room_type_num eq 1}">selected</c:if>
				        >아파트</option>
				        <option value="2"
				        	<c:if test="${roomVo.room_type_num eq 2}">selected</c:if>
				        >주택</option>
				        <option value="3"
				        	<c:if test="${roomVo.room_type_num eq 3}">selected</c:if>
				        >게스트하우스</option>
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
							
							<input type="number" class="numBox" min="1" max="20" 
								<c:choose>
									<c:when test="${not empty roomVo}">
										value="${roomVo.room_people}" 
									</c:when>
									<c:otherwise>
										value="4" 
									</c:otherwise>
								</c:choose>
							readonly="readonly" id="room_people"/>
									
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
							
							<input type="number" class="numBox" min="1" max="20" 
								<c:choose>
									<c:when test="${not empty roomVo}">
										value="${roomVo.room_bed}" 
									</c:when>
									<c:otherwise>
										value="1" 
									</c:otherwise>
								</c:choose>
							readonly="readonly" id="room_bed"/>
									
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
								
							<input type="number" class="numBox" min="1" max="20" 
							<c:choose>
									<c:when test="${not empty roomVo}">
										value="${roomVo.room_bathroom}" 
									</c:when>
									<c:otherwise>
										value="1" 
									</c:otherwise>
							</c:choose>
							readonly="readonly" id="room_bathroom"/>
							
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