<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file = "../../views/title2.jsp"%> <!-- <head> -->					
					
<%@ include file = "../../views/casahotel/casahotel_link2.jsp" %>					
<%@ include file = "../../views/islagrande/islagrande_link.jsp" %>					
					
<%@ include file = "../../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->

<!-- reservation page section -->
<style>
.heartDiv {
	margin-left: 210px;
	font-size: 40px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	
	// 좋아요 해제하기(삭제) ajax 이용
	$(".heartDiv").click(function(e) {
		e.preventDefault();
		console.log("댓글 삭제 버튼");
		var like_num = $(this).attr("data-like_num");
		var url = "/yo/like_delete/" + like_num;
		/* $.get(url, function(rData) {
			console.log(rData);
		}); */
		var that = $(this);
		console.log("that:" , that);
		$.ajax({
			"type" : "delete",
			"url" : url,
			"headers" : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "delete"
			},
			"success" : function(rData) {
				console.log("rData:" + rData);
// 				likeList();
				var p = that.parent().parent().parent();
				console.log(p);
				p.fadeOut('1000');
			}
		}); // ajax
	});	// 삭제버튼
	
	
	//상세 페이지로 이동
	$(".room_title").click(function(e) {
		e.preventDefault();
		var room_num = $(this).attr("data-num");
		console.log(room_num);
		$("input[name=room_num]").val(room_num);
		$("#frmPage").submit();
	});

});
</script>
<section class="site-hero inner-page overlay" style="background-image: url(/casahotel/img/slider-6.jpg)" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center text-center">
          <div class="col-md-10 text-center" data-aos="fade-up">
            <h1>
            	<span class="heading">
            		Like List
            	</span>
            </h1>
            <h2>
            	<span style="font-size: 1em; color: white; font-family: 고딕;">
            		찜목록
            	</span>
            </h2>
          </div>
        </div>
      </div>
      <a class="mouse smoothscroll" href="#next">
        <div class="mouse-icon">
          <span class="mouse-wheel"></span>
        </div>
      </a>
</section>
<section>
	<div class="container">
		<div class="row">
          <div class="col-md-7" data-aos="fade-up" data-aos-delay="100">
          	<div class="row">
                <div class="col-md-6 form-group">
                </div>
            </div>
          </div>
        </div>
	</div>
</section>
<section>



<div class="container">
<div class="row">
${likeDto}
	<c:forEach items="${likeList}" var="LikeDto">
	<div class="col-md-3">	
	<div class="row mb-5">
	</div>
		<div class="room-wrap ftco-animate" id="likeList">
				${likeDto.room_num}
				<a href="/boo/detail?room_num=${LikeDto.room_num}" class="img" style="background-image: url(/si/displayFile?fileName=/${LikeDto.pic_uri});">
					<span class="heartDiv" data-like_num="${LikeDto.like_num}">♥</span>
				</a>
				<div class="text pt-4 pl-lg-5">
				<h2><span data-num="${LikeDto.room_num}" class="room_title">${LikeDto.room_title}</span></h2>
				<p class="d-flex price-details align-items-center pt-3">
					<span class="price">￦${LikeDto.room_price}<small>&nbsp;/&nbsp;&nbsp;&nbsp;1박</small></span>
				</p>
			</div>
		</div>
	</div>
	</c:forEach>
</div>
</div>
</section>

<!-- end section -->

<%@ include file = "../../views/casahotel/casahotel_footer.jsp" %>				
				
<%@ include file = "../../views/casahotel/casahotel_script2.jsp" %>				
<%@ include file = "../../views/islagrande/islagrande_script2.jsp" %>				
				
<%@ include file = "../../views/end.jsp"%> <!-- </body> -->			