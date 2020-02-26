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
	.lblTitle1{ font-size: 25px; font-weight: bold;}
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

<script>
$(function(){
	
	// 현재 클릭된 메뉴를 활성화
	$(".nav-item:eq(0)").attr("class", "nav-item");
	$(".nav-item:eq(4)").attr("class", "nav-item active");
	
	
});
</script>

<br><br><br><br>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8"><br><br>
			<div class="row">
				<div class="col-md-8">
					<label class="lblTitle2 title">HELP</label>
					
				</div>
				<div class="col-md-4" align="right">
				</div>
			</div><br><br>
			
	<!-- table START -->
	<div class="row" align="center">
		<table class="table" id="tbl_room">
			<thead align="center">
				<tr align="center">
					<th> </th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
				
			<tbody align="center">
<%-- 				<c:forEach items="${list}" var="RoomDetailDto"> --%>
				<tr align="center">
<%-- 					<td>${RoomDetailDto.room_num}</td> --%>
<%-- 					<td>${RoomDetailDto.room_location}</td> --%>
<%-- 					<td><a href="#" class="room_title_a" data-room-num="${RoomDetailDto.room_num}">${RoomDetailDto.room_title}</a></td> --%>
<%-- 					<td>${RoomDetailDto.room_price}</td> --%>
<!-- 					<td><button type="button" class="btn btn-primary btnAdminCheckY"  -->
<%-- 						data-room-num="${RoomDetailDto.room_num}" --%>
<!-- 						style="font-size:15px;" >승인</button></td> -->
				</tr>
<%-- 				</c:forEach> --%>
			</tbody>	
		</table>
	</div>
	<!-- table END -->
	</div>
			
	<div class="col-md-2"></div>
	</div>
</div><br><br><br>

<%@ include file = "../../views/casahotel/casahotel_script2.jsp" %>			
<%@ include file = "../../views/islagrande/islagrande_script2.jsp" %>	

<%@ include file = "../../views/end.jsp"%> <!-- </body> -->