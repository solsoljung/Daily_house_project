<link rel="stylesheet" href="/modal/modal.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file = "../../views/title.jsp"%> <!-- <head> -->

<%@ include file = "../../views/casahotel/casahotel_link.jsp" %>
<%@ include file = "../../views/islagrande/islagrande_link.jsp" %>

<%@ include file = "../../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->


<style>
.sol-font{
	font-family: '맑은 고딕';
	color: #fb929e;
}
</style>

<!-- datepicker -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.css">

<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
<!-- datepicker -->

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
	
	//달력
	$(function() {	
        var options = {
		    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
		    //startDate: '-10d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
		    //endDate: '+10d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
		    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
		    calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
		    clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
		    //datesDisabled : ['2019-06-24','2019-06-26'],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
		    //daysOfWeekDisabled : [0,6],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
		    //daysOfWeekHighlighted : [3], //강조 되어야 하는 요일 설정
		    disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
		    immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
		    multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
		    multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
		    templates : {
		        leftArrow: '&laquo;',
		        rightArrow: '&raquo;'
		    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
		    showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
		    //title: "테스트",	//캘린더 상단에 보여주는 타이틀
		    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
		    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
		    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
		    language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
		    
		};
		
        $("#start").datepicker(options).on('changeDate',function(selected){
            var startDate = new Date(selected.date.valueOf());
            $("#end").datepicker("setStartDate", startDate);
            console.log(startDate);
        });
        $("#end").datepicker(options).on('changeDate',function(selected){
            var endDate = new Date(selected.date.valueOf());
            $("#start").datepicker("setEndDate", endDate);
            console.log(endDate);
        });
	});




});
</script>

<!-- section -->   

<section class="ftco-section ftco-room">
<div class="container">
<input type="text" id="start" class="form-control" style = "width : 200px;display: inline-block" value="2019-06-27">
    <input type="text" id="end" class="form-control" style = "width : 200px; display: inline-block" value="2019-06-27">

<!-- 히든 폼 -->
<form id="frmPage" action="/sol/room" method="get">
	<input type="hidden" name="room_num" />
	<input type="hidden" name="page" value="${pagingDto.page}"/>
	<input type="hidden" name="keyword" value="${pagingDto.keyword}"/>
</form>
<!-- 히든 폼 끝 -->

<!-- 검색바 -->
    <div class="row">
    	<div class="col-md-12">
	        <div class="sidebar-box">
	              <form action="#" class="search-form">
	                <div class="form-group">
	                  <span class="icon icon-search"></span>
	                  <input type="text" id="searchTarget" class="form-control" value="${pagingDto.keyword}" 
	                  placeholder="모든 위치" style="font-size:30px;">
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
<c:if test="${not empty pagingDto.keyword}">
	<h6 class="sol-font">${pagingDto.totalCount}개의 방이 검색 되었습니다.</h6>
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