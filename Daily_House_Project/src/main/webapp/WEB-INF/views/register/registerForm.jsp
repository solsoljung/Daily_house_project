<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>
$(function(){
	$("#btn_list").click(function(){
		location.href = "/test/board/listAll";
	});
	
	//이메일 참고
	//https://dlgkstjq623.tistory.com/351
	
	//인증번호를 저장할 공간
	var dice = "";
	
	//이메일 인증번호 발급받기
	$("#btn_certification").click(function(){
		var user_id = $("input[name=user_id]").val();
		$.ajax({
			"type" : "post",
			"url" : "/test/certification/registerCertification",
			"headers" : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "post"
			},
			"dataType" : "text",
			"data" : JSON.stringify(user_id),
			"success" : function(rData) {
				alert("인증번호가 발송되었습니다.\n확인 후 인증번호를 입력바랍니다.");
				console.log("=================btn_certification=================");
				dice = rData;
				console.log("dice: " + dice);
			}
		}); // $.ajax()
	}); //$("#btn_certification1").click
	
	
	//이메일 인증번호 일치, 불일치 확인
	$("#btn_certification2").click(function(){
		var user_input = $("input[name=certification]").val();
		console.log("=================btn_certification2=================");
		var sData = {
				"dice" : dice,
				"user_input" : user_input
		};
		$.ajax({
			"type" : "post",
			"url" : "/test/certification/registerCertification2",
			"headers" : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "post"
			},
			"dataType" : "text",
			"data" : JSON.stringify(sData),
			"success" : function(rData) {
				console.log(rData);
				if(rData == "success"){
					alert("인증성공");
				}else if(rData == "fail"){
					alert("인증실패");
				}
			}
		}); // $.ajax()
	});
});

</script>

<head>
<title>REGISTER</title>
</head>
<body>
	<h1>REGISTER</h1>

	<form method="post" action="">
	<table border="1">
		<tr>
			<th>이메일</th>
			<td><input type="text" name="user_id" required="required" 
				style="width:100%;" placeholder="이메일"/></td>
			<td><input type="button" value="인증번호 받기" id="btn_certification"/>	</td>	
		</tr>
		<tr>
			<th>이메일 인증</th>
			<td><input type="text" name="certification" required="required" 
				style="width:100%;" placeholder="인증번호를 입력하세요"/></td>
			<td><input type="button" value="인증번호 확인" id="btn_certification2"/>	</td>	
		</tr>
		<tr>
			<th>비밀번호</th>
			<td colspan="2"><input type="text" name="user_pw" required="required" 
				style="width:100%;" placeholder="비밀번호"/></td>
		</tr>
	</table>
	
	<br/>
	<input type="submit" value="완료" id="btn_submit"/>
	<input type="button" value="목록으로" id="btn_list"/>

	</form>
</body>
