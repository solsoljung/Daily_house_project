<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file = "../../views/title.jsp"%> <!-- <head> -->

<%@ include file = "../../views/casahotel/casahotel_link.jsp" %>
<%@ include file = "../../views/islagrande/islagrande_link.jsp" %>


<!-- 달력 api script -->
<script>
//datepicker START 
$.datepicker.setDefaults({  
	 dateFormat: 'yy-mm-dd', 	 //Input Display Format 변경
	 showOtherMonths: true, 	 //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	 showMonthAfterYear: true,   //년도 먼저 나오고, 뒤에 월 표시
	 
	 prevText: "이전달",
	 nextText: "다음달",
	 
	 changeYear: true, 			 //콤보박스에서 년 선택 가능
	 changeMonth: true, 		 //콤보박스에서 월 선택 가능        
	 
	 showOn: "both", 			 //both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시
	 buttonImage: "images/calendar.PNG",
	 buttonImageOnly: true, 	 //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
	 buttonText: "Select date",  //버튼에 마우스 갖다 댔을 때 표시되는 텍스트   
	 
	//달력의 년도 부분 뒤에 붙는 텍스트
	 yearSuffix: '년',  
	 
	//달력의 월 부분 Tooltip 텍스트
	 monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	//달력의 월 부분 텍스트
	 monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	 
	//달력의 요일 부분 Tooltip 텍스트
	 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],  
	//달력의 요일 부분 텍스트
	 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],  
	 
	 minDate: 0, 	 //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
     maxDate: "+2M"  //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
	 });  
//datepicker END

$(function(){
	//목록으로
	$("#btn_list").click(function(){
		location.href = "/test/board/listAll";
	});
	
	//https://m.blog.naver.com/PostView.nhn?blogId=javaking75&logNo=220546927730&proxyReferer=https%3A%2F%2Fwww.google.com%2F
	
	//오늘 날짜를 출력
    $("#today").text(new Date().toLocaleDateString());
	
	//입실, 퇴실을 위한 공간
	var startData = "";
	var endDate = "";
	
	$("#startDate").datepicker({
// 		minDate:0, //선택할수있는 최소날짜, (0 : 오늘 이전 날짜 선택 불가)
// 		startDate datepicker가 닫힐때
// 		종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
		onClose:function(selectedDate){
			$("#endDate").datepicker("option", "minDate", selectedDate);
			console.log("startDate: " + selectedDate);
		}  

	});
	$("#endDate").datepicker({
// 		endDate datepicker가 닫힐때
// 		시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정
		onClose:function(selectedDate){
			$("#startDate").datepicker("option","maxDate",selectedDate);  
			console.log("endDate: " + selectedDate);
		}  
	});
	
	//예약버튼 클릭
	$("#btn_reservation").click(function(){
		startDate = $("#startDate").val();
		endDate = $("#endDate").val();
		console.log("startDate: " + startDate);
		console.log("endDate: " + endDate);
	});
	
});
</script>

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

$(window).scroll(function() {
	console.log("작동됨");
	var position = $(window).scrollTop();
	if (position < 100) {
		position = 10;
	}
	$("#sidebox").stop();
	$("#sidebox").animate({"top":position});
});
</script>

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

<%@ include file = "../../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->
<form id="frmPage" action="/boo/detail" method="get">
	<input type="hidden" name="page" value="${reviewPagingDto.page}">
</form>
<!-- section -->
<!-- 이미지 뷰 -->
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
<!-- /이미지 뷰 -->
<!--  -->
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
         			<h2>${roomDto.user_name}</h2><p>${roomDto.user_phone}</p>
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

<%@ include file = "../../views/casahotel/casahotel_footer.jsp" %>

<%@ include file = "../../views/casahotel/casahotel_script.jsp" %>
<%@ include file = "../../views/islagrande/islagrande_script.jsp" %>

<%@ include file = "../../views/end.jsp"%> <!-- </body> -->