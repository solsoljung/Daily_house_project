<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
$(document).ready(function(){
	$("#myTest").click(function(){
		console.log("click");
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
		$('#startDate').show();
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
	
	//인원
	$("#adults").change(function(){
		var select = $("#adults option:selected").text();
		console.log(select);
		var selectInt = parseInt(select);
		$("input[name=room_people]").val(selectInt);
	});
	
	//검색
	$("#btnSearch").click(function(){
		$("#frmPage").submit();
	});
});
</script>
    <section class="section bg-light"  id="next">
    <form id="frmPage" action="/sol/room" method="post">
	<input type="hidden" name="room_num" />
	<input type="hidden" name="keyword" value="${searchVo.keyword}"/>
	<input type="hidden" name="str_start_date" value="${searchVo.str_start_date}"/>
	<input type="hidden" name="str_end_date" value="${searchVo.str_end_date}"/>
	<input type="hidden" name="room_people" value="${searchVo.room_people}"/>
</form>
      <div class="container">
        <div class="row">
          <div class="col-md-7 mx-auto text-center mb-5">
            <h2 class="heading">Check Availabilty</h2>
          </div>
        </div>
        <div class="row">
          <div class="block-32">

            <form action="#">
              <div class="row">
              	<div class="col-md-6 mb-3 mb-lg-0 col-lg-3"><!-- 111111111111111111111111111111111111111111111111111111111111 -->
                  <label class="font-weight-bold text-black">지역 찾기</label>
                  
                  <div class="field-icon-wrap">
                    <div class="icon">
<!--                     <span class="icon-calendar"></span> -->
						<!-- 여기 -->
                    </div>
                     	<input type="text" class="form-control">
						
                  </div>
                </div>
                <!-- 체크인 -->
                <div class="col-md-6 mb-3 mb-lg-0 col-lg-3"><!-- 2222222222222222222222222222222222222222222222222222222222222222 -->
                  <label class="font-weight-bold text-black">Check In</label>
                  <!-- 달력 -->
                  <div class="field-icon-wrap">
                    <div class="icon">
                    <span class="icon-calendar"></span>
                    </div>
                    
                    <input type="text" class="form-control" id="startDate">
                  </div>
                  <!-- 달력 끝 -->
                </div>
                <div class="col-md-6 mb-3 mb-lg-0 col-lg-3"><!-- 3333333333333333333333333333333333333333333333333333333333333333333 -->
                  <label class="font-weight-bold text-black">Check Out</label>
                  <div class="field-icon-wrap">
                    <div class="icon"><span class="icon-calendar"></span></div>
                    <input type="text" class="form-control" id="endDate">
                  </div>
                </div>
                <div class="col-md-6 mb-3 mb-md-0 col-lg-3"><!-- 4444444444444444444444444444444444444444444444444444444444444444444 -->
                  <div class="row">
                    <div class="col-md-6 mb-3 mb-md-0">
                      <label for="adults" class="font-weight-bold text-black">Adults</label>
                      <div class="field-icon-wrap">
                        <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                        <select name="" id="adults" class="form-control">
                          <option value="1">1</option>
                          <option value="2">2</option>
                          <option value="3">3</option>
                          <option value="4">4+</option>
                        </select>
                      </div>
                    </div>
                  </div>
                </div>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <div class="col-md-12" align="right"> <!-- 55555555555555555555555555555555555555555555555555555555555555555 -->
                  <button class="btn btn-primary py-3 px-5" id="btnSearch">Check Availabilty</button>
                </div>
              </div>
            </form>
            
          </div>
        </div>
      </div>
    </section>