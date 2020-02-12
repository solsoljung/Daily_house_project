<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<%@ include file = "../../views/title.jsp"%> <!-- <head> -->

<%@ include file = "../../views/casahotel/casahotel_link.jsp" %>
<%@ include file = "../../views/islagrande/islagrande_link.jsp" %>

<%@ include file = "../../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->

<!-- section -->   
<br>
<br>
<br>
<br>

<section class="ftco-section ftco-room">
<div class="container">
<!-- 검색바 -->
    <div class="row">
    	<div class="col-md-12">
	        <div class="sidebar-box">
	              <form action="#" class="search-form">
	                <div class="form-group">
	                  <span class="icon icon-search"></span>
	                  <input type="text" class="form-control" placeholder="Type a keyword and hit enter" 
	                  style="font-size:30px;">
	                </div>
	              </form>
	        </div>
	    </div>
    </div>
<!-- 검색바 끝 -->

<!-- 선택 버튼 -->
<div class="row">
    <div class="col-md-12">
		<input type="button" value="날짜" class="btn btn-primary py-3 px-5" style="font-size:20px;">
		<input type="button" value="인원" class="btn btn-primary py-3 px-5" style="font-size:20px;">
		<input type="button" value="숙소 유형" class="btn btn-primary py-3 px-5" style="font-size:20px;">
		<input type="button" value="필터" class="btn btn-primary py-3 px-5" style="font-size:20px;">
	</div>
</div>
<br>
<!-- 선택 버튼 끝 -->

<!-- 모달창 -->
<div class="row">
        <div class="col-md-12">
            <div class="modal-box">
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary btn-lg show-modal" data-toggle="modal" data-target="#myModal">
                  view modal
                </button>
 
                <!-- Modal -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                            <div class="modal-body">
                                <div class="icon"><i class="fa fa-check"></i></div>
                                <h3 class="title">Woohoo! <br> Lorem ipsum dolor sit amet</h3>
                                <p class="description">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid commodi consequatur cumque </p>
                                <button class="subscribe">Subscribe</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-- 모달창 끝 -->
    
<!-- 방 리스트 -->
        <div class="row">
        <c:forEach var="vo" items="${list}">
        	<div class="col-md-3">
        		<div class="room-wrap ftco-animate">
        			<a href="room.html" class="img" style="background-image: url(/islagrande/images/room-1.jpg);"></a>
        			<div class="text pt-4 pl-lg-5">
        				<h2><a href="room.html">${vo.room_explain}</a></h2>
        				<p class="rate">
        					<span class="icon-star"></span>
        					<span class="icon-star"></span>
        					<span class="icon-star"></span>
        					<span class="icon-star"></span>
        					<span class="icon-star-half-full"></span>
        				</p>
        				<p class="d-flex price-details align-items-center pt-3">
        					<!-- <span>Starting From</span> -->
        					<span class="price">￦${vo.room_price}<small>&nbsp;/&nbsp;&nbsp;&nbsp;1박</small></span>
        				</p>
        				<p><a href="#" class="btn-customize">지금 예약하기</a></p>
        			</div>
        		</div>
        	</div>
        	</c:forEach>
        </div>
<!-- 방 리스트 끝 -->
			</div>
		</section>


<!-- end section -->

<%@ include file = "../../views/casahotel/casahotel_footer.jsp" %>

<%@ include file = "../../views/casahotel/casahotel_script.jsp" %>
<%@ include file = "../../views/islagrande/islagrande_script.jsp" %>

<%@ include file = "../../views/end.jsp"%> <!-- </body> -->