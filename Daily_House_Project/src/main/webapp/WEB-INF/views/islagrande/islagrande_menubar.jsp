<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
$(function() {
	$("#host_room_list").hide();
	
	// 호스트인지 아닌지 검사 후 숙소관리 띄우기
	var user_email = "${userVo.user_email}"

	var url = "/cy/isHost?user_email=" + user_email;
	$.get(url, function(rData) {
		if(rData > 0){
			$("#host_room_list").show();
		}
	});
	
	// 관리자인지 아닌지 검사 후 숙소관리 띄우기
});
</script>

 </head>
  <body>
	  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	    <a href="/" class="nav-link"><img class="navbar-brand" src="/islagrande/images/Daily House.png" width="200" height="106"></a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>
	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	        	<li class="nav-item active"><a href="/" class="nav-link">Home</a></li>
	        	<li class="nav-item"><a href="/yo/like_list" class="nav-link">찜목록</a></li>
	        	<li class="nav-item"><a href="/sol/room" class="nav-link">Rooms</a></li>
	        	<li class="nav-item"><a href="/si/about" class="nav-link">About</a></li>
	        	<li class="nav-item"><a href="/cy/help" class="nav-link">도움말</a></li>
	        	<li class="nav-item"><a href="/cy/registerHost1" class="nav-link">호스팅하기</a></li>
				  <c:choose>
				   	<c:when test="${empty userVo}">
					    <li class="nav-item"><a href="/si/loginHost" class="nav-link">로그인</a></li>
				   	</c:when>
				   	<c:otherwise> 
						<div class="dropdown" style="margin-top: 7px; margin-left: 15px;">
				   	<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" style="font-size:15px;">내정보</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						   		<li class="nav-item"><a href="/si/userInformation">${userVo.user_name}님&nbsp;&nbsp;&nbsp;
						   		<c:choose>
								   	<c:when test="${null == userVo.user_pic}">
				                 	 <img src="/images/profile/user.jpg" height="30">
								   	</c:when>
								   	<c:otherwise>
				                 	 <img src="/si/displayFile?fileName=/${userVo.user_pic}" height="30">
									</c:otherwise>
								 </c:choose>
						   		</a></li>
						   		<li class="nav-item" id="host_room_list"><a href="/cy/HostRoomList">숙소관리</a></li>
						   		<li class="nav-item" id="reservation_list"><a href="/yo/reservation_list">예약내역</a></li>
						   		<li class="nav-item" id="point_list"><a href="/boo/pointlist">포인트 이용 내역</a></li>
						   		<li class="nav-item"><a href="/si/logout">로그아웃</a></li>
				   		</div>
				   		</div>
				   	</c:otherwise>
				  </c:choose>
				  
				 <c:if test="${userVo.user_email eq 'admin@naver.com'}">
				 <div class="dropdown" style="margin-top: 7px; margin-left: 15px;">
				 <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton2" data-toggle="dropdown" style="font-size:15px;">관리자</button>
				 	<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						  <li class="nav-item" id="admin_room_list_n"><a href="/cy/AdminRoomListN">미승인 숙소</a></li>
						  <li class="nav-item" id="admin_room_list_n"><a href="/cy/AdminRoomListY">승인 숙소</a></li>
				   	</div>
				 </div>
				 </c:if>
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->