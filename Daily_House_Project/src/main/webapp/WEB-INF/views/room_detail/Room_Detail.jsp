<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file = "../../views/title.jsp"%> <!-- <head> -->

<%@ include file = "../../views/casahotel/casahotel_link.jsp" %>
<%@ include file = "../../views/islagrande/islagrande_link.jsp" %>

<style>
.mousePointer {
	cursor : pointer
}
.page_link {
	cursor : pointer
}
.padding {
	padding-left: 20px;
	padding-right: 20px;
	padding-top: 5px;
	padding-bottom: 5px;
}
</style>

<script>
$(function() {
	// 현재 클릭된 메뉴를 활성화
	$(".nav-item:eq(0)").attr("class", "nav-item");
	$(".nav-item:eq(2)").attr("class", "nav-item active");
	
	//체크 아웃 된사람들의 리스트
	var checkOutUserList = "${checkOutUserList}";
	var List = checkOutUserList.substring(1, checkOutUserList.length - 1);
	
	var arrList = List.split(",");
	console.log("arrList : ",arrList);
	
	var user_email = "${userVo.user_email}";
	console.log("user_email : ",user_email);
	
	for (var v = 0; v < arrList.length; v++) {
		if (arrList[v].trim() == user_email) {
			console.log("success");
			$("#rev_write").show();
			break;
		}
	}
	
	//쪽지 보내기
	$("#send_message").click(function() {
		
		$("#receiver").val("${roomDto.user_email}");
		$("#sender").val("${userVo.user_email}");
		
		$("#frmMessage").submit();
	});
	
	//체크 인, 아웃
	function isCheckInOut() {
		var checks = $(".check");
		for (var i = 0; i < checks.length; i++) {
			var c = checks.eq(i).val();
			if (c == "" || c == "Check-In" || c == "Check-Out") {
				$("#reservation").val("날짜를 입력해주세요");
				return false;
			}
		}
		return true;
		
	}
	
	$("#reservation").click(function() {
		var result = isCheckInOut();
		console.log("result", result);
		if (result == true) {
			$("#reservation").val("예약 하기");
    		$("#reservation").addClass("mt-2 btn btn-white submit");
			$("#reservationForm").submit();
		}
	});
	
// 	별점 보여주기
	var rateAppend = "";
	var i = 0;
	for (i = 0; i < "${roomDto.room_score}"; i++) {
		rateAppend += "<span class='icon-star'></span>";
	}
	$("#rateCount").append(rateAppend);
	
// 	페이징 기능
	$(".page_link").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("data-page");
		$("input[name=page]").val(page);
		$("#frmPage").submit();
	});
	
});

// 예약 창 따라다니기
$(window).scroll(function() {
	var footHeight = $("#footHeight").outerHeight(true);
	var mainImg = $("#mainImg").outerHeight(true);
	var bodyHeight = $("body").outerHeight(true);
	var sideHeight = $("#sidebox").outerHeight(true);
	var ftcoHeight = $("#ftco-navbar").outerHeight(true);
	
	var v = bodyHeight - footHeight - sideHeight - ftcoHeight;
	
	var position = $(window).scrollTop();
	if (position < mainImg) {
		position = mainImg;
	}
	if (position > v) {
		position = v;
	}
	
	$("#sidebox").stop();
	$("#sidebox").animate({"top":position-mainImg});
	
});
</script>

<!-- 후기 작성시 필요한 버튼 -->
<script>
 	function locDown() {
 		var expense = $("#loc").val();
 		expense = (Number(expense)-1);
 		if ($("#loc").val() > 0) {
 			$("#loc").val(expense);
 		}
 	};
 	
 	function locUp() {
 		var expense = $("#loc").val();
 		expense = (Number(expense)+1);
 		if($("#loc").val() < 5) {
 			$("#loc").val(expense);
 		}
 	};
 	
 	function cleDown() {
 		var expense = $("#cle").val();
 		expense = (Number(expense)-1);
 		if ($("#cle").val() > 0) {
 			$("#cle").val(expense);
 		}
 	};
 	
 	function cleUp() {
 		var expense = $("#cle").val();
 		expense = (Number(expense)+1);
 		if($("#cle").val() < 5) {
 			$("#cle").val(expense);
 		}
 	};
 	
 	function cheDown() {
 		var expense = $("#che").val();
 		expense = (Number(expense)-1);
 		if ($("#che").val() > 0) {
 			$("#che").val(expense);
 		}
 	};
 	
 	function cheUp() {
 		var expense = $("#che").val();
 		expense = (Number(expense)+1);
 		if($("#che").val() < 5) {
 			$("#che").val(expense);
 		}
 	};
 	
 	function comDown() {
 		var expense = $("#com").val();
 		expense = (Number(expense)-1);
 		if ($("#com").val() > 0) {
 			$("#com").val(expense);
 		}
 	};
 	
 	function comUp() {
 		var expense = $("#com").val();
 		expense = (Number(expense)+1);
 		if($("#com").val() < 5) {
 			$("#com").val(expense);
 		}
 	};
</script>

<!-- check in,out -->
<script>
$(document).ready(function(){

	function setCheckInOutText(str) {
		$("#reservation").val(str + " 날짜 설정을 해주세요");
		$("#reservation").removeClass();
	}
	
	var rDate2 = [];
	var room_num = ${roomDto.room_num};
	var url = "/datepicker/start/"+room_num;
	$.get(url, function(rDate){
    	rDate2 = rDate;
    	checkIn();
    });
	
	function checkIn() {
// 	체크인
	$('#startDate').datepicker({
		format: "yyyy-mm-dd",
	    startDate: '1d',
	    autoclose : true,
	    datesDisabled : rDate2,	//'2020-02-18','2020-02-20'이런 형식
	    multidateSeparator :",",
	    templates : {
	        leftArrow: '&laquo;',
	        rightArrow: '&raquo;'
	    },
	    showWeekDays : true ,
	    title: "체크인 날짜 선택",
	    todayHighlight : true ,
	    toggleActive : true,
	    weekStart : 0 ,
	    language : "ko"
		    
	}).on("changeDate", function(e) {
		
		var date = formatDate(e.date);
		
		if(date == "NaN-NaN-NaN"){
			var now = new Date();
			var year= now.getFullYear();
			var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
			var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
			date = year + '-' + mon + '-' + day;
		}
		
		var arrDate = date.split("-");
		var intNewDay = parseInt(arrDate[2]) + 1;
		arrDate[2] = intNewDay.toString();
		var newDate = arrDate.join('-');
        console.log(date);
        
        //setEndDate값 받아오기
        var room_num = "${roomDto.room_num}";
        var url = "/datepicker/end/"+room_num+"/"+date;
        $.get(url, function(rDate){
        	console.log(rDate);
        	$("#endDate").datepicker("setEndDate", rDate);
        });
        //setEndDate값 받아오기 끝
        
        $("input[name=str_start_date]").val(date);
        $("#check_in").val(date);
        
        
        $("#endDate").datepicker("setStartDate", newDate); //이것 처럼 setEndDate값을 넘겨 줘야 됨
        
        if (e.dates.length == 1) {
        	setCheckInOutText("체크 아웃");
    		$('#endDate').datepicker("show");
    	}else if(e.dates.length == 0) {
    		setCheckInOutText("체크 인");
    	}
	});
	}
	//체크아웃
	$('#endDate').datepicker({
		format: "yyyy-mm-dd",
	    startDate: '1d',
	    autoclose : true,
	    datesDisabled : [],
	    multidateSeparator :",",
	    templates : {
	        leftArrow: '&laquo;',
	        rightArrow: '&raquo;'
	    },
	    showWeekDays : true ,
	    title: "체크아웃 날짜 선택",
	    todayHighlight : true ,
	    toggleActive : true,
	    weekStart : 0 ,
	    language : "ko"
		    
	}).on("changeDate", function(e) {
		var checkout = formatDate(e.date);
		console.log(checkout);
		$("input[name=str_end_date]").val(checkout);
		$("#check_out").val(checkout);
		if (e.dates.length == 1) {
			
			var room_num = "${roomDto.room_num}";
	        var url = "/datepicker/status/"+room_num;
	        $.get(url, function(rDate){
	        	var status = rDate.trim();
	        	if (status == "Y") {
	        		$("#reservation").val("예약 하기");
	        		$("#reservation").addClass("mt-2 btn btn-white submit");
	        	} else if (status == "N") {
	        		$("#reservation").val("비공개 설정된 방입니다");
	        		$("#reservation").removeClass();
	        	}
	        });
			
    	} else if (e.dates.length == 0) {
    		$("#reservation").val("체크아웃 날짜 설정을 해주세요");
    		$("#reservation").removeClass();
    	}
	});
	
	//날짜 포멧 함수
	function formatDate(date) { 
		var d = new Date(date),
	 	month = '' + (d.getMonth() + 1),
		day = '' + d.getDate(), 
		year = d.getFullYear(); 

		if (month.length < 2) month = '0' + month; 
		if (day.length < 2) day = '0' + day; 

		return [year, month, day].join('-'); 
	}
});
</script>

<!-- 이미지 사진첩 -->
<script>
$(document).ready(function() {
	var index = 0;
	var pics = $("#roomPic > img");
	var len = pics.length;
	pics.eq(index).show();
	
	$("#btn_pic_prev").click(function() {
		pics.eq(index).hide();
		index--;
		if (index < 0) {
			index = len - 1;
		}
		pics.eq(index).show();
	});
	$("#btn_pic_next").click(function() {
		pics.eq(index).hide();
		index++;
		if (index > len-1) {
			index = 0;
		}
		pics.eq(index).show();
	});
});
</script>

<!-- 찜 하기 기능 -->
<script>
$(document).ready(function() {
// 	//찜 Y,N 판별
	var userVo = "${userVo.user_email}";
	console.log("userVo:---" + userVo + "---");
	if (userVo != "") {
		var room_num = "${roomDto.room_num}";
		var url = "/datepicker/like/"+room_num;
		$.get(url, function(rDate){
			var result = rDate.trim();
			if (result == "Y") {
				$("#btn_like").attr("style", "font-size: 40px; color: gray;");
			}else if (result == "N") {
				$("#btn_like").attr("style", "font-size: 40px; color: #fb929e;");
			}
		});
	}
	
	$("#btn_like").click(function() {
		var room_num = "${roomDto.room_num}";
		var url = "/datepicker/like/"+room_num;
		$.get(url, function(rDate){
			var result = rDate.trim();
			console.log(result);
			if (result == "Y") {
				$("#btn_like").attr("style", "font-size: 40px; color: #fb929e;");
				var url2 = "/datepicker/insertLike/"+room_num;
				$.get(url2, function(rDate){
					console.log(rDate);
				});
				
			}else if (result == "N") {
				$("#btn_like").attr("style", "font-size: 40px; color: gray;");
				var url3 = "/datepicker/deleteLike/"+room_num;
				$.get(url3, function(rDate){
					console.log(rDate);
				});
			}
		});
	});
});
</script>

<%@ include file = "../../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->


<form id="frmPage" action="/boo/detail" method="get">
	<input type="hidden" name="room_num" value="${roomDto.room_num}">
	<input type="hidden" name="page" value="${reviewPagingDto.page}">
</form>

<form id="frmMessage" action="/boo/sendMessage" method="post">
	<input type="hidden" name="receiver" id="receiver">
	<input type="hidden" name="sender" id="sender">
	<input type="hidden" name="room_num" value="${roomDto.room_num}">
</form>
<!-- section -->
<!-- 이미지 뷰 -->
<div id="mainImg">
	<header class="site-header">
	<br>
      <div class="container-fluid">
        <div class="row">
          <div class="col-4 site-logo" data-aos="fade"></div>
          <div class="col-8">

			<!-- 버튼 모양 -->
            <div class="site-menu-toggle js-site-menu-toggle"  data-aos="fade">
              <span></span>
              <span><br><img src="/images/picture1.png" width="50px"></span>
              <span></span>
            </div>

            <!-- 화면 전환이 되면서 흰색 배경이 됨  -->
            <div class="site-navbar js-site-navbar">
              <nav role="navigation">
                <div class="container">
                  <div class="row full-height align-items-center">
                  
                      <!-- 사진 넣는 부분 -->
                      <div id="roomPic">
	                      <c:forEach items="${roomPicInfoList}" var="RoomPictureVo">
							<img src="/si/displayFile?fileName=/${RoomPictureVo.pic_uri}" width="100%" style="display: none;">
						  </c:forEach>
						  <button id="btn_pic_prev" class="btn btn-primary py-3 px-5">&lt;</button>
						  <button id="btn_pic_next" class="btn btn-primary py-3 px-5">&gt;</button>
					  </div>
					  
                  </div>
                </div>
              </nav>
            </div>
          </div>
        </div>
      </div>
    </header>

    <section class="site-hero inner-page overlay" style="background-image: url(/casahotel/img/slider-4.jpg)" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center text-center">
          <div class="col-md-10 text-center" data-aos="fade-up">
          </div>
        </div>
      </div>
    </section>	
    
</div>
<!-- /이미지 뷰 -->
<section class="ftco-section">
      <div class="container">
        <div class="row">
<!-- 내용 센터쪽 -->
          <div class="col-lg-8 ftco-animate">
<!--           test -->


<!--           test -->
          
<!--          	 방의 기본정보 -->
         	<table>
         		<tr>
         			<th colspan="3" class="padding"><h1 style="font-family: inherit;">${roomDto.room_title}</h1></th>
         			<th class="padding">
         			<table style="width: 100%;">
         				<tr>
         					<th>
         						<nav class="navbar navbar-expand-lg navbar-light bg-light" style="margin: 0px; padding: 0px;">
									<ul class="navbar-nav ml-md-auto">
										<li class="nav-item dropdown">
											 <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown">
											 	<c:choose>
							   						<c:when test="${roomDto.user_pic == null}">
							   							<img src="/images/profile/user.jpg" height="50">
							   						</c:when>
							   						<c:otherwise>
							               				<img src="/si/displayFile?fileName=/${roomDto.user_pic}" height="50">  
							   						</c:otherwise>
							   					</c:choose>
											 </a>
											 <c:if test="${roomDto.user_email != userVo.user_email}">
												<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
													<span id="send_message" class="dropdown-item mousePointer" style="font-size: 15px;">쪽지 보내기</span> 
												</div>
											 </c:if>
										</li>
									</ul>
								</nav>
         					</th>
         					<th>
         						<c:if test="${not empty userVo}">
			         				<input type="button" id="btn_like" value="♥" class="mt-2 btn btn-white" style="font-size: 40px; color: #fb929e; ">
			         			</c:if>
         					</th>
         				</tr>
         			</table>
         				<p class="text-center">${roomDto.user_name}</p>
         			</th>
         		</tr>
         		<tr>
         			<td colspan="4">
         			<div class="meta">
         				<div><span class="icon-person"></span>${roomDto.user_email}</div>
         			</div>
         			</td>
         		</tr>
         		<tr>
         			<th>
         				<table>
         					<tr>
         						<td width=50 style="word-break:break-all"><div class="text pt-4 pl-lg-5"><p id="rateCount" class="rate"></p></div></td>
         						<td width=150 style="word-break:break-all"><p>${roomDto.room_score}점</p></td>
         					</tr>
         				</table>
         			</th>
         			<th class="padding">
         				<table>
         					<tr>
         						<td width=50 style="word-break:break-all"><img alt="people" src="/images/peoples.png" width="37px"></td>
         						<td width=150 style="word-break:break-all"><p>인원 ${roomDto.room_people}명</p></td>
         					</tr>
         				</table>
         			</th>
         			<td class="padding">
         				<table>
         					<tr>
         						<td width=50 style="word-break:break-all"><img alt="people" src="/images/bed.png" width="30px"></td>
         						<td width=150 style="word-break:break-all"><p>침대 수 : ${roomDto.room_bed}</p></td>
         					</tr>
         				</table>
         			</td>
         			<td class="padding">
         				<table>
         					<tr>
         						<td width=50 style="word-break:break-all"><img alt="people" src="/images/restroom.png" width="35px"></td>
         						<td width=150 style="word-break:break-all"><p>화장실 수 : ${roomDto.room_bathroom}</p></td>
         					</tr>
         				</table>
         			</td>
         		</tr>
         	</table>
<!--          	방의 기본정보 끝 -->
         	<hr>
<!--          	방의 옵션 정보 보여주기 -->
          	<h2 style="font-family: inherit; font-weight: bold;">편의시설</h2>
			<div class="container">
	       		<div class="row">
	       			<c:forEach var="OptionCode" items="${OptionCode}" varStatus="status">
			        	<div class="col-md-6">
			        		<div class="room-wrap ftco-animate">
			        			<img src="/images/${OptionCode}.png"  width="35px">
          						${OptionList[status.index]}
			        		</div>
			        	</div>
	        		</c:forEach>
	        	</div>
			</div>
<!--           		방의 옵션 정보 보여주기 끝 -->
          	<hr>
<!--           	방의 설명문 -->
			<h2 style="font-family: inherit; font-weight: bold;">숙소</h2>
          	<p>${roomDto.room_explain}</p>
<!--           	방의 설명문 끝 -->
          	<hr>
          	<div>
          	<h2 style="font-family: inherit; font-weight: bold;">후기</h2>
          	
       		<c:forEach items="${reviewList}" var="RoomReviewDto">  			
   			<div class="block-21 mb-4 d-flex">
   				<c:choose>
   					<c:when test="${RoomReviewDto.user_pic == null}">
   						<img src="/images/profile/user.jpg" height="50">
   					</c:when>
   					<c:otherwise>
               			<img src="/si/displayFile?fileName=/${RoomReviewDto.user_pic}" height="50">  
   					</c:otherwise>
   				</c:choose>
                <div class="text">
                 <table>
                  <tr>
                   <td width=500 style="word-break:break-all">
                    <h3 class="heading">${RoomReviewDto.room_review_text}</h3>
                   </td>
                  </tr>
                 </table>
                  <div class="meta">
                    <div><span class="icon-person"></span>${RoomReviewDto.user_name}</div>
                    <div><span class="icon-calendar"></span>${RoomReviewDto.room_review_write_date}</div>
                    <hr>
                  </div>
                </div>
             </div>
       		</c:forEach>
       		
       		<div class="col text-center">
				<div class="block-27">
					<ul>
					<c:if test="${reviewPagingDto.hasPrev == true}">
								<li>
									<a class="page_link" data-page="${reviewPagingDto.startPage - 1}">&lt;</a>
								</li>
							</c:if>
							<c:forEach begin="${reviewPagingDto.startPage}" end="${reviewPagingDto.endPage}" var="v">
								<li 
									<c:choose>
										<c:when test="${reviewPagingDto.page == v}">
											class="active"
										</c:when>
										<c:otherwise>
											class=""
										</c:otherwise>
									</c:choose>
								>
									<a class="page_link" data-page="${v}">${v}</a>
								</li>
							</c:forEach>
							<c:if test="${reviewPagingDto.hasNext == true}">
								<li>
									<a class="page_link" data-page="${reviewPagingDto.endPage + 1}">&gt;</a>
								</li>
							</c:if>
					</ul>
				</div>
          	</div>
<!-- 후기 작성란 구역 -->
			<c:if test="${not empty userVo}">
          	<div id="rev_write" style="display: none;">
          		<form action="/boo/review" method="post">
          		<input type="hidden" name="room_num" value="${roomDto.room_num}">
          		<input type="hidden" name="user_email" value="${userVo.user_email}">
          		<input type="hidden" name="user_pic" value="${userVo.user_pic}">
				  <table style="width: 100%;">
				   <tr>
				    <td>지역</td>
				    <td>
				     <table>
				      <tr>
				       <td><input type="text" name="review_score_location" value="5" id="loc"  size='1' readonly><td>
				       <td>
				        <a class="mousePointer" onclick="locUp()">▲</a><br>
				       	<a class="mousePointer" onclick="locDown()">▼</a>
				       </td>
				      </tr>
				     </table>
				    </td>
				    <td>청결</td>
				    <td>
				     <table>
				      <tr>
				       <td><input type="text" name="review_score_cleanliness" value="5" id="cle"  size='1' readonly><td>
				       <td>
				        <a class="mousePointer" onclick="cleUp()">▲</a><br>
				       	<a class="mousePointer" onclick="cleDown()">▼</a>
				       </td>
				      </tr>
				     </table>
				    </td>
				    <td>체크인</td>
				    <td>
				     <table>
				      <tr>
				       <td><input type="text" name="review_score_checkin" value="5" id="che"  size='1' readonly><td>
				       <td>
				        <a class="mousePointer" onclick="cheUp()">▲</a><br>
				       	<a class="mousePointer" onclick="cheDown()">▼</a>
				       </td>
				      </tr>
				     </table>
				    </td>
				    <td>친절함</td>
				    <td>
				     <table>
				      <tr>
				       <td><input type="text" name="review_score_communication" value="5" id="com"  size='1' readonly><td>
				       <td>
				        <a class="mousePointer" onclick="comUp()">▲</a><br>
				       	<a class="mousePointer" onclick="comDown()">▼</a>
				       </td>
				      </tr>
				     </table>
				    </td>
				   </tr>
				  </table>
				
          		<textarea id="review_text" name="room_review_text" rows="5" cols="100" placeholder="200자 이내로 써주세요"></textarea>
          		<div class="container-fluid">
					<div class="row">
						<div class="col-md-9">
						</div>
						<div class="col-md-3">
							<button type="submit" id="btnReview" class="btn btn-primary py-3 px-5"><span style="font-size: 18px;">작성완료</span></button>
						</div>
					</div>
				</div>
          		</form>
          	</div>
          	
          	</c:if>
          	<hr>
<!-- 지도 api -->
			<h2 style="font-family: 맑은 고딕; font-weight: bold;">위치</h2>
			<h3 style="font-family: inherit;">주소 : ${roomDto.room_location} ${roomDto.room_location_detail}</h3>
          	<div id="map1" style="width:100%;height:350px;"></div>								
				<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=cb28eeac595843b6872c9756479d8624&libraries=services,clusterer65"></script>								
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script>								
				<script>								
					var mapContainer = document.getElementById('map1'), // 지도를 표시할 div								
					mapOption = {								
					center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표								
					level: 3 // 지도의 확대 레벨								
					};								
									
					// 지도를 생성								
					var map = new kakao.maps.Map(mapContainer, mapOption);								
										
					// 주소-좌표 변환 객체를 생성								
					var geocoder = new kakao.maps.services.Geocoder();								
										
					// 주소로 좌표를 검색 -> 호스트 DB 참조								
					geocoder.addressSearch('"${roomDto.room_location}"', function(result, status) {								
										
					// 정상적으로 검색이 완료됐으면								
					if (status === kakao.maps.services.Status.OK) {								
										
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);								
										
					// 결과값으로 받은 위치를 마커로 표시
					var marker = new kakao.maps.Marker({
					map: map,								
					position: coords								
					});								
										
					// 인포윈도우로 장소에 대한 설명을 표시 -> 호스트 DB 참조								
					var infowindow = new kakao.maps.InfoWindow({								
					content: '<div style="width:150px;text-align:center;padding:6px 0;">${roomDto.room_location_detail}</div>'								
					});								
					infowindow.open(map, marker);
					
					// 지도의 중심을 결과값으로 받은 위치로 이동
					map.setCenter(coords);
					}
					});
				</script>
          	</div>
          </div>
<!-- /내용 센터쪽 -->

<!-- 메뉴 좌측쪽 -->
        <div class="col-lg-4 sidebar ftco-animate">
        	<div id="sidebox" style="position: absolute;">
	         	<div class="sidebar-box subs-wrap">
	         		
	         		<label for="startDate" style="font-size: 18px; font-family: 맑은 고딕;">예약 가능한 날을 확인해 보세요</label>
	         		<div class="row">
						<input type="text" value="Check-In" class="form-control check" style="font-size:20px; margin: 15px;" id= "startDate">
						<input type="text" value="Check-Out" class="form-control check" style="font-size:20px; margin: 15px;" id= "endDate">
					</div>
<!-- 								<h3>Subcribe to our Newsletter</h3> -->
<!-- 								<p>Far far away, behind the word mountains, far from the countries Vokalia</p> -->
	             <form id="reservationForm" action=
	             <c:choose>
	             	<c:when test="${not empty userVo}">"/yo/reservation"</c:when>
	             	<c:otherwise>"/si/loginHost"</c:otherwise>
	             </c:choose>
	              class="subscribe-form" method="get">
	                <div class="form-group">
<!-- 	                  <input type="text" class="form-control" placeholder="Email Address"> -->
					  <input type="hidden" name="room_num" value="${roomDto.room_num}">
	         		  <input type="hidden" name ="check_in" id="check_in">
	         		  <input type="hidden" name ="check_out" id="check_out">
	         		  <input type="hidden" name="user_email" value="${roomDto.user_email}">
	         		  <input type="hidden" name="room_location" value="${roomDto.room_location}">
	         		  <input type="hidden" name="room_title" value="${roomDto.room_title}">
	         		  <input type="hidden" name="room_price" value="${roomDto.room_price}">
	         		  <input type="hidden" name="room_people" value="${roomDto.room_people}">
	                  <input type="button" id="reservation" value="날짜를 선택해주세요" style="font-weight: bold; font-size: 20px;">
	                </div>
	              </form>
	            </div>
            </div>
        </div>
<!-- 메뉴 좌측쪽 -->
        </div> 
      </div>
    </section>

<!-- end section -->
<div id="footHeight">
<%@ include file = "../../views/casahotel/casahotel_footer.jsp" %>
</div>
<%@ include file = "../../views/casahotel/casahotel_script.jsp" %>
<%@ include file = "../../views/islagrande/islagrande_script.jsp" %>

<%@ include file = "../../views/end.jsp"%> <!-- </body> -->