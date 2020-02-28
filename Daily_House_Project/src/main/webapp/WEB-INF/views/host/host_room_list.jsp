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
	// msg
	var msg = "${msg}";
	if (msg == "room_delete_success") {
		alert("삭제 되었습니다.");
	}
	
	// 현재 클릭된 메뉴를 활성화
	$(".nav-item:eq(0)").attr("class", "nav-item");

	$("#btnAddRoom").click(function(){
		location.href = "/cy/registerHost1";
	});
	
	$(".room_title_a").on("click", function(){
		var that = $(this);
		var room_num = that.attr("data-room-num");
		console.log("room_num: " + room_num);
		location.href = "/cy/HostRoomDetail?room_num=" + room_num;
	});
	
	//페이징
	$(".classPage").click(function(e) {
		e.preventDefault(); 
		var page = $(this).attr("data-page");
		$("input[name=page]").val(page);
		$("#frmPage").submit();
	});
	
});
</script>

<form id="frmPage" action="/cy/HostRoomList" method="get">
	<input type="hidden" name="room_num" />
	<input type="hidden" name="page" value="${cyPagingDto.page}"/>
</form>

<!-- host_register_page1 START -->
<br><br><br><br>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10"><br><br>
			<div class="row">
				<div class="col-md-8">
					<label class="lblTitle1">${hostVo.user_name}님이 등록한 숙소들입니다.</label>
				</div>
				<div class="col-md-4" align="right">
					<button type="button" class="btn btn-primary  py-3 px-5" id="btnAddRoom" style="font-size:15px;" >숙소 추가하기</button>
				</div>
			</div><br><br>
			
	<!-- table START -->
		<div class="row" align="center">
		<table class="table" id="tbl_room">
			<thead align="center">
				<tr align="center">
					<th> </th>
					<th>숙소 위치</th>
					<th>이름</th>
					<th>건물 형식</th>
					<th>가격</th>
					<th>공개여부</th>
<!-- 					<th>REMOVE</th> -->
				</tr>
			</thead>
				
			<tbody align="center">
				<c:forEach items="${list}" var="RoomDetailDto">
				<tr align="center">
					<td>${RoomDetailDto.room_num}</td>
					<td>${RoomDetailDto.room_location}</td>
					<td><a href="#" class="room_title_a" data-room-num="${RoomDetailDto.room_num}">${RoomDetailDto.room_title}</a></td>
					<td>${RoomDetailDto.room_type_explain}</td>
					<td>${RoomDetailDto.room_price}</td>
					<c:choose>
						<c:when test="${RoomDetailDto.room_status eq 'Y'}"><td>O</td></c:when>
						<c:otherwise><td>X</td></c:otherwise>
					</c:choose>
<!-- 					<td align="center"><a href="#" class="remove_img" > -->
<!-- 						<img alt="remove" src="../../islagrande/images/remove.png" width="30" height="30" /> -->
<!-- 						</a></td> -->
				</tr>
				</c:forEach>
			</tbody>	
		</table>
		</div>
	<!-- table END -->	
	
<!-- 페이징 -->
<div class="row mt-5">
	<div class="col text-center">
		 <div class="block-27">
				<ul>
					<c:if test="${cyPagingDto.hasPrev == true}">
					<li>
						<a class="classPage" data-page="${cyPagingDto.startPage - 1}" style="cursor:pointer">&lt;</a>
					</li>
					</c:if>
					<c:forEach begin="${cyPagingDto.startPage}" end="${cyPagingDto.endPage}" var="v">
						<li 
							<c:choose>
								<c:when test="${cyPagingDto.page == v}">
									class="active"
								</c:when>
								<c:otherwise>
									class=""
								</c:otherwise>
							</c:choose>
						>
							<a class="classPage" data-page="${v}" style="cursor:pointer">${v}</a>
						</li>
					</c:forEach>
					<c:if test="${cyPagingDto.hasNext == true}">
						<li>
							<a class="classPage" data-page="${cyPagingDto.endPage + 1}" style="cursor:pointer">&gt;</a>
						</li>
					</c:if>
			</ul>
		</div>
	</div>
</div>
<!-- 페이징 끝 -->	
	
		
	</div>
			
	<div class="col-md-1"></div>
	</div>
</div><br><br><br>
<!-- host_register_page1 END -->

<%@ include file = "../../views/casahotel/casahotel_footer.jsp" %>			

<%@ include file = "../../views/casahotel/casahotel_script2.jsp" %>			
<%@ include file = "../../views/islagrande/islagrande_script2.jsp" %>	

<%@ include file = "../../views/end.jsp"%> <!-- </body> -->