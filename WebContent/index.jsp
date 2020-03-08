<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이어드림</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/reset.css"/>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/js/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/js/slick/slick-theme.css"/>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/index.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
</head>
<body>
	<!-- 메인 메뉴로 연결  -->
	<div> 
		<%@ include file="views/common/mainmenu.jsp" %>
	</div>
	<div class="imageBar"></div>
	<div class="firstBox" id="slick">
		<div class="slideBox"></div>
		<div class="slideBox"></div>
		<div class="slideBox"></div>
	</div>
	<div class="bigBox">
		<div class="conBox">
			<% if(loginUser != null) { /* 로그인 한 경우 */ %>
				<div class="indexBox">
					<a href="<%=request.getContextPath()%>/get.ist">
						<img src="<%= request.getContextPath() %>/images/myIdeal.png">
					</a>
				</div>
				<div class="indexBox">
					<a href="<%= request.getContextPath() %>/list.bc">
						<img src="<%= request.getContextPath() %>/images/bestCouple.png">
					</a>
				</div>
				<% if(loginUser.getGrade() == 0 || loginUser.getGrade() == 2) { /* 로그인 + 등급이 정회원, 운영자 일 경우*/%>
					<div class="indexBox">
						<a href="<%=request.getContextPath()%>/list.hh?userNo=<%= loginUser.getUserNo() %>">
							<img src="<%= request.getContextPath() %>/images/history.png">
						</a>
					</div>
				<% } else { /* 등급이 준회원일 경우 */ %>
					<div class="indexBox">
						<a href='<%= request.getContextPath() %>/views/account/accountLoginForm.jsp' onclick="alert();">
							<img src="<%= request.getContextPath() %>/images/history.png">
						</a>
					</div>
				<% } %>
				<div class="indexBox">
					<a href="<%=request.getContextPath()%>/views/myPage/user/memberGradeUpForm.jsp">
						<img src="<%= request.getContextPath() %>/images/upGrade.png">
					</a>
				</div>
			<% } else { /* 로그인 하지 않은 경우 */%>
				<div class="indexBox">
					<a href='<%= request.getContextPath() %>/views/account/accountLoginForm.jsp' onclick="question();">
						<img src="<%= request.getContextPath() %>/images/myIdeal.png">
					</a>
				</div>
				<div class="indexBox">
					<a href="<%= request.getContextPath() %>/list.bc">
						<img src="<%= request.getContextPath() %>/images/bestCouple.png">
					</a>
				</div>
				<div class="indexBox">
					<a href='<%= request.getContextPath() %>/views/account/accountLoginForm.jsp' onclick="question();">
						<img src="<%= request.getContextPath() %>/images/history.png">
					</a>
				</div>
				<div class="indexBox">
					<a href='<%= request.getContextPath() %>/views/account/accountLoginForm.jsp' onclick="question();">
						<img src="<%= request.getContextPath() %>/images/upGrade.png">
					</a>
				</div>
			<% } %>
		</div>
	</div>
<%@ include file="views/common/footer.jsp"%>
</body>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/slick/slick.min.js"></script>
<script>
$(document).ready(function(){
    $('#slick').slick({
    	infinite: true, 	/* 맨끝이미지에서 끝나지 않고 다시 맨앞으로 이동 */         
    	slidesToShow: 1, 	/* 화면에 보여질 이미지 갯수*/        
    	slidesToScroll: 1,  /* 스크롤시 이동할 이미지 갯수 */         
    	autoplay: true, 	/* 자동으로 다음이미지 보여주기 */         
    	arrows: false, 		/* 화살표 */         
    	dots:true, 			/* 아래점 */         
    	autoplaySpeed: 1900,	/* 다음이미지로 넘어갈 시간 */         
    	speed: 700, 		/* 다음이미지로 넘겨질때 걸리는 시간 */         
    	pauseOnHover:true, 	/* 마우스 호버시 슬라이드 이동 멈춤 */
    	//vertical:true,	/* 세로방향으로 슬라이드를 원하면 추가하기// 기본값 가로방향 슬라이드*/ 
    });
  });
  
	function question(){
		alert("로그인 후 사용 가능합니다.");
	}
	function alert() {
		alert("정회원 서비스입니다.");
	}
</script>
</html>