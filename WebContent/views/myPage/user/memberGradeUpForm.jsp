<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정회원 등업</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/SelectAll.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<style>
.gradeBtn{
	font-size: 16px;
	padding: 10px 20px 10px 20px;
	margin: 20px;
}

#inputImage{
	display: none;
}

</style>
<body>
	<%@ include file="../../common/mainmenu.jsp"%>
	<div class="outer">
		<div class="wrapper">
			<nav>
				<div class="nav">
					<div class="leftMenuTitle">마이페이지</div>
					<ul>
						<li class="leftMenu memberGradeUp"><a href="<%= request.getContextPath() %>/views/myPage/user/memberGradeUpForm.jsp">정회원 등업</a></li>
						<li class="leftMenu"><a href="">기본정보</a></li>
						<li class="leftMenu"><a href="">나의 프로필</a></li>
						<li class="leftMenu"><a href="">이상형 정보</a></li>
						<li class="leftMenu "><a href="">작성글 조회</a></li>			
						<li class="leftMenu heartHistory"><a href="<%= request.getContextPath() %>/list.hh">하트 히스토리</a></li>
						<% if(loginUser != null && loginUser.getGrade() == 0){ %>
							<br>
							<li class="leftMenu admin memberManage">
								<a href="<%=request.getContextPath()%>/manage.mem">회원 관리</a>
							</li>
							<li class="leftMenu admin boardManage">
								<a href="<%=request.getContextPath()%>/manage.bo">게시물 관리</a>
							</li>
						<% } %>
					</ul>
				</div>
			</nav>
			<div class="main">
				<div class="pageTitle">
					<h2>정회원 등업</h2>
				</div>
				<div class="information">
					정회원 가입하기 버튼을 누르면 결제페이지로 이동합니다.<br>
					결제 후...<br>
				</div>
				<div class="contents">
					<input type="button" class="defaultBtn gradeBtn" id="payment" value="정회원 가입하기">	
					<div id="imageView">
						<img src="<%= request.getContextPath() %>/images/common/memGradeUp.png" width="80%" height="80%">
					</div>			
				</div>
				<%-- <% if(loginUser != null && loginUser.getGrade() == 0){ %>
					<div class="btnBox btnC" >
					<input type="file" id="inputImage" accept="img/*" required multiple>
					<input type="button" class="defaultBtn imageBtn" id="imageChange" value="표이미지 변경">
					</div>
				<% } %> --%>
			</div>
		</div>
	</div>
	<script>
		/* $(function(){
			$('#imageChange').click(function(){
				$("#inputImage").click();
			});
		}); */
		var IMP = window.IMP; // 생략가능
		IMP.init('imp40839518');
		
		$("#payment").click(function(){
			IMP.request_pay({
			    pg : 'html5_inicis', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트',
			    amount : 1000,
			    buyer_email : 'iamport@siot.do',
			    buyer_name : '구매자이름',
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '서울특별시 강남구 삼성동',
			    buyer_postcode : '123-456',
			    m_redirect_url : 'http://www.iamport.kr/mobile/landing'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			});
		});
	</script>
</body>
</html>