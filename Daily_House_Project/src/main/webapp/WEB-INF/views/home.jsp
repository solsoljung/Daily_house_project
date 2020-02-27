<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 데이터 피커 O -->
<%@ include file = "../views/title.jsp"%> <!-- <head> -->

<%@ include file = "../views/casahotel/casahotel_link.jsp" %>
<%@ include file = "../views/islagrande/islagrande_link.jsp" %>

<%@ include file = "../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->
<!-- 데이터 피커 O -->

<!-- section -->
<%@ include file = "../views/casahotel/section/casahotel_Main_section.jsp" %>
<%@ include file = "../views/casahotel/section/casahotel_CheckAvailabilty_section.jsp" %>

<!-- <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> -->
<script >
$(document).ready(function() {
	list = new Array();
	var moreNum1 = 3;
	var moreNum2 = 7;
	$("#btnMore").click(function(e) {
		$.get("/more", {"moreNum1" : moreNum1,
						"moreNum2" : moreNum2
			}, function(data) {
			list = data;
			var html = "";
			$.each(list, function(index) {
				
				html += "<div class='site-block-half d-flex bg-white' data-aos='fade-up' data-aos-delay='100'>";
	 			html += "<a href='/boo/detail?room_num="+this.room_num+"' class='image d-block bg-image' style='background-image: url(/si/displayFile?fileName=/"+this.pic_uri+"')></a>";
	 			html += "<div class='text'>";
	 			html += "<span class='d-block'><span class='display-4 text-primary'>"+this.room_price + "원</span>1박</span>";
	 			html += "<p class='lead' style='font-size: 30px'>" + this.room_title+"</p>";
	 			html += "<p class='lead'>" + this.room_explain + "</p>";
	 			html += "<span><a href='/boo/detail?room_num="+this.room_num+"' class='btn btn-primary text-white py-2 px-5' style='font-size: 12px'>지금 예약</a></span>";
	 			html += "</div>";
	 			html += "</div>";
			});
			$("#result").append(html);
			moreNum1 += 5;
			moreNum2 += 5;
		});
	});
	

});
</script>


<br>

<section class="section bg-light">
 <div class="container">
        <div class="row justify-content-center text-center mb-5">
          <div class="col-md-8">
            <h2 class="heading" data-aos="fade-up">Daily House 소개</h2>
            <br>
            <p class="lead" data-aos="fade-up">Daily House은 다른 곳에서는 찾을 수 없는 독특하고 멋진 숙소와 즐길 거리를 제공하는 세계 최대 규모의 마켓플레이스로, 현지 호스트가 운영하는 많은 숙소와 많고 다양한 체험을 제공합니다. Daily House은 수백만 명의 호스트가 남는 공간과 좋아하는 일을 이용해 수익을 창출함으로써 경제적 역량을 발휘할 수 있도록 도와주며, 관광의 경제적 혜택이 지역사회에 골고루 돌아가는 데 기여합니다. 지금까지 많은 게스트를 맞이한 Daily House은 전국 사람들의 교류 및 커뮤니티와 신뢰 구축에 기여하고 있습니다.</p>
          </div>
        </div>
        
<section class="ftco-section testimony-section">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate text-center">
          	<span class="subheading">T O D A Y</span>
            <p class="lead" style="font-size: 30px">최근 숙박 업소</p>
            <p>Daily House는 많은 숙박업소를 보여드립니다.</p>
          </div>
        </div>
      </div>
</section>
            
      	<c:forEach items="${listHome}" var="HomeHomesDto">
        <div class="site-block-half d-flex bg-white" data-aos="fade-up" data-aos-delay="100">
          <a href="/boo/detail?room_num=${HomeHomesDto.room_num}" class="image d-block bg-image" style="background-image: url(/si/displayFile?fileName=/${HomeHomesDto.pic_uri})"></a>
          <div class="text">
            <span class="d-block"><span class="display-4 text-primary">${HomeHomesDto.room_price}원</span> / 1박 </span>
            <p class="lead" style="font-size: 30px">${HomeHomesDto.room_title}</p>
            <p class="lead">${HomeHomesDto.room_explain}</p>
            <span><a href="/boo/detail?room_num=${HomeHomesDto.room_num}" class="btn btn-primary text-white py-2 px-5" style="font-size: 12px">지금 예약</a></span>
          </div>
        </div>
        </c:forEach>
        
            <div id="result">
			</div>
			
        <div class="row justify-content-center text-center mt-5" data-aos="fade-up" data-aos-delay="300">
          <button id="btnMore" class="btn btn-primary text-white py-3 px-5" style="font-size: 17px">방 더보기</button>
        </div>
      </div>
    </section>

<section class="ftco-section testimony-section">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate text-center">
          	<span class="subheading">T O D A Y</span>
            <p class="lead" style="font-size: 30px">최근 후기</p>
            <p>숙소에 직접 다녀간 게스트의 후기</p>
            
            
          </div>
        </div>
        <div class="row ftco-animate">
          <div class="col-md-12">
            <div class="carousel-testimony owl-carousel">
            <c:forEach items="${listReview}" var="HomeReviewDto">
              <div class="item">
                <div class="testimony-wrap p-4 pb-5 text-center">
                <c:choose>
				   	<c:when test="${null == HomeReviewDto.user_pic}">
				   	<div class="user-img mb-5" style="background-image: url(/images/profile/user.jpg)"></div>
				   	</c:when>
				   	<c:otherwise>
				   	<div class="user-img mb-5" style="background-image: url(/si/displayFile?fileName=/${HomeReviewDto.user_pic})"></div>
				   	</c:otherwise>
				</c:choose>
                    <span class="quote d-flex align-items-center justify-content-center">
                      <i class="icon-quote-left"></i>
                    </span>
                  </div>
                  <div class="text">
                    <p class="mb-5 pl-4 line">${HomeReviewDto.room_review_text}</p>
                    <p class="name">${HomeReviewDto.user_name}</p>
                    <br>
                    <span class="position">${HomeReviewDto.room_title}</span>
                  </div>
                </div>
            </c:forEach>
              </div>
            </div>
          </div>
        </div>
    </section>

<!-- end section -->
<!-- 데이터피커O -->

<%@ include file = "../views/casahotel/casahotel_footer.jsp" %>

<%@ include file = "../views/casahotel/casahotel_script.jsp" %>
<%@ include file = "../views/islagrande/islagrande_script.jsp" %>

<%@ include file = "../views/end.jsp"%> <!-- </body> -->

<!-- 데이터피커O -->
