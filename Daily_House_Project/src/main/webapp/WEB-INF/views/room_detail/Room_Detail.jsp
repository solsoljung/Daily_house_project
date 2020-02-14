<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file = "../../views/title.jsp"%> <!-- <head> -->

<%@ include file = "../../views/casahotel/casahotel_link.jsp" %>
<%@ include file = "../../views/islagrande/islagrande_link.jsp" %>

<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
<!-- datepicker -->

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


<script>
$(function() {
	
});
</script>

<style>
.mousePointer {
	cursor : pointer
}
</style>
 
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
         	 ${roomDto}
         	 
          	<h1>방에 대한 이름 : ${roomDto.room_title}</h1>
          	<h2>호스트 이름 : ${roomDto.user_name}</h2>
          	<h2>방 평점 : ${roomDto.room_score}</h2>
          	<h5>기본적인 방의 구성요소</h5>
          	<h5>인원 수 : ${roomDto.room_people}</h5>
          	<h5>침대 수 : ${roomDto.room_bed}</h5>
          	<h5>화장실 수 : ${roomDto.room_bathroom}</h5>
          	<h4>방에 대한 설명문</h4>
          	<h4>: ${roomDto.room_explain}</h4>
          	<hr>
          	<h1>방에 대한 옵션</h1>
          	<hr>
          	<div>
          	<h1>후기 테이블 부분</h1>
          	
          	<table>
          		<tr>
          			<th>리뷰 번호</th>
          			<th>사용자 이메일</th>
          			<th>방 번호</th>
          			<th>지역 점수</th>
          			<th>청결 점수</th>
          			<th>체크인 점수</th>
          			<th>의사소통 점수</th>
          			<th>총 점수</th>
          			<th>글 내용</th>
          		</tr>
          		<c:forEach items="${reviewList}" var="RoomReviewVo">
          		<tr>
          			<td>${RoomReviewVo.room_review_num}</td>
          			<td>${RoomReviewVo.user_email}</td>
          			<td>${RoomReviewVo.room_num}</td>
          			<td id="location" data-score="${RoomReviewVo.review_score_location}">${RoomReviewVo.review_score_location}</td>
          			<td id="clean" data-score="${RoomReviewVo.review_score_cleanliness}">${RoomReviewVo.review_score_cleanliness}</td>
          			<td id="checkin" data-score="${RoomReviewVo.review_score_checkin}">${RoomReviewVo.review_score_checkin}</td>
          			<td id="communication" data-score="${RoomReviewVo.review_score_communication}">${RoomReviewVo.review_score_communication}</td>
          			<td>${RoomReviewVo.total_score}</td>
          			<td>${RoomReviewVo.room_review_text}</td>
          		</tr>
          		</c:forEach>
          	</table>
          	</div>
          	<hr>
<!-- 후기 작성란 구역 -->
          	<div>
          		<form action="/boo/review" method="post">
          		<input type="hidden" name="room_num" value="${roomDto.room_num}">
          		<input type="hidden" name="user_email" value="${user_email}">
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
				
          		<label for="review_text">댓글내용</label>
          		<input type="text" id="review_text" name="room_review_text"/>
          		<button type="submit" id="btnReview">작성완료</button>
          		
          		</form>
          	</div>
          	
          	<hr>
          	<h1>간단한 room의 호스트에 대한 정보</h1>
          	<hr>
          	<!-- 지도 api -->
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
					content: '<div style="width:150px;text-align:center;padding:6px 0;">여기</div>'								
					});								
					infowindow.open(map, marker);
					
					// 지도의 중심을 결과값으로 받은 위치로 이동
					map.setCenter(coords);
					}
					});
				</script>
          	</div>
<!-- /내용 센터쪽 -->
<!-- 메뉴 좌측쪽 -->
          <div class="col-lg-4 sidebar ftco-animate">
         	<!-- 달력 api -->
         	<div>
			<h1>reservationForm</h1>
	오늘 날짜 : <span id="today"></span>
	<form>
	<input type="text" name="date" id="startDate" size="12" /> ~ 
	<input type="text" name="date" id="endDate" size="12" />
	<input type="button" value="예약" id="btn_reservation"/>
	
	</form>
			</div>
            <div class="sidebar-box">
              <form action="#" class="search-form">
                <div class="form-group">
                  <span class="icon icon-search"></span>
                  <input type="text" class="form-control" placeholder="Type a keyword and hit enter">
                </div>
              </form>
            </div>
            <div class="sidebar-box ftco-animate">
            	<h3>Categories</h3>
              <ul class="categories">
                <li><a href="#">Family Law <span>(6)</span></a></li>
                <li><a href="#">Criminal Law <span>(8)</span></a></li>
                <li><a href="#">Business Law <span>(2)</span></a></li>
                <li><a href="#">Insurance Law <span>(2)</span></a></li>
                <li><a href="#">Drug Control Law <span>(7)</span></a></li>
              </ul>
            </div>
            <div class="sidebar-box ftco-animate">
              <h3>Popular Articles</h3>
              <div class="block-21 mb-4 d-flex">
                <a class="blog-img mr-4" style="background-image: url(images/image_1.jpg);"></a>
                <div class="text">
                  <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                  <div class="meta">
                    <div><a href="#"><span class="icon-calendar"></span> Oct. 04, 2018</a></div>
                    <div><a href="#"><span class="icon-person"></span> Dave Lewis</a></div>
                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                  </div>
                </div>
              </div>
              <div class="block-21 mb-4 d-flex">
                <a class="blog-img mr-4" style="background-image: url(images/image_2.jpg);"></a>
                <div class="text">
                  <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                  <div class="meta">
                    <div><a href="#"><span class="icon-calendar"></span> Oct. 04, 2018</a></div>
                    <div><a href="#"><span class="icon-person"></span> Dave Lewis</a></div>
                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                  </div>
                </div>
              </div>
              <div class="block-21 mb-4 d-flex">
                <a class="blog-img mr-4" style="background-image: url(images/image_3.jpg);"></a>
                <div class="text">
                  <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                  <div class="meta">
                    <div><a href="#"><span class="icon-calendar"></span> Oct. 04, 2018</a></div>
                    <div><a href="#"><span class="icon-person"></span> Dave Lewis</a></div>
                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                  </div>
                </div>
              </div>
            </div>

            <div class="sidebar-box ftco-animate">
              <h3>Tag Cloud</h3>
              <ul class="tagcloud">
                <a href="#" class="tag-cloud-link">dish</a>
                <a href="#" class="tag-cloud-link">menu</a>
                <a href="#" class="tag-cloud-link">food</a>
                <a href="#" class="tag-cloud-link">sweet</a>
                <a href="#" class="tag-cloud-link">tasty</a>
                <a href="#" class="tag-cloud-link">delicious</a>
                <a href="#" class="tag-cloud-link">desserts</a>
                <a href="#" class="tag-cloud-link">drinks</a>
              </ul>
            </div>

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

            <div class="sidebar-box ftco-animate">
            	<h3>Archives</h3>
              <ul class="categories">
                <li><a href="#">September 2018 <span>(6)</span></a></li>
                <li><a href="#">August 2018 <span>(8)</span></a></li>
                <li><a href="#">July 2018 <span>(2)</span></a></li>
                <li><a href="#">June 2018 <span>(7)</span></a></li>
                <li><a href="#">May 2018 <span>(5)</span></a></li>
                <li><a href="#">April 2018 <span>(3)</span></a></li>
              </ul>
            </div>


            <div class="sidebar-box ftco-animate">
              <h3>Paragraph</h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus itaque, autem necessitatibus voluptate quod mollitia delectus aut, sunt placeat nam vero culpa sapiente consectetur similique, inventore eos fugit cupiditate numquam!</p>
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