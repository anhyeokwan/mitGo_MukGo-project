<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>GOGO마켓 상세</title>
</head>
<body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="70">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,1,200" />
   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
	<link rel="stylesheet" href="/resources/css/index/owl.theme.default.min.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="/resources/css/index/owl.carousel.min.css">
	<link rel="stylesheet" href="/resources/css/market/marketDetail.css">
	
	<div class="contentWrap" style="font-family:Gowun Dodum;">
		<div class="directoryDiv">홈 > 마켓GOGO > 밀키트</div>
         	<div class="infoDiv1">
         		<img src="/resources/upload/market/${ma.PImg }" class="pImg">
         		<div class="titleDiv">
		            <span class="categorySpan"></span>
		            <span class="storeNameSpan">${ma.PName}</span>
		            
		            <a class="material-symbols-rounded share pointer" id="share" href="javascript:shareMessage()">share</a>
         		</div>
         		<div class="tableDiv" >
         		
         			<table class="productTable">
         				<tr>
         					<th>카테고리</th>
         					<td colspan="4" class="categoryTd"></td>
         				</tr>
         				<tr>
         					<th>배송</th>
         					<td colspan="4">무료배송</td>
         				</tr>
         				<tr>
         					<th>판매단위</th>
         					<td colspan="4">1개</td>
         				</tr>
         				<tr>
         					<th>알레르기 정보</th>
         					<td colspan="4">본 제품은 돼지고기, 닭고기, 우유, 계란을 사용한 제품과
         					같은 제조시설에서 제조하고 있습니다.</td>
         				</tr>
         				<tr>
         					<th>유통기한</th>
         					<td colspan="4">수령일 포함 최소 3일 남은 제품을 보내드립니다.</td>
         				</tr>
         				<tr>
         					<th>수량 선택</th>
		                     <td style="width:30px;">
		                        <button class="w3-button w3-circle w3-teal" id="down" style="width: 35px; height: 35px; padding: 0;">-</button>
		                     </td>
		                     <td class="peopleTd" style="width:30px;">
		                        <span class="countNum" style="width:30px;">1</span>
		                     </td>
		                     <td style="width:30px;">
		                        <button class="w3-button w3-circle w3-teal" id="up" style="width: 35px; height: 35px; padding: 0;">+</button>
		                     </td>
		                     <td><td>
         				</tr>
         			</table>
         		</div>
         		<div class="priceDiv" >
         			<div class="priceDiv1">
	         			<span>총 금액: </span>
	         			<span class="priceSpan"></span>
	         			<span>원</span>
         			</div>
         		</div>
         		<c:choose>
         			<c:when test="${empty sessionScope.m && empty sessionScope.o}">
                        <a href="/loginFrm.do">
	                         <button id="loginMarketBtn">로그인</button>
                      	</a>
         			</c:when>
         			<c:otherwise>
         			<form action="">
         				<div class="btnWrap">
		         			<button type="submit" class="cartBtn">장바구니</button>
		         			<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
		         			<input type="hidden" name="allPrice" class="allPrice">
		         			<input type="hidden" name="pNumber" class="pNumber">
		         			<input type="hidden" name="count" class="count">
		         		</div>
		         	</form>
         			</c:otherwise>
         		</c:choose>
         	</div>
         	
	</div> <!-- contentWrap 종료 -->
	
	<!-- 상품 상세 내용 div -->
	<div class="contentWrap2">
		
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />


    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.0/kakao.min.js" integrity="sha384-PFHeU/4gvSH8kpvhrigAPfZGBDPs372JceJq3jAXce11bVA6rMvGWzvP4fMQuBGL" crossorigin="anonymous"></script>
    <script>
    	Kakao.init('c089c8172def97eb00c07217cae17495');
    </script>


	<script>
    //---------- 인원수 늘리기
    var countNumVal = $(".peopleTd").text();
    var price = "${ma.PPrice}";
    $(".priceSpan").text(countNumVal*price);
    let count = 1;
	
    $("#up").on("click", function(e) {
    	count++;
    	$(".countNum").text(count);
    	var countNumVal = $(".peopleTd").text();
        $(".priceSpan").text(countNumVal*price);
    });
          
    $("#down").on("click", function(e) {
    	if(count==1){
    		return false;
    	}
   	 	count--;
    	$(".countNum").text(count);
    	var countNumVal = $(".peopleTd").text();
        $(".priceSpan").text(countNumVal*price);
    }); 
    

    var categoryNum = "${ma.PCategory}";
    console.log(categoryNum);
	if(categoryNum=8){
		$(".categorySpan").text("[디저트]");
		$(".categoryTd").text("디저트");
	}else if(categoryNum=9){
		$(".categorySpan").text("[기타]");
		$(".categoryTd").text("기타");
	}else if(categoryNum=10){
		$(".categorySpan").text("[밀키트]");
		$(".categoryTd").text("밀키트");
	}else if(categoryNum=11){
		$(".categorySpan").text("[냉동식품]");
		$(".categoryTd").text("냉동식품");
	}
	
	
	var pNo = "${ma.PNo}";
	//---------- 공유하기 버튼
	Kakao.Share.createDefaultButton({
	  container: '#share',
	  objectType: 'text',
	  text:
	    '우리집도 맛집이라고? 이제는 집에서도 즐기자!',
	  link: {
	    mobileWebUrl: 'http://192.168.10.26/marketDetail.do?pNo='+pNo,
	    webUrl: 'http://192.168.10.26/marketDetail.do?pNo='+pNo
	  },
	});
	
	
	//장바구니 클릭 시 hidden으로 넘겨주는 값
	$(".cartBtn").on("click", function(){
	 	$(".allPrice").attr("value",count*price);
	 	$(".pNumber").attr("value",pNo);
	 	$(".count").attr("value",count);
	});
		</script>
</body>
</html>