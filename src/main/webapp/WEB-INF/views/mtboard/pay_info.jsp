<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% Object objId = session.getAttribute("loginid");
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>정보확인｜결제</title>
<c:import url="../layout/header.jsp" /> 

<style type="text/css">

.mento_intro {
    background-color: #aacde5;
    height: 200px;
}

.mento_intro_content {
    position: relative;
    padding: 84px 2rem 38px;
    text-align: center;
}

.all_content {
    margin: 260px 150px 0px 150px;
    height: 1100px;
}

tbody{
	font-size: 18px;
}

.pay_content {
	width: 50%;
    margin: 0 auto;
    font-size: 15px;
    padding: 30px;
}

.refund_txt, span {
	line-height: 2;
}

a {
    color: white;
    cursor: pointer;
    float: right;
    margin-top: 65px;
}

.btn {
    border: solid 1px #6cc4dc;
    background-color: #6cc4dc;
}

.btn:hover {
    border: solid 1px #6cc4dc;
    background-color: #6cc4dc;
}
    
.total_price {
	font-size: 20px;
}

.btn_back {
	 border: solid 1px #fff;
     background-color: #fff;
     color: #696969;
     text-decoration: none;
     font-size: 18px;
     margin-top: 70px;
     margin-right: 20px;
}

.btn_back:hover {
	 border: solid 1px #fff;
    background-color: #fff;
    color: #696969;
    text-decoration: none;
}

.payBtnZip {

	margin-top: 80px;
}

</style>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
function requestPay() {
	var IMP = window.IMP;
    IMP.init("imp20786357"); 
    console.log(IMP)
	var totalPrice = ${info.fee}
	console.log('${applymnt}')

	IMP.request_pay({ 
        pg: "kakaopay",
        pay_method: "kakaopay",
        merchant_uid: 'merchant_' + new Date().getTime(),
        name: "SkyCloud",
        amount: 100,
        buyer_email: '${email}',
        buyer_name: '${name}',
        buyer_tel: '${phone}'
    }, function (rsp) { // callback
    	console.log(rsp);
    
        if (rsp.success) {
        	var msg = '결제가 완료되었습니다.';
        	 msg += '고유ID : ' + rsp.imp_uid;
             msg += '상점 거래ID : ' + rsp.merchant_uid;
             msg += '결제 금액 : ' + rsp.paid_amount;
             msg += '카드 승인번호 : ' + rsp.apply_num;
             
        	$.ajax({
	  	        type : "post",
	  	        url : "/mtboard/payMnt",
	  	    	data : { 
	  	    		mtboardNo : '${applymnt.mtboardNo}',
	  	    		stTime: '${applymnt.stTime}',
	  	    		edTime: '${applymnt.edTime}',
	  	    		mntDate: '${applymnt.mntDate}',
	  	    		mntContent: '${applymnt.mntContent}',
	  	    		totalPrice: totalPrice,
	  	    	}, success : function(data){
	  	    		if(data === 'success'){
	  	    			alert('결제가 완료되었습니다. \n결제 확인은 마이페이지에서 가능합니다.')
	  	    			document.location.href="/mystudy";
	  	    		}else {
						alert('오류가 발생하였습니다.')	  	    			
	  	    		}
	  	      	}, error: function(e){
	  	      		console.log(e)
	  	      	}
	  	    			
  	    	}); 
        }else {
        		var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
        	}
        	console.log(msg);
            
            
        }); 
} 
</script>
</head>
<body>


<main id="main">
<!-- 상단 이미지바 -->
<div class="mento_intro">
	<div class="mento_intro_content">
			<h1>☁️ ☁️ ☁️</h1>
	</div>
</div>

<main class="all_content">
<div class="pay_content">
<div class="refund_wrap">
<h2 style="margin-bottom: 80px;">✔️ 정보 확인</h2>
<table class="info_table" style="line-height: 2.5">
<tr>
	<td class="info_name" scope="row" style="width: 50%">🙋🏻‍♀️ 멘토</td>
	<td>${info.mentorId} 님</td>
</tr>
<tr>
	<td class="info_name" scope="row">📅 일정</td>
	<td> ${applymnt.mntDate} / ${applymnt.stTime} ~ ${applyMnt.edTime}</td>
</tr>
<tr>
	<td class="info_name" scope="row">⏲ 진행 시간</td>
	<td id="time">${info.time}시간 </td>
</tr>
<tr>
	<td class="info_name" scope="row">🗨️ 멘토에게 남길 메세지</td>
	<td>${applymnt.mntContent }</td>
</tr>
</table>
<br><br>

<hr>

<br><br>

<div class="total_price">

<span>결제금액</span>
<span style="float: right">${info.fee} 원</span>
</div>
<span style="float: right">${info.price} * ${info.time}시간</span>
<div class= "payBtnZip">
<a class="btn btn-primary" type="button" onclick="requestPay()">결제하기</a>
<a class="btn_back"type="button" >취소</a>
</div>

</div><!-- pay_content 끝 -->
</div>
</main>
</main>
















<c:import url="../layout/footer.jsp" /> 
</body>
</html>