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
	$(".nav-item:eq(6)").attr("class", "nav-item active");

	$("#btnAddRoom").click(function(){
		location.href = "/cy/registerHost1";
	});
	
	$(".room_title_a").on("click", function(){
		var that = $(this);
		var room_num = that.attr("data-room-num");
		console.log("room_num: " + room_num);
		location.href = "/cy/HostRoomDetail?room_num=" + room_num;
	});
	
});
</script>


<!-- host_register_page1 START -->
<br><br><br><br>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<label class="lblTitle1">${hostVo.user_name}님이 등록한 숙소들입니다.</label><br><br>
<!-- <label>2단계: 등록할 숙소의 사진과 정보를 입력해주세요.</label><br><br> -->
	
	<!-- Button -->
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-3"></div>
			<div class="col-md-3"></div>
			<div class="col-md-3" align="right">
				<button type="button" class="btn btn-primary btn-block" id="btnAddRoom" style="font-size:15px;" >숙소 추가하기</button>
			</div>
		</div><br>
	<!-- table START -->
		<div class="row" align="center">
		<table class="table" id="tbl_room">
			<thead align="center">
				<tr align="center">
					<th>숙소 위치</th>
					<th>이름</th>
					<th>건물 형식</th>
					<th>가격</th>
					<th>REMOVE</th>
				</tr>
			</thead>
				
			<tbody align="center">
				<c:forEach items="${list}" var="RoomDetailDto">
				<tr align="center">
					<td>${RoomDetailDto.room_location}</td>
					<td><a href="#" class="room_title_a" data-room-num="${RoomDetailDto.room_num}">${RoomDetailDto.room_title}</a></td>
					<td>${RoomDetailDto.room_type_explain}</td>
					<td>${RoomDetailDto.room_price}</td>
					<td align="center"><a href="#" class="remove_img" >
						<img alt="remove" src="../../islagrande/images/remove.png" width="30" height="30" />
						</a></td>
				</tr>
				</c:forEach>
			</tbody>	
		</table>
		</div>
	<!-- table END -->		
	</div>
			
	<div class="col-md-2"></div>
	</div>
</div><br><br><br>
<!-- host_register_page1 END -->

<%@ include file = "../../views/end.jsp"%> <!-- </body> -->