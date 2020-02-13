<link rel="stylesheet" href="/modal/modal.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<%@ include file = "../../views/title.jsp"%> <!-- <head> -->

<%@ include file = "../../views/casahotel/casahotel_link.jsp" %>
<%@ include file = "../../views/islagrande/islagrande_link.jsp" %>

<%@ include file = "../../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->
<style>

</style>
<script>
$(document).ready(function(){
	//페이징
	$(".solge").click(function(e) {
		e.preventDefault(); 
		var page = $(this).attr("data-page");
		$("input[name=page]").val(page);
		$("#frmPage").submit();
	});

	$(".room-title").click(function(e) {
		e.preventDefault();
		var room_num = $(this).attr("data-num");
		$("input[name=room_num]").val(room_num);
		$("#frmPage").attr("action", "/boo/detail");
		$("#frmPage").submit();
	});
});
</script>

<!-- section -->   
<br>
<br>

<section class="ftco-section ftco-room">
<div class="container">

<!-- 히든 폼 -->
<form id="frmPage" action="/sol/room" method="get">
	<input type="hidden" name="room_num" />
	<input type="hidden" name="page" value="${pagingDto.page}"/>
</form>
<!-- 히든 폼 끝 -->

<!-- 검색바 -->
    <div class="row">
    	<div class="col-md-12">
	        <div class="sidebar-box">
	              <form action="#" class="search-form">
	                <div class="form-group">
	                  <span class="icon icon-search"></span>
	                  <input type="text" class="form-control" placeholder="모든 위치" 
	                  style="font-size:30px;">
	                </div>
	              </form>
	        </div>
	    </div>
    </div>
<!-- 검색바 끝 -->

<!-- 모달창 -->
<div class="row">
        <div class="col-md-12">
            <div class="modal-box">
<!-- 선택버튼 -->
                <input type="button" value="날짜" class="btn btn-primary py-3 px-5" style="font-size:20px;" id= "btnTest" data-toggle="modal" data-target="#myModal">
				<input type="button" value="인원" class="btn btn-primary py-3 px-5" style="font-size:20px;">
				<input type="button" value="숙소 유형" class="btn btn-primary py-3 px-5" style="font-size:20px;">
				<input type="button" value="요금" class="btn btn-primary py-3 px-5" style="font-size:20px;">
				<input type="button" value="필터" class="btn btn-primary py-3 px-5" style="font-size:20px;">
<!-- 선택버튼 끝 -->
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
<br>
<br>
<!-- 방 리스트 -->
<div class="row">
        <c:forEach var="vo" items="${list}">
        	<div class="col-md-3">
        		<div class="room-wrap ftco-animate">
        			<a href="room.html" class="img" style="background-image: url(/islagrande/images/room-1.jpg);"></a>
        			<div class="text pt-4 pl-lg-5">
        				<h2><a data-num="${vo.room_num}" class="room-title">${vo.room_title}</a></h2>
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
<br>
${pagingDto}
<!-- 페이징 -->
<div class="row mt-5">
		          <div class="col text-center">
		            <div class="block-27">
			<ul>
			<c:if test="${pagingDto.hasPrev == true}">
						<li>
							<a class="solge" data-page="${pagingDto.startPage - 1}">&lt;</a>
						</li>
					</c:if>
					<c:forEach begin="${pagingDto.startPage}" end="${pagingDto.endPage}" var="v">
						<li 
							<c:choose>
								<c:when test="${pagingDto.page == v}">
									class="active"
								</c:when>
								<c:otherwise>
									class=""
								</c:otherwise>
							</c:choose>
						>
							<a class="solge" data-page="${v}">${v}</a>
						</li>
					</c:forEach>
					<c:if test="${pagingDto.hasNext == true}">
						<li>
							<a class="solge" data-page="${pagingDto.endPage + 1}">&gt;</a>
						</li>
					</c:if>
			</ul>
		</div>
	</div>
</div>
<!-- 페이징 끝 -->

</div>
</section>


<!-- end section -->

<%@ include file = "../../views/casahotel/casahotel_footer.jsp" %>

<%@ include file = "../../views/casahotel/casahotel_script.jsp" %>
<%@ include file = "../../views/islagrande/islagrande_script.jsp" %>

<%@ include file = "../../views/end.jsp"%> <!-- </body> -->