<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="jquery-3.4.0.min.js">
<link rel="stylesheet" href="/jootopia/css/common.css">
<title>JooTopia</title>
<style>
	div>h1{
		font-weight:bold;
		align:center;
	}
	
	#tableArea{
		text-align:center;
	}
	
		#modifyBtn{
		width:100px;
		background-color: #FFBB00;
	   border: none;
	   color:#fff;
	   padding: 15px 0;
	   text-align: center;
	   text-decoration: none;
	   display: inline-block;
	   font-size: 15px;
	   margin: 4px;
	   cursor: pointer;
	   border-radius:10px;
	}
	
	table{
	text-align:center;
	}
	
</style>
</head>
<body>
<%@ include file="/views/common/navigation.jsp" %>
	<section>
		<div class="row">
			<div class="col-sm-3"></div>
			
			<div class="col-sm-6" id="tableArea">
				<h1>비밀번호 입력</h1>
				<br />
				<p>회원님의 개인 정보 보호를 위해 비밀번호를 한 번 더 입력해주세요.</p>
				<table class="table">
					<tr>
						<td><label for="">아이디</label></td>
						<td>so3o02</td>
					</tr>
					<tr>
						<td><label for="">비밀번호</label></td>
						<td><input type="password" name="userPwd"/></td>
					</tr>
					<tr>
					<td> </td>
					<td> </td>
					</tr>
				</table>
			<div class="btnArea">
			<a href="modifyUserInfoPage.jsp" id="modifyBtn">확인</a>
			</div>
			
			</div>
			<div class="col-sm-3"></div>
		</div>
	</section>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>