<link rel="stylesheet" href="/modal/modal.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 데이터 피커 O -->
<%@ include file = "../../views/title.jsp"%> <!-- <head> -->

<%@ include file = "../../views/casahotel/casahotel_link.jsp" %>
<%@ include file = "../../views/islagrande/islagrande_link.jsp" %>

<%@ include file = "../../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->
<!-- 데이터 피커 O -->
<style>
.sol-font{
	font-family: '맑은 고딕';
	color: #fb929e;
}
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

	//상세 페이지로 이동
	$(".room-title").click(function(e) {
		e.preventDefault();
		var room_num = $(this).attr("data-num");
		$("input[name=room_num]").val(room_num);
		$("#frmPage").attr("action", "/boo/detail");
		$("#frmPage").submit();
	});
	
	//검색
	$("#searchTarget").keyup(function(e){
		if(e.keyCode == 13){
			var keyword = $(this).val();
			console.log(keyword);
			$("input[name=keyword]").val(keyword);
			$("#frmPage").submit();
		}
	});
	
	//체크인
	$('#startDate').datepicker({
		format: "yyyy-mm-dd",
	    startDate: 'd',
	    autoclose : true,
	    datesDisabled : [],	//'2020-02-18','2020-02-20'이런 형식
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
		var arrDate = date.split("-");
		var intNewDay = parseInt(arrDate[2]) + 1;
		arrDate[2] = intNewDay.toString();
		var newDate = arrDate.join('-');
        $("#endDate").datepicker("setStartDate", newDate);
        console.log(date);
        $('#endDate').datepicker("show");
	});
	 
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
		
		var checkin = $('#startDate').val();
		var checkout = formatDate(e.date);
		console.log(checkin);
		console.log(checkout);

		$("input[name=str_start_date]").val(checkin);
		$("input[name=str_end_date]").val(checkout);
		$("#frmPage").submit();
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
	
	//test
	//$('[data-toggle="tooltip"]').tooltip();

});
</script>

<!-- section -->   

<section class="ftco-section ftco-room">
<!-- 테스트 <div class="container">
  <h3>Popover Example</h3>
  <ul class="list-inline">
    <li><a href="#" title="Header" data-toggle="popover" data-placement="top" data-content="Content">Top</a></li>
    <li><a href="#" title="Header" data-toggle="popover" data-placement="bottom" data-content="Content">Bottom</a></li>
    <li><a href="#" title="Header" data-toggle="popover" data-placement="left" data-content="Content">Left</a></li>
    <li><a href="#" title="Header" data-toggle="popover" data-placement="right" data-content="Content">Right</a></li>
  </ul>
</div> -->
<div class="container">

<!-- 달력테스트 -->
<div class="row">
    	<div class="col-md-6">
    		<input type="text" id="startDate" class="form-control">
    	</div>
    	<div class="col-md-6">
			<input type="text" id="endDate" class="form-control">
    	</div>
</div>
<!-- 달력테스트 끝 -->


<!-- 히든 폼 -->
<form id="frmPage" action="/sol/room" method="get">
	<input type="hidden" name="room_num" />
	<input type="hidden" name="page" value="${searchVo.page}"/>
	<input type="hidden" name="keyword" value="${searchVo.keyword}"/>
	<input type="hidden" name="str_start_date" value="${searchVo.str_start_date}"/>
	<input type="hidden" name="str_end_date" value="${searchVo.str_end_date}"/>
</form>
<!-- 히든 폼 끝 -->

<!-- 검색바 -->
    <div class="row">
    	<div class="col-md-12">
	        <div class="sidebar-box">
	              <form action="#" class="search-form">
	                <div class="form-group">
	                  <span class="icon icon-search"></span>
	                  <input type="text" id="searchTarget" class="form-control" value="${searchVo.keyword}" 
	                  placeholder="모든 위치" style="font-size:30px;">
	                </div>
	              </form>
	        </div>
	    </div>
    </div>
<!-- 검색바 끝 -->

<!-- 선택버튼 -->
                <input type="button" value="날짜" class="btn btn-primary py-3 px-5" style="font-size:20px;" id= "btnTest" data-toggle="modal" data-target="#myModal">
				<input type="button" value="인원" class="btn btn-primary py-3 px-5" style="font-size:20px;">
				<input type="button" value="숙소 유형" class="btn btn-primary py-3 px-5" style="font-size:20px;">
				<input type="button" value="요금" class="btn btn-primary py-3 px-5" style="font-size:20px;">
				<input type="button" value="필터" class="btn btn-primary py-3 px-5" style="font-size:20px;">
<!-- 선택버튼 끝 -->
<br>
<c:if test="${not empty searchVo.keyword}">
	<h6 class="sol-font">${searchVo.totalCount}개의 방이 검색 되었습니다.</h6>
</c:if>
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
        				<p><a data-num="${vo.room_num}" class="room-title btn-customize">지금 예약하기</a></p>
        			</div>
        		</div>
        	</div>
        	</c:forEach>
        </div>

<!-- 방 리스트 끝 -->
<br>
<!-- 페이징 -->
<div class="row mt-5">
	<div class="col text-center">
		 <div class="block-27">
			<ul>
			<c:if test="${searchVo.hasPrev == true}">
						<li>
							<a class="solge" data-page="${searchVo.startPage - 1}">&lt;</a>
						</li>
					</c:if>
					<c:forEach begin="${searchVo.startPage}" end="${searchVo.endPage}" var="v">
						<li 
							<c:choose>
								<c:when test="${searchVo.page == v}">
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
					<c:if test="${searchVo.hasNext == true}">
						<li>
							<a class="solge" data-page="${searchVo.endPage + 1}">&gt;</a>
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

<!-- 데이터피커O -->

<%@ include file = "../../views/casahotel/casahotel_footer.jsp" %>

<%@ include file = "../../views/casahotel/casahotel_script.jsp" %>
<%@ include file = "../../views/islagrande/islagrande_script.jsp" %>

<%@ include file = "../../views/end.jsp"%> <!-- </body> -->

<!-- 데이터피커O -->

