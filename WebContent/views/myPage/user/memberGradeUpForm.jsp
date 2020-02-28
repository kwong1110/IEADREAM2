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
			    name : '이어드림(IEADREAM) 정회원(365일) 이용권 구매',
			    amount : 1000,
			    buyer_email : '<%= loginUser.getEmail() %>',
			    buyer_name : '<%= loginUser.getUserName() %>',
			    buyer_tel : '<%= loginUser.getPhone() %>',
			   /*  buyer_addr : '서울특별시 강남구 삼성동', */
			   /*  buyer_postcode : '123-456', */
			    m_redirect_url : 'http://www.iamport.kr/mobile/landing'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.\n';
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '    카드 승인번호 : ' + rsp.apply_num;
			        alert(msg);
			        
			        $.ajax({
						url: '<%= request.getContextPath() %>/payment.mem',
						type: 'get',
						data: {userNo: '<%= loginUser.getUserNo() %>'},
						success: function(data){
							if(data > 0){
						        var msg2 = '<%= loginUser.getUserName() %>님의 등급이 정회원으로 변경 되었습니다.'; 
						        alert(msg2);
							} else {
								alert("결제완료 후 회원등급 변경이 정상적으로 되지 않았습니다.\n 관리자에게 문의해주세요.");
							}
						}
					});			      
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			        alert(msg);
			    }
			});
		});
	</script>
</body>
</html>