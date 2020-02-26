<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 데이터피커X -->					
<%@ include file = "../../views/title2.jsp"%> <!-- <head> -->					
					
<%@ include file = "../../views/casahotel/casahotel_link2.jsp" %>					
<%@ include file = "../../views/islagrande/islagrande_link.jsp" %>					

<script type="text/javascript">
$(function() {
	$(".btn_reserv_pay").click(function() {
		
	});
});
</script>

<%@ include file = "../../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->					
<!-- 데이터피커X -->
<br>
<br>
<br>
<br>
<br>
<br>
<h1>손님들 예약 관리 페이지</h1>

<p>ing가 Y인 애들만 보이는것이 기본</p>
<p>페이지의 목적 : 손님들이 예약 취소를 해서 status가 N일때 버튼이 보이고</p>
<p>버튼 클릭시 R로 바뀌면서 "마일리지 회수", "결제 취소(돈 돌려주기)" 작업이 되야 함</p>

<table>
	<tr>
		<th>reserv_num</th>
		<th>room_num</th>
		<th>user_email</th>
		<th>room_reserv_start_date</th>
		<th>room_reserv_end_date</th>
		<th>reserv_price</th>
		<th>reserv_state</th>
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
				${adminReservaionList.reserv_state}
				<c:if test="${adminReservaionList.reserv_state == 'N'}">
					<input type="button" value="확인" class="btn_reserv_pay">
				</c:if>
			</td>
		</tr>
	</c:forEach>
</table>


<%@ include file = "../../views/casahotel/casahotel_footer.jsp" %>

<%@ include file = "../../views/casahotel/casahotel_script2.jsp" %>			
<%@ include file = "../../views/islagrande/islagrande_script2.jsp" %>	

<%@ include file = "../../views/end.jsp"%> <!-- </body> -->