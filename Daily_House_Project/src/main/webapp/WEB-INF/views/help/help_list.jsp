<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 데이터피커X -->					
<%@ include file = "../../views/title2.jsp"%> <!-- <head> -->					
					
<%@ include file = "../../views/casahotel/casahotel_link2.jsp" %>					
<%@ include file = "../../views/islagrande/islagrande_link.jsp" %>					
					
<%@ include file = "../../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->					
<!-- 데이터피커X -->					


<style>
	.lblTitle1{ font-size: 25px; font-weight: bold;}
	.lblTitle2{ font-size: 20px;}
	.lblTitle3{ font-size: 15px; font-weight: bold;}
	
	a{ color: black; }
}
</style>

<script>
$(function(){
	
	// 현재 클릭된 메뉴를 활성화
	$(".nav-item:eq(0)").attr("class", "nav-item");
	$(".nav-item:eq(4)").attr("class", "nav-item active");
	
	// 글작성 버튼 클릭
	$("#btnWrite").click(function(){
		location.href = "/cy/helpWrite";
	});
	
	//페이징
	$(".classPage").click(function(e) {
		e.preventDefault(); 
		location.href = "/cy/help";
	});
	
	// board_title_a
	$(".board_title_a").on("click", function(){
		var that = $(this);
		var board_num = that.attr("data-board-num");
		console.log("board_num: " + board_num);
		location.href = "/cy/helpDetail?board_num=" + board_num;
	});
	
});
</script>

<br><br><br><br>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8"><br><br><br><br>
			<div class="row">
				<div class="col-md-8">
					<label class="lblTitle1">데일리하우스 도움말 센터에 오신 것을 환영합니다. </label>
				</div>
				<div class="col-md-4" align="right">
					<c:if test="${userVo.user_email eq 'admin@naver.com'}">
						<button type="button" class="btn btn-primary" id="btnWrite" style="font-size:15px;" >글쓰기</button>
					</c:if>
				</div>
			</div><br><br>
			
	<!-- table START -->
	<div class="row" align="center">
		<table class="table" id="tbl_board">
			<thead align="center">
				<tr align="center">
					<th> </th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
				
			<tbody align="center">
				<c:forEach items="${list}" var="BoardVo">
				<tr align="center" 
					<c:if test="${BoardVo.board_notice eq 'Y'}"> style="font-weight: bold;" </c:if>
				>
					<c:choose>
						<c:when test="${BoardVo.board_notice eq 'Y'}">
							<td>공지</td>
						</c:when>
						<c:otherwise>
							<td>${BoardVo.board_num}</td>
						</c:otherwise>
					</c:choose>
					<td><a href="#" class="board_title_a" data-board-num="${BoardVo.board_num}">${BoardVo.board_title}</a></td>
					<td>${BoardVo.user_name}</td>
					<td>${BoardVo.board_reg_date}</td>
					<td>${BoardVo.board_read_count}</td>
				</tr>
				</c:forEach>
			</tbody>	
		</table>
	</div>
	
	
	
	
	
<!-- 페이징 -->
<div class="row mt-5">
	<div class="col text-center">
		 <div class="block-27">
				<ul>
					<c:if test="${cyPagingDto.hasPrev == true}">
					<li>
						<a class="classPage" data-page="${cyPagingDto.startPage - 1}" style="cursor:pointer">&lt;</a>
					</li>
					</c:if>
					<c:forEach begin="1" end="1" var="v">
						<li 
							<c:choose>
								<c:when test="${1 == v}">
									class="active"
								</c:when>
								<c:otherwise>
									class=""
								</c:otherwise>
							</c:choose>
						>
							<a class="classPage" data-page="${v}" style="cursor:pointer">${v}</a>
						</li>
					</c:forEach>
					<c:if test="${cyPagingDto.hasNext == true}">
						<li>
							<a class="classPage" data-page="${cyPagingDto.endPage + 1}" style="cursor:pointer">&gt;</a>
						</li>
					</c:if>
			</ul>
		</div>
	</div>
</div>
<!-- 페이징 끝 -->	
	
	
	
	
	<!-- table END -->
	</div>
			
	<div class="col-md-2"></div>
	</div>
</div><br><br><br>

<%@ include file = "../../views/casahotel/casahotel_footer.jsp" %>	

<%@ include file = "../../views/casahotel/casahotel_script2.jsp" %>			
<%@ include file = "../../views/islagrande/islagrande_script2.jsp" %>	

<%@ include file = "../../views/end.jsp"%> <!-- </body> -->