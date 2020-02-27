<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 데이터피커X -->					
<%@ include file = "../../views/title2.jsp"%> <!-- <head> -->					
					
<%@ include file = "../../views/casahotel/casahotel_link2.jsp" %>					
<%@ include file = "../../views/islagrande/islagrande_link.jsp" %>					

<script type="text/javascript">
$(function() {
	$(".btn_reserv_pay").on("click",function() {
		var reserv_num = $(this).attr("data-reserv_num");
		var reserv_price = $(this).attr("data-reserv_price");
		var reserv_mile = Math.ceil(parseInt(reserv_price) * 0.05);
		var user_email = $(this).attr("data-user_email");
		var room_num = $(this).attr("data-room_num");
		
		$("#reserv_num").val(reserv_num);
		$("#reserv_price").val(reserv_price);
		$("#reserv_mile").val(reserv_mile);
		$("#user_email").val(user_email);
		$("#room_num").val(room_num);
		
		$("#form_reserv_pay").submit();
	});
});
</script>

<%@ include file = "../../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->					
<!-- 데이터피커X -->
<br><br><br><br>

<form id="form_reserv_pay" action="/boo/adminReservResult" method="get">
	<input type="hidden" name="reserv_num" id="reserv_num">
	<input type="hidden" name="reserv_price" id="reserv_price">
	<input type="hidden" name="reserv_mile" id="reserv_mile">
	<input type="hidden" name="user_email" id="user_email">
	<input type="hidden" name="room_num" id="room_num">
</form>


<section class="ftco-section ftco-room">
	<div class="container">
		<h1 style="font-family: 맑은 고딕;">포인트 이용 내역</h1>
		<div class="row bg-white p-md-5 p-4 mb-5 border">
			<c:choose>
				<c:when test="${userVo.user_email == 'admin@naver.com'}">
					<table class="table" id="tbl_room">
						<tr>
							<th>예약 번호</th>
							<th>방 번호</th>
							<th>유저 아이디</th>
							<th>체크인 날짜</th>
							<th>체크아웃 날짜</th>
							<th>가격</th>
							<th>예약 상태</th>
						</tr>
						<c:forEach items="${adminReservaionList}" var="adminReservaionList">
							<tr>
								<td>${adminReservaionList.reserv_num}</td>
								<td>${adminReservaionList.room_num}</td>
								<td>${adminReservaionList.user_email}</td>
								<td>${adminReservaionList.room_reserv_start_date}</td>
								<td>${adminReservaionList.room_reserv_end_date}</td>
								<td>${adminReservaionList.reserv_price}</td>
								<td>
									<c:if test="${adminReservaionList.reserv_state == 'Y'}">
										예약
									</c:if>
									<c:if test="${adminReservaionList.reserv_state == 'N'}">
										예약 취소
										<input type="button" value="확인" class="btn_reserv_pay" 
											   data-reserv_num="${ adminReservaionList.reserv_num}"
											   data-reserv_price="${adminReservaionList.reserv_price}"
											   data-user_email="${adminReservaionList.user_email}"
											   data-room_num="${adminReservaionList.room_num}">
									</c:if>
									<c:if test="${adminReservaionList.reserv_state == 'R'}">
										처리 완료
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</table>
				</c:when>
				<c:otherwise>
					<h2 style="font-family: 맑은 고딕;">관리자 전용 페이지 입니다.</h2>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</section>

<%@ include file = "../../views/casahotel/casahotel_footer.jsp" %>

<%@ include file = "../../views/casahotel/casahotel_script2.jsp" %>			
<%@ include file = "../../views/islagrande/islagrande_script2.jsp" %>	

<%@ include file = "../../views/end.jsp"%> <!-- </body> -->