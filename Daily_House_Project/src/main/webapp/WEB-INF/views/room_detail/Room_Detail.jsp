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

// 예약 창 이동
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
	var rDate2 = [];
	var room_num = ${roomDto.room_num};
	var url = "/datepicker/start/"+room_num;
	$.get(url, function(rDate){
    	console.log("get");
    	console.log("rDate:", rDate);
    	rDate2 = rDate;
    	
    	console.log("rDate2:", rDate2);
    	console.log("get2");
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
        var room_num = ${roomDto.room_num};
        var url = "/datepicker/end/"+room_num+"/"+date;
        $.get(url, function(rDate){
        	console.log(rDate);
        	$("#endDate").datepicker("setEndDate", rDate);
        });
        //setEndDate값 받아오기 끝
        
        $("input[name=str_start_date]").val(date);

        $("#endDate").datepicker("setStartDate", newDate); //이것 처럼 setEndDate값을 넘겨 줘야 됨
        $(this).hide();
        $('#endDate').show().datepicker("show");
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
		$('#startDate').show();
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

<%@ include file = "../../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->
<form id="frmPage" action="/boo/detail" method="get">
	<input type="hidden" name="room_num" value="${roomDto.room_num}">
	<input type="hidden" name="page" value="${reviewPagingDto.page}">
</form>
<!-- section -->
<!-- 이미지 뷰 -->
<div id="mainImg">
<section class="home-slider js-fullheight owl-carousel">
      <div class="slider-item js-fullheight" style="background-image:url(/islagrande/images/bg_3.jpg);">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row slider-text justify-content-center align-items-center">

            <div class="col-md-7 col-sm-12 text-center ftco-animate">
            	<h1 class="mb-3 mt-2 bread">Blog</h1>
	            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span class="mr-2"><a href="blog.html">Blog</a></span> <span>Blog Single</span></p>
            </div>

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
<!--          	 방의 기본정보 -->
         	<table>
         		<tr>
         			<th colspan="3" class="padding"><h1 style="font-family: inherit;">${roomDto.room_title}</h1></th>
         			<th class="padding">
         			<h2>호스트 사진</h2>
         			<p>${roomDto.user_name}</p>
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
          	<h1>Room Option & Room Rule</h1>
			<div class="container">
	       		<div class="row">
	       			<c:forEach var="OptionCode" items="${OptionCode}" varStatus="status">
			        	<div class="col-md-4">
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
          	<p>${roomDto.room_explain}</p>
<!--           	방의 설명문 끝 -->
          	<hr>
          	<div>
          	<h2 style="font-family: inherit;">후기</h2>
          	
       		<c:forEach items="${reviewList}" var="RoomReviewVo">  			
   			<div class="block-21 mb-4 d-flex">
               <a class="blog-img mr-4" style="background-image: url(/islagrande/images/image_1.jpg);">${RommReviewVo.user_pic}사용자 사진</a>  
                <div class="text">
                 <table>
                  <tr>
                   <td width=500 style="word-break:break-all">
                    <h3 class="heading">${RoomReviewVo.room_review_text}</h3>
                   </td>
                  </tr>
                 </table>
                  <div class="meta">
                    <div><span class="icon-person"></span>${RoomReviewVo.user_email}</div>
                    <div><span class="icon-calendar"></span>${RoomReviewVo.room_review_write_date}</div>
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
			<label for="review_text">☆후기 쓰기★</label>
          	<div>
          		<form action="/boo/review" method="post">
          		<input type="hidden" name="room_num" value="${roomDto.room_num}">
          		<input type="hidden" name="user_email" value="${userVo.user_email}">
          		<input type="hidden" name="user_pic" value="${userVo.user_pic}">
				  <table>
				   <tr>
				    <td>지역</td>
				    <td>
				     <table>
				      <tr>
				       <td><input type="text" name="review_score_location" value="0" id="loc"  size='1' readonly><td>
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
				       <td><input type="text" name="review_score_cleanliness" value="0" id="cle"  size='1' readonly><td>
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
				       <td><input type="text" name="review_score_checkin" value="0" id="che"  size='1' readonly><td>
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
				       <td><input type="text" name="review_score_communication" value="0" id="com"  size='1' readonly><td>
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
          		<button type="submit" id="btnReview">작성완료</button>
          		
          		</form>
          	</div>
          	</c:if>
          	<hr>
<!-- 지도 api -->
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
	         	${startList}
	         	${endList}
	         		<div class="row">
						<div class="dropdown">
							<input type="button" value="체크인" class="btn btn-primary py-3 px-5" style="font-size:20px;" id= "startDate">
							<input type="button" value="체크아웃" class="btn btn-primary py-3 px-5" style="font-size:20px;display:none;" id= "endDate">
						</div>
					</div>
								<h3>Subcribe to our Newsletter</h3>
								<p>Far far away, behind the word mountains, far from the countries Vokalia</p>
	              <form action="#" class="subscribe-form">
	                <div class="form-group">
	                  <input type="text" class="form-control" placeholder="Email Address">
	                  <input type="submit" value="Subscribe" class="mt-2 btn btn-white submit">
	                </div>
	              </form>
	            </div>
            </div>
        </div>
<!-- 메뉴 좌측쪽 -->
        </div> 
      </div>
    </section>
<!-- 자유롭게 부분 -->

<!-- end section -->
<div id="footHeight">
<%@ include file = "../../views/casahotel/casahotel_footer.jsp" %>
</div>
<%@ include file = "../../views/casahotel/casahotel_script.jsp" %>
<%@ include file = "../../views/islagrande/islagrande_script.jsp" %>

<%@ include file = "../../views/end.jsp"%> <!-- </body> -->