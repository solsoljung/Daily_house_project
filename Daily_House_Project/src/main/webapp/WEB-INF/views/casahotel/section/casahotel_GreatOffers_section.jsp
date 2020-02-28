<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section class="section bg-light">

<script>
$(function(){
	console.log("lblDH font-size 30");
// 	$("#lblDH").css("font-size", 30);
});
</script>


<!-- 여기는 Daily House 소개부터 추천 숙박소 보이는곳 -->
      <div class="container">
        <div class="row justify-content-center text-center mb-5">
          <div class="col-md-8">
            <h2 class="heading" data-aos="fade-up">Daily House 소개</h2> 
            <p class="lead" data-aos="fade-up" style="font-size:20px;" id="lblDH">Daily House은 다른 곳에서는 찾을 수 없는 독특하고 멋진 숙소와 즐길 거리를 제공하는 세계 최대 규모의 마켓플레이스로, 현지 호스트가 운영하는 많은 숙소와 많고 다양한 체험을 제공합니다. Daily House은 수백만 명의 호스트가 남는 공간과 좋아하는 일을 이용해 수익을 창출함으로써 경제적 역량을 발휘할 수 있도록 도와주며, 관광의 경제적 혜택이 지역사회에 골고루 돌아가는 데 기여합니다. 지금까지 많은 게스트를 맞이한 Daily House은 전국 사람들의 교류 및 커뮤니티와 신뢰 구축에 기여하고 있습니다.</p>
          </div>
        </div>
      	<br>
        <div class="site-block-half d-flex bg-white" data-aos="fade-up" data-aos-delay="100">
          <a href="#" class="image d-block bg-image" style="background-image: url('/casahotel/img/img_1.jpg');"></a>
          <div class="text">
            <span class="d-block"><span class="display-4 text-primary">숫자가격</span> / 1박 </span>
            <br>
            <p class="lead" style="font-size: 30px">제목</p>
            <p class="lead">가격</p>
            <p>내용</p>
            <p><a href="#" class="btn btn-primary text-white">지금 예약</a></p>
          </div>
        </div>
        <div class="site-block-half d-flex bg-white" data-aos="fade-up" data-aos-delay="200">
          <a href="#" class="image d-block bg-image order-2" style="background-image: url('/casahotel/img/img_2.jpg');"></a>
          <div class="text order-1">
          <span class="d-block"><span class="display-4 text-primary">숫자가격</span> / 1박 </span>
            <br>
            <p class="lead" style="font-size: 30px">제목</p>
            <p class="lead">가격</p>
            <p>내용</p>
            <p><a href="#" class="btn btn-primary text-white">지금 예약</a></p>
          </div>
        </div>

        <div class="row justify-content-center text-center mt-5" data-aos="fade-up" data-aos-delay="300">
          <div class="col-md-4"><p><a href="/sol/room" class="btn btn-primary text-white py-3 px-5">방 더보기</a></p></div>
        </div>
      </div>
    </section>