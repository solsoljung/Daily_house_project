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

input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
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
	
	// 현재 클릭된 메뉴를 활성화
	$(".nav-item:eq(0)").attr("class", "nav-item");
	$(".nav-item:eq(2)").attr("class", "nav-item active");
	
	//검색 ajax
	var which = 0;
	
	//검색어 리스트
	$("#searchTarget").keyup(function(e){
		
		//아래방향키를 눌렀을 때 active class를 추가
		if(e.keyCode == 40){
			if(which > 0){
				console.log("remove");
				$("#list").children().removeClass("active");
			}
			$("#list").children().eq(which).addClass("active");
			which++;
			
		//위방향키를 눌렀을 때 active class를 추가
		} else if(e.keyCode == 38){
			which--;
			$("#list").children().removeClass("active");
			$("#list").children().eq(which -1).addClass("active");
			
		//엔터를 눌렀을 때 검색창에 해당 검색어를 추가
		} else if(e.keyCode == 13){
			if(which == 0){
				console.log("아무것도 참조하징 않은 검색");
				var keyword = $(this).val();
				console.log(keyword);
				$("input[name=keyword]").val(keyword);
				$("#frmPage").submit();
			} else {
				console.log("참조한 검색");
				var keyword = $("#list").children().eq(which - 1).text();
				$(this).val(keyword);
				$("input[name=keyword]").val(keyword);
				$("#frmPage").submit();
			}
			
		//아래, 위, 엔터가 아닐때는 ajax로 검색해 밑에 달아준다.
		} else if(e.keyCode != 40 && e.keyCode != 38 && e.keyCode != 13){
			which = 0;
			console.log(which);
			var search_keyword = $(this).val();
			var enkeyword = encodeURI(search_keyword);
			var url = "/sol/keywordList/" + encodeURI(search_keyword);
			$.ajax({
				"type" : "get",
				"url" : url,
				"headers" : {
					"Content-Type" : "application/json",
					"X-HTTP-Medtod-Override" : "get"
				},
				"dataType" : "text",
				"success" : function(rData){
					$.getJSON(url, function(rData){
						$("#list").empty();
						console.log(rData);
						var strHtml = "";
						$(rData).each(function(){
							strHtml += "<a class='list-group-item' data-keyword='"+ this.location_text +"'>" + this.location_text + "</a>";
						});
						$("#list").append(strHtml);
					});
				}
			});
		}
	});
	
	//페이징
	$(".solge").click(function(e) {
		e.preventDefault(); 
		var page = $(this).attr("data-page");
		$("input[name=page]").val(page);
		$("#frmPage").submit();
	});

	//상세 페이지로 이동 > 제목과 지금 예약하기 눌렀을 때
	$(".room-title").click(function(e) {
		e.preventDefault();
		var room_num = $(this).parent().parent().children().eq(0).children().attr("data-num");
		$("input[name=room_num]").val(room_num);
		$("#frmPage").attr("action", "/boo/detail");
		$("#frmPage").submit();
	});

	//상세 페이지로 이동 > 이미지를 눌렀을 때
	$(".room-image").click(function(e) {
		e.preventDefault();
		var room_num = $(this).attr("data-num");
		$("input[name=room_num]").val(room_num);
		$("#frmPage").attr("action", "/boo/detail");
		$("#frmPage").submit();
	});
	
	//검색
	$("#searchTarget").keyup(function(e){
		/* if(e.keyCode == 13){
			var keyword = $(this).val();
			console.log(keyword);
			$("input[name=keyword]").val(keyword);
			$("#frmPage").submit();
		} */
	});
	
	//인원
	$('.people').on('hidden.bs.dropdown', function(){
		var num = $("#numBox").text();
		$("input[name=room_people]").val(num);
		console.log(num);
		$("#frmPage").submit();
  	});
	
	//가격
	$('.price').on('hidden.bs.dropdown', function(e){
		e.stopPropagation(); 
		var lowPrice = $("#lowPrice").val();
		var highPrice = $("#highPrice").val();
		console.log(lowPrice);
		console.log(highPrice);
		$("input[name=low_price]").val(lowPrice);
		$("input[name=high_price]").val(highPrice);
		$("#frmPage").submit();
		
		console.log("ㅇ요오옹!");
  	});
	
	//룸타입
	$('.roomtype').on('hidden.bs.dropdown', function(e){
		e.stopPropagation();
		var arrType = [];
		var arrTypeName = [];
		$("input:checkbox[name=typeChb]:checked").each(function(){
			arrType.push($(this).val());
			arrTypeName.push($(this).next().text());
		});
		var joinType = arrType.join("|");
		if(joinType == ""){
			joinType = "R1|R2|R3";
		}
		var joinTypeName = arrTypeName.join(",");
		console.log(joinType);
		console.log(joinTypeName);
		$("input[name=joinType]").val(joinType);
		$("input[name=joinTypeName]").val(joinTypeName);
		$("#frmPage").submit();
  	});
	
	//룸옵션
	$('.roomOption').on('hidden.bs.dropdown', function(e){
		e.stopPropagation();
		var room_bed = $("#room_bed").text();
		$("input[name=room_bed]").val(room_bed);
		var room_bathroom = $("#room_bathroom").text();
		$("input[name=room_bathroom]").val(room_bathroom);
		var arrOption = [];
		$("input:checkbox[name=optionChb]:checked").each(function(){
			arrOption.push($(this).val());
		});
		$("input[name=arrOption]").val(arrOption);
		console.log(arrOption);
		$("#frmPage").submit();
  	});
	
	//체크된 상태로 가져오기
	var room_option_code = "${searchVo.arrOption}";	//룸 옵션 선택 된 것 ex> a1,p1...
	var room_type_code = "${searchVo.joinType}";
	
	splitOption();
	splitType();
	
	function splitType() {
		var myType = room_type_code.split("|"); //선택한 것
		
		var data_types = []; //모든 옵션
		$(".typeChb").each(function(){
			data_types.push($(this).val());
		});
		console.log(data_types);
		
		for(var i=0; i<myType.length; i++){
			for(var v=0; v<data_types.length; v++){
				if(myType[i] == data_types[v]){
					$(".typeChb").eq(v).prop("checked", true);
				}
			}
		}
	};
	
	function splitOption() {			
		var myOption = room_option_code.split(","); //선택한 것
		console.log(myOption); //["A1", "W1", "B1"]
		
		var data_options = []; //모든 옵션
		$(".optionChb").each(function(){
			data_options.push($(this).val());
		});
		console.log(data_options);
		
		for(var i=0; i<myOption.length; i++){
			for(var v=0; v<data_options.length; v++){
				if(myOption[i] == data_options[v]){
					$(".optionChb").eq(v).prop("checked", true);
				}
			}
		}
	};
	
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
		$('#startDate').show();
		$("#frmPage").submit();
	});
	
	//minus
	$(".minus").click(function(e){
		var num = $(this).next().text();			
		var minusNum = parseInt(num) - 1;			
					
		if(minusNum < 0) {			
			$(this).next().text(num);
		} else {			
			$(this).next().text(minusNum);
		}
		e.stopPropagation();
	});
	
	//plus
	$(".plus").click(function(e){	
		e.stopPropagation();
		var num = $(this).prev().text();	
		var plusNum = parseInt(num) + 1;			
					
		if(plusNum >= 20) {			
			$(this).prev().text(num);
		} else {			
			$(this).prev().text(plusNum);
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
<%-- ${searchVo}
${priceDto} --%>
<span id="targetAjax"></span>
<!-- 히든 폼 -->
<form id="frmPage" action="/sol/room" method="get">
	<input type="hidden" name="room_num" />
	<input type="hidden" name="page" value="${searchVo.page}"/>
	<input type="hidden" name="keyword" value="${searchVo.keyword}"/>
	<input type="hidden" name="str_start_date" value="${searchVo.str_start_date}"/>
	<input type="hidden" name="str_end_date" value="${searchVo.str_end_date}"/>
	<input type="hidden" name="room_people" value="${searchVo.room_people}"/>
	<input type="hidden" name="low_price" value="${searchVo.low_price}"/>
	<input type="hidden" name="high_price" value="${searchVo.high_price}"/>
	<input type="hidden" name="joinType" value="${searchVo.joinType}"/>
	<input type="hidden" name="room_bathroom" value="${searchVo.room_bathroom}"/>
	<input type="hidden" name="room_bed" value="${searchVo.room_bed}"/>
	<input type="hidden" name="arrOption" value="${searchVo.arrOption}"/>
	<input type="hidden" name="joinTypeName" value="${searchVo.joinTypeName}"/>
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
	                  placeholder="모든 위치" style="font-size:25px;" autocomplete="off">
<!-- 검색결과 -->
<div id="list">
	<div class="list-group"></div>
</div>
<!-- 검색결과 끝 -->
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
<div class="dropdown people" id="d1">
<button class="btn btn-primary py-3 px-5 dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" style="font-size:20px;margin-bottom:10px;">
		<c:choose>
			<c:when test="${searchVo.room_people > 1}">
				${searchVo.room_people}명
			</c:when>
			<c:otherwise>
				인원
			</c:otherwise>
		</c:choose>
</button>
	<div class="dropdown-menu block-27" aria-labelledby="dropdownMenuButton" style="text-align:center;">
		<ul style="padding:0px;">
			<li class="nav-item" style="list-style:none;padding-left:0px;"><label style="font-weight:200;">인원 수</label></li>
			<li class="nav-item" style="list-style:none;padding-left:0px;width:240px;" id="target">
			<a class="minus" style="cursor:pointer">-</a>
			<label id="numBox" style="font-weight:200;width:50px;height:40px;margin-left:10px;margin-right:10px;text-align:center;">${searchVo.room_people}</label>
			<a class="plus" style="cursor:pointer">+</a></li>
		</ul>
	</div>
</div>
<!-- 숙소 유형 -->
<div class="dropdown roomtype">
<button class="btn btn-primary py-3 px-5 dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" style="font-size:20px;margin-bottom:10px;">
		<c:choose>
			<c:when test="${searchVo.joinType != 'R1|R2|R3'}">
				${searchVo.joinTypeName}
			</c:when>
			<c:otherwise>
				숙소 유형
			</c:otherwise>
		</c:choose>
</button>
	<div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="text-align:left;">
		<ul style="padding:0px;">
			<c:forEach items="${typeList}" var="typeVo">
			<li class="nav-item" style="list-style:none;padding-left:0px;width:240px;"><input type="checkbox" value="${typeVo.room_type_num}" class="typeChb" name="typeChb" style="width:20px;height:20px;"/>
			<label style="margin-left:10px;font-weight:200;">${typeVo.room_type_explain}</label></li>
			</c:forEach>
		</ul>
	</div>
</div>

<!-- 요금 -->
<div class="dropdown price">
<button class="btn btn-primary py-3 px-5 dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" style="font-size:20px;margin-bottom:10px;">
		<c:choose>
			<c:when test="${searchVo.low_price != priceDto.min_low_price || searchVo.high_price != priceDto.max_high_price}">
				${searchVo.low_price} ~ ${searchVo.high_price}
			</c:when>
			<c:otherwise>
				요금
			</c:otherwise>
		</c:choose>
</button>
	<div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="text-align:center;">
		<ul style="padding:0px;">
			<li class="nav-item" style="list-style:none;padding-left:0px;width:430px;" id="target">
			<c:choose>
				<c:when test="${searchVo.low_price ne priceDto.min_low_price || searchVo.high_price ne priceDto.max_high_price}">
					<input type="number" id="lowPrice" value="${searchVo.low_price}" style="font-size:20px;font-weight:200;width:150px;height:40px;margin-left:10px;margin-right:10px;text-align:center;"/>원
					<label>~</label>
					<input type="number" id="highPrice" value="${searchVo.high_price}" style="font-size:20px;font-weight:200;width:150px;height:40px;margin-left:10px;margin-right:10px;text-align:center;"/>원
				</c:when>
				<c:otherwise>
					<input type="number" id="lowPrice" value="${priceDto.min_low_price}" style="font-size:20px;font-weight:200;width:150px;height:40px;margin-left:10px;margin-right:10px;text-align:center;"/>원
					<label>~</label>
					<input type="number" id="highPrice" value="${priceDto.max_high_price}" style="font-size:20px;font-weight:200;width:150px;height:40px;margin-left:10px;margin-right:10px;text-align:center;"/>원
				</c:otherwise>
			</c:choose>
			</li>
		</ul>
	</div>
</div>
<!-- 필터 -->
<div class="dropdown roomOption">
<button class="btn btn-primary py-3 px-5 dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" style="font-size:20px;margin-bottom:10px;
		<c:choose>
			<c:when test="${searchVo.room_bathroom != 1 || searchVo.room_bed != 1 || not empty searchVo.arrOption}">
				background:#204d74;
			</c:when>
		</c:choose>
">필터</button>
	<div class="dropdown-menu block-27" aria-labelledby="dropdownMenuButton" style="text-align:left;">
		<ul style="padding:0px;">
			<li class="nav-item" style="text-align:center;list-style:none;padding-left:0px;width:300px;"><label style="margin-left:10px;font-weight:200;">침대와 욕실</label></li>
			<li class="nav-item" style="list-style:none;padding-left:0px;width:240px;"><label style="margin-left:10px;margin-right:25px;font-weight:200;">침대</label>
			<a class="minus" style="cursor:pointer;">-</a>
			<label id="room_bed" style="font-weight:200;width:50px;height:40px;margin-left:10px;margin-right:10px;text-align:center;">${searchVo.room_bed}</label>
			<a class="plus" style="cursor:pointer">+</a></li>
			
			<li class="nav-item" style="list-style:none;padding-left:0px;width:240px;"><label style="margin-left:10px;margin-right:25px;font-weight:200;">욕실</label>
			<a class="minus" style="cursor:pointer">-</a>
			<label id="room_bathroom" style="font-weight:200;width:50px;height:40px;margin-left:10px;margin-right:10px;text-align:center;">${searchVo.room_bathroom}</label>
			<a class="plus" style="cursor:pointer">+</a></li>
			
			<hr>
			
			<li class="nav-item" style="text-align:center;list-style:none;padding-left:0px;width:240px;"><label style="margin-left:10px;font-weight:200;">편의시설</label></li>
			<c:forEach items="${optionList}" var="optionVo">
				<li class="nav-item" style="list-style:none;padding-left:0px;width:240px;"><input type="checkbox" class="optionChb" style="width:20px;height:20px;" value="${optionVo.room_option_code}" name="optionChb"/><label style="margin-left:10px;font-weight:200;">${optionVo.room_option_explain}</label></li>
			</c:forEach>
			
		</ul>
	</div>
</div>
</div>
<!-- 드롭다운 끝 -->

<br>
<c:if test="${not empty searchVo.keyword}">
<br>
<br>
	<h6 class="sol-font" style="font-size:30px;color:black;">${searchVo.totalCount}개의 방이 검색 되었습니다.</h6>
</c:if>
<br>
<!-- 방 리스트 -->
<div class="row">
        <c:forEach var="vo" items="${list}">
        	<div class="col-md-3">
        		<div class="room-wrap ftco-animate">
        			<a data-num="${vo.room_num}" class="img room-image" style="background-image: url(/si/displayFile?fileName=/${vo.pic_uri});cursor:pointer;"></a>
        			<div class="text pt-4 pl-lg-5">
        				<h2><a data-num="${vo.room_num}" class="room-title" id="room-title" style="cursor:pointer;font-family:Arial;">${vo.room_title}</a></h2>
        				<p class="rate">
        					<c:choose>
        						<c:when test="${(vo.room_score+(1-(vo.room_score%1))%1) > 4}"><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span></c:when>
        						<c:when test="${(vo.room_score+(1-(vo.room_score%1))%1) > 3}"><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span></c:when>
        						<c:when test="${(vo.room_score+(1-(vo.room_score%1))%1) > 2}"><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span></c:when>
        						<c:when test="${(vo.room_score+(1-(vo.room_score%1))%1) > 1}"><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span></c:when>
        						<c:otherwise><span class="icon-star-half-full"></span></c:otherwise>
        					</c:choose>
        				</p>
        				<p class="d-flex price-details align-items-center pt-3">
        			 		<span class="price">￦${vo.room_price}<small>&nbsp;/&nbsp;&nbsp;&nbsp;1박</small></span>
        				</p>
        				<p><a data-num="${vo.room_num}" class="room-title btn-customize" style="cursor:pointer;">지금 예약하기</a></p>
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
							<a class="solge" data-page="${searchVo.startPage - 1}" style="cursor:pointer">&lt;</a>
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
							<a class="solge" data-page="${v}" style="cursor:pointer">${v}</a>
						</li>
					</c:forEach>
					<c:if test="${searchVo.hasNext == true}">
						<li>
							<a class="solge" data-page="${searchVo.endPage + 1}" style="cursor:pointer">&gt;</a>
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

