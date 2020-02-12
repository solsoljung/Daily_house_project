<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ include file = "../../views/title.jsp"%> <!-- <head> -->

<%@ include file = "../../views/casahotel/casahotel_link.jsp" %>
<%@ include file = "../../views/islagrande/islagrande_link.jsp" %>

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
          	<h5>기본적인 방의 구성요소</h5>
          	<h5>인원 수 : ${roomDto.room_people}</h5>
          	<h5>침대 수 : ${roomDto.room_bed}</h5>
          	<h5>화장실 수 : ${roomDto.room_bathroom}</h5>
          	<h4>방에 대한 설명문</h4>
          	<h4>: ${roomDto.room_explain}</h4>
          	<hr>
          	<h1>방에 대한 옵션(아 좆댐..)</h1>
          	<hr>
          	<h1>후기 테이블 부분</h1>
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
         	<div>
         	<!-- 달력 api -->
			
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