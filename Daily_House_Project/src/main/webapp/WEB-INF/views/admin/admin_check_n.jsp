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
	
	a{ color: black; }
	
	.room_title_a{ font-weight: bold; }
}
</style>

<script>
$(function(){
	
	// 현재 클릭된 메뉴를 활성화
	$(".nav-item:eq(0)").attr("class", "nav-item");
	
	// room_title_a
	$(".room_title_a").on("click", function(e){
		var that = $(this);
		var room_num = that.attr("data-room-num");
		console.log("room_num: " + room_num);
		location.href = "/cy/AdminRoomDetail?room_num=" + room_num;
	});
	
	// 승인클릭시 숙소를 승인으로 변경
	$(".btnAdminCheckY").on("click", function(e){
		var that = $(this);
		var room_num = that.attr("data-room-num");
		console.log("room_num: " + room_num);
		
		var url = "/cy/updateRoomAdminCheckY/" + room_num;
		$.ajax({
			"type" : "delete",
			"url" : url,
			"headers" : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "delete"
			},
			"success" : function(rData) {
				console.log("rData:" + rData);
				var target = that.parent().parent();
				target.remove();
				
				if($("#tbl_room").find($(".btnAdminCheckY")).val() == null){
					$("#tbl_room").remove();
					$(".title").text("* 미승인 숙소가 없습니다.");
				} //if
				
			}
		}); // ajax
	}); // btn
	
});
</script>

<br><br><br><br>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8"><br><br>
			<div class="row">
				<div class="col-md-8">
				<c:choose>
					<c:when test="${empty list}">
						<label class="lblTitle1 title">* 미승인 숙소가 없습니다.</label>
					</c:when>
					<c:otherwise>
						<label class="lblTitle1 title">* 미승인 숙소입니다.</label>
					</c:otherwise>
				</c:choose>
					
				</div>
				<div class="col-md-4" align="right">
				</div>
			</div><br>
			
	<!-- table START -->
	<c:if test="${not empty list}">
		<div class="row" align="center">
		<table class="table" id="tbl_room">
			<thead align="center">
				<tr align="center">
					<th> </th>
					<th>숙소 위치</th>
					<th>이름</th>
					<th>가격</th>
					<th>승인</th>
				</tr>
			</thead>
				
			<tbody align="center">
				<c:forEach items="${list}" var="RoomDetailDto">
				<tr align="center">
					<td>${RoomDetailDto.room_num}</td>
					<td>${RoomDetailDto.room_location}</td>
					<td><a href="#" class="room_title_a" data-room-num="${RoomDetailDto.room_num}">${RoomDetailDto.room_title}</a></td>
					<td>${RoomDetailDto.room_price}</td>
					<td><button type="button" class="btn btn-primary btnAdminCheckY" 
						data-room-num="${RoomDetailDto.room_num}"
						style="font-size:15px;" >승인</button></td>
				</tr>
				</c:forEach>
			</tbody>	
		</table>
		</div>
	</c:if>
	<!-- table END -->
	</div>
			
	<div class="col-md-2"></div>
	</div>
</div><br><br><br>

<%@ include file = "../../views/casahotel/casahotel_script2.jsp" %>			
<%@ include file = "../../views/islagrande/islagrande_script2.jsp" %>	

<%@ include file = "../../views/end.jsp"%> <!-- </body> -->