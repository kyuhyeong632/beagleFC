<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jooTopia.product.model.vo.Product"
    import="java.util.*, java.lang.*"
    %>
<%
	Product productList = (Product) session.getAttribute("productList");
	java.util.Date date = new java.util.Date();
	java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd");
	String startDay = dateFormat.format(date);
	String endDay = dateFormat.format(date);
	
	ArrayList<Product> list = new ArrayList<Product>();
	list.add(new Product("판매안함", "침실", "침대", "B00000001", "보송보송 침대", 300000, 0.2));
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<!-- <link rel="stylesheet" href="/jootopia/js/external/jquery-3.4.0.min.js"> -->
<link rel="stylesheet" href="/jootopia/css/admin/adminCommon.css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<title>JooTopia</title>
<style>

	
</style>
</head>
<body>

	<%@ include file="/views/common/adminNavigation.jsp" %>
	
	<section class="row">
		<%@ include file="/views/common/adminSideMenu.jsp" %>
		
		<div class="col-sm-10">
		<h3>상품목록</h3>
		<hr>
		
		<div id="listArea">
			전체 <a href="/jootopia/views/admin/product/productList.jsp">10</a>건  |  
			판매중 <a href="#">2</a>건  |
			판매안함 <a href="#">6</a>건  |
			상품미등록 <a href="#">2</a>건
		</div>
		<br>
		
		<div class="searchArea">
			<table id="searchBox"  border="1" align="center">
				<tr><th colspan="3" style="background: rgb(224, 224, 224); height: 35px;">　</th></tr>
				<tr>
					<td>검색 분류</td>
					<td colspan="2">
						&nbsp;<select id="searchCondition" >
							<option value="pName">상품명
							<option value="pCode">상품코드
							<option value="userName">주문자명
							<option value="userId">주문자 아이디
							<option value="phone">주문자 전화번호
						</select>
						<input type="search" placeholder="검색 단어를 입력하세요." width="20px">
					</td>
				</tr>
				<tr>
					<td>상품 카테고리</td>
					<td colspan="2">
						&nbsp;<select id="searchCategory" onchange="smallCategoty(this.value)">
							<option value="">- 대분류 -
							<option value="bedRoom">침실
							<option value="livingRoom">거실
							<option value="kitchen">주방
							<option value="study">서재
						</select>
						<select id="small">
							<option value="">- 중분류 -
						</select>
					</td>
				</tr>
				<tr>
					<td>상품 등록일</td>
					<td id="selectDate" colspan="2">
						&nbsp;<a href="#" class="btnDate" period="0"><span>오늘</span></a>
						<a href="#" class="btnDate" period="7"><span>7일</span></a>
						<a href="#" class="btnDate" period="30"><span>1개월</span></a>
						<a href="#" class="btnDate" period="90"><span>3개월</span></a>
						<a href="#" class="btnDate" period="365"><span>1년</span></a>
						<a href="#" class="btnDate" period="-1"><span>전체</span></a> &nbsp;&nbsp;
						<input type="date" id="startDate" name="startDate" class="date" value="<%= startDay %>"> ~ 
						<input type="date" id="endDate" name="endDate" class="date" value="<%= endDay %>">
					</td>
				</tr>
				<tr>
					<td>상품 상태</td>
					<td colspan="2">
						&nbsp;<input type="radio" name="pType" id="all"><label>전체</label>
						<input type="radio" name="pType" id=""><label>판매중</label>
						<input type="radio" name="pType" id=""><label>판매안함</label>
					</td>
				</tr>
			</table>
			
			<br>
			
			<div id="searchBtnArea" align="center">
				<input type="submit" value="검색" onclick="">
				<input type="reset" value="초기화" onclick="">
			</div>
		</div>
		
		<br><br><br><br>
		
		<span>상품 목록</span><br>
		<span>[총 <a><%= list.size() %></a>개]</span>
		
		<br>
		
		<form>
			<table id="searchList" border="1">
				<tr>
					<td colspan="9">
						<button onclick="pTypeChange('판매 등록')">판매 등록</button>&nbsp;
						<button onclick="pTypeChange('판매 안함')">판매 안함</button>&nbsp;
						<button onclick="pTypeChange('상품 삭제')">상품 삭제</button>
					</td>
				</tr>
				<tr>
					<th><input type="checkbox" class="allCheck"></th>
					<th>No</th>
					<th>상품상태</th>
					<th>상품분류</th>
					<th>상품코드</th>
					<th>상품이미지</th>
					<th>상품명</th>
					<th>판매가(원)</th>
					<th>할인가(%)</th>
				</tr>
			</table>
		</form>
	</div> <!-- col-sm-10 -->
		
	</section>
	
	<%@ include file="/views/common/adminFooter.jsp" %>
	
	<!--  -->
	
	<script>
		function smallCategoty(big) {
			
			var bedRoom = ["침대", "옷장", "화장대", "수납장"];
			var livingRoom = ["테이블", "거실장", "쇼파", "수납장"];
			var kitchen = ["식탁", "식탁의자", "수납장", "렌지대"];
			var study = ["책상", "책장", "사무용의자", "수납장"];
			
			if(big == "") {
				smallCategory = [];
			}else if(big == "bedRoom") {
				smallCategory = bedRoom;
			}else if(big == "livingRoom") {
				smallCategory = livingRoom;
			}else if(big == "kitchen") {
				smallCategory = kitchen;
			}else if(big == "study") {
				smallCategory = study;
			}
			
			$("#small").empty();
			$("#small").append("<option value=''>- 중분류 -</option>");
			
			for(var i = 0; i < smallCategory.length; i++) {
				var option = $("<option>" + smallCategory[i] + "</option>");
				$("#small").append(option);
			}
		}
		
		$(".btnDate").click(function() {
			
			$("#selectDate>a").removeClass();
			$("#selectDate>a").addClass("btnDate");
			$(this).toggleClass("selected");
			
		})
		
		function pTypeChange(text) {
			var answer = window.confirm("선택한 상품을 " + text + " 하시겠습니까?");
			
			if(answer) {
				alert("해당상품을 " + text + " 처리 하였습니다.");
			}
		}
		
		function select() {
			console.log("실행");
			location.href="<%= request.getContextPath() %>/selectProduct";
		}
		
		$(function() {
			$(".btnDate").click(function() {
				
				/* 날짜처리하기 (아직 안했음) */
				
				/* var year = this.args.year == null ? 0 : Number(this.args.year);
			    var month = this.args.month == null ? 0 : Number(this.args.month);
			    var day = this.args.day == null ? 0 : Number(this.args.day);
			    var result = new Date();

			    result.setYear(result.getFullYear() + year);
			    result.setMonth(result.getMonth() + month);
			    result.setDate(result.getDate() + day);
			    return this.formatDate(result, "-");

				var changeDay = $("#endDate").val() + $(this).attr("period");
				console.log(changeDay);
				$("#endDate").val(changeDay); */
			})
		})
	</script>
	
</body>
</html>