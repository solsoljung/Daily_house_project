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

.dropdown-menu{
	color: #222;
    background-color: #fff;
    font-size: 20px;
    font-weight: 200;
    padding: 30px 30px;
    border: none;
    outline: none;
    box-shadow: 0 0 10px #555;
    /* line-height: 3; */
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
	    startDate: '1d',
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
        
        $("input[name=str_start_date]").val(date);

        $("#endDate").datepicker("setStartDate", newDate);
        $(this).hide();
        $('#endDate').show().datepicker("show");
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
		
		var checkout = formatDate(e.date);
		console.log(checkout);
		
		$("input[name=str_end_date]").val(checkout);
		$('#startDate').show()
		$("#frmPage").submit();
	});
	
	//minus
	$("#minus").click(function(e){
		var num = $(this).next().text();			
		var minusNum = parseInt(num) - 1;			
					
		if(minusNum < 0) {			
			$("#numBox").text(num);		
		} else {			
			$("#numBox").text(minusNum);		
		}
		e.stopPropagation();
	});
	
	//plus
	$("#plus").click(function(e){	
		e.stopPropagation();
		var num = $(this).prev().text();	
		console.log(num);
		var plusNum = parseInt(num) + 1;			
					
		if(plusNum >= 20) {			
			$("#numBox").text(num);	
		} else {			
			$("#numBox").text(plusNum);		
		}
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

<!-- section -->   

<section class="ftco-section ftco-room">
<div class="container">


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

<!-- 드롭다운 -->
<div class="row">
<div class="dropdown">
<c:choose>
	<c:when test="${empty searchVo.str_start_date}">
	<input type="button" value="체크인" class="btn btn-primary py-3 px-5" style="font-size:20px;" id= "startDate">
	<input type="button" value="체크아웃" class="btn btn-primary py-3 px-5" style="font-size:20px;display:none;" id= "endDate">
	</c:when>
	<c:otherwise>
	<input type="button" value="${searchVo.str_start_date}" class="btn btn-primary py-3 px-5" style="font-size:20px;" id= "startDate">
	<input type="button" value="${searchVo.str_end_date}" class="btn btn-primary py-3 px-5" style="font-size:20px;" id= "endDate">
	</c:otherwise>
</c:choose>
</div>

<!-- 인원 -->
<div class="dropdown" id="d1">
<button class="btn btn-primary py-3 px-5 dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" style="font-size:20px;margin-bottom:10px;">인원</button>
	<div class="dropdown-menu block-27" aria-labelledby="dropdownMenuButton" style="text-align:center;">
		<ul style="padding:0px;">
			<li class="nav-item" style="list-style:none;padding-left:0px;"><label style="font-weight:200;">인원 수</label></li>
			<li class="nav-item" style="list-style:none;padding-left:0px;width:240px;" id="target">
			<a id="minus" style="cursor:pointer">-</a>
			<!-- <input type="number" id="numBox" min="1" max="20" value="1" readonly style="font-weight:200;width:50px;height:40px;margin-left:10px;margin-right:10px;text-align:center;"/> -->
			<label id="numBox" style="font-weight:200;width:50px;height:40px;margin-left:10px;margin-right:10px;text-align:center;">1</label>
			<a id="plus" style="cursor:pointer">+</a></li>
		</ul>
	</div>
</div>
<!-- 숙소 유형 -->
<div class="dropdown">
<button class="btn btn-primary py-3 px-5 dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" style="font-size:20px;margin-bottom:10px;">숙소 유형</button>
	<div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="text-align:left;">
		<ul style="padding:0px;">
			<c:forEach items="${typeList}" var="typeVo">
			<li class="nav-item" style="list-style:none;padding-left:0px;width:240px;"><input type="checkbox" class="chb"/>
			<label style="margin-left:10px;font-weight:200;">${typeVo.room_type_explain}</label></li>
			</c:forEach>
		</ul>
	</div>
</div>
<!-- 요금 -->
<div class="dropdown">
<button class="btn btn-primary py-3 px-5 dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" style="font-size:20px;margin-bottom:10px;">요금</button>
	<div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="text-align:center;">
		<ul style="padding:0px;">
			<!-- <li class="nav-item" style="list-style:none;padding-left:0px;">
			<label style="margin-left:10px;font-weight:200;">최저가격</label>
			<label style="margin-left:10px;font-weight:200;">최고가격</label>
			</li> -->
			
			<li class="nav-item" style="list-style:none;padding-left:0px;width:400px;" id="target">
			<input type="number" id="lowPrice" placeholder="최저 요금" style="font-size:12px;font-weight:200;width:150px;height:40px;margin-left:10px;margin-right:10px;text-align:center;"/>
			<label>~</label>
			<input type="number" id="highPrice" placeholder="최고 요금" style="font-size:12px;font-weight:200;width:150px;height:40px;margin-left:10px;margin-right:10px;text-align:center;"/>
			</li>
		</ul>
	</div>
</div>
<!-- 필터 -->
<div class="dropdown">
<button class="btn btn-primary py-3 px-5 dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" style="font-size:20px;margin-bottom:10px;">필터</button>
	<div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="text-align:left;">
		<ul style="padding:0px;">
			<li class="nav-item" style="text-align:center;list-style:none;padding-left:0px;width:240px;"><label style="margin-left:10px;font-weight:200;">편의시설</label></li>
			<li class="nav-item" style="list-style:none;padding-left:0px;width:240px;"><input type="checkbox" class="chb"/><label style="margin-left:10px;font-weight:200;">에어컨</label></li>
			<li class="nav-item" style="list-style:none;padding-left:0px;"><input type="checkbox" class="chb"/><label style="margin-left:10px;font-weight:200;">주차공간</label></li>
			<li class="nav-item" style="list-style:none;padding-left:0px;"><input type="checkbox" class="chb"/><label style="margin-left:10px;font-weight:200;">반려동물</label></li>
		</ul>
	</div>
</div>
</div>
<!-- 드롭다운 끝 -->

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

