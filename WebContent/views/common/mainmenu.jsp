<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="account.model.vo.Account" %>
<%
	Account loginUser = (Account)session.getAttribute("loginUser");

	String msg = (String)request.getAttribute("msg");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/reset.css" />
<title>Insert title here</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<style>
	@font-face { font-family: 'LotteMartHappy'; font-style: normal; font-weight: 400; src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartHappy/LotteMartHappyMedium.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartHappy/LotteMartHappyMedium.woff') format('woff'); } @font-face { font-family: 'LotteMartHappy'; font-style: normal; font-weight: 700; src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartHappy/LotteMartHappyBold.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartHappy/LotteMartHappyBold.woff') format('woff'); } .lottemarthappy * { font-family: 'LotteMartHappy', sans-serif; }

	html{
		font-family: 'LotteMartHappy'; font-style: normal;
	}
	* {margin: 0; padding: 0; }
	body{background:white;}
	
	.header {
	height: 100%;
	}
            
	li {list-style: none;}
	            
	.logo {margin: 50px 0; font-size: 30px; text-align: center;}
	            
	.topMenu {
		width: 100%; 
		text-align: center; 
		padding: 25px 0 25px 0;
	}
	
	.topMenu a{
		text-decoration: none;
		color: black;
	}
	.topMenu:after {content: ""; display: block; clear: both; }
	.menu01>li {float: left; width: 12%; vertical-align: middle;}
	.menu01 span {font-size: 20px; font-weight: bold; vertical-align: middle; padding: 20px 20px 10px 20px; border-bottom: 3px solid pink;}
	
	.dept01 {display: none; padding: 20px 0;}
	            
	#nop {float: none; margin-top: 15px;}
	#nop>a{color:black;}
	            
	.none:after {content: ""; display: block; clear: both; }

	img{width: 60%; height: 50%; display: inline;}
	#loginPicture{width:20px; height: 20px; border-radius: 100%;}
	#alert{position: relative; left: -20px;}
	#redDot{width:15px; height:15px; border-radius:100%;}
	.imageBox child{margin:0;}
	
	.s-menu{
		margin-top:1%;
		color: black;
		padding: 10px 0px 10px 0px;
	}
</style>
</head>
<body>
	<div class="header">
		<header>
			<nav>
				<div class="topMenu" style="cursor: pointer;">
					<ul class="menu01">
						<li>
							<img src='<%=request.getContextPath()%>/images/common/logo.png' onclick="goIndex();">
						</li>
						<li class="s-menu"><span onclick="goIeaDream();">이어드림</span>
							<ul class="dept01">
								<li id="nop"><a href="<%=request.getContextPath()%>/views/ieaDream/aboutCEO.jsp">CEO소개</a></li>
								<li id="nop"><a href="<%=request.getContextPath()%>/views/ieaDream/aboutUs.jsp">회사 소개</a></li>
								<li id="nop"><a href="<%=request.getContextPath()%>/views/ieaDream/wayToCome.jsp">오시는 길</a></li>
							</ul>
						</li>
						<li class="s-menu"><span onclick="goIdealType();">이상형</span>
							<ul class="dept01">
								<li id="nop"><a href="<%=request.getContextPath()%>/get.mc">이상형 매칭</a></li>
								<li id="nop"><a href="<%=request.getContextPath()%>/get.ups">이용자 취향 통계</a></li>
							</ul>
						</li>
						
						<li class="s-menu"><span onclick="goCoupleStory();">커플이야기</span>
							<ul class="dept01">
								<li id="nop"><a href="<%= request.getContextPath() %>/list.bc">베스트 커플</a></li>
								<li id="nop"><a href="<%= request.getContextPath() %>/list.wac">우리 커플 됐어요</a></li>
							</ul>
						</li>
						<li class="s-menu"><span onclick="goQuestionBoard();">문의게시판</span>
							<ul class="dept01">
								<% if(loginUser != null && loginUser.getGrade() != 0){ %>
									<li id="nop"><a href="<%=request.getContextPath() %>/list.qu?userNo=<%= loginUser.getUserNo() %>">1:1문의</a></li>
								<% } else if(loginUser != null && loginUser.getGrade() == 0){%>
									<li id="nop"><a href="<%=request.getContextPath() %>/Mlist.qu">1:1 문의</a></li>
								<% }else{%>
								<li id="nop"><a href="<%=request.getContextPath() %>/views/account/accountLoginForm.jsp" onclick="question();">1:1문의</a>
								<% } %>
								<li id="nop"><a href="<%=request.getContextPath() %>/list.faq">FAQ</a></li>
							</ul>
						</li>
						
						<li class="s-menu"><span onclick="goLoveParty();">정회원서비스</span>
							<ul class="dept01">
								<% if(loginUser != null) { %> <!-- 로그인만 했을 때 -->
									<li id="nop"><a href="<%=request.getContextPath()%>/views/myPage/user/memberGradeUpForm.jsp">정회원 등업</a></li>
									<% if(loginUser.getGrade() == 2 || loginUser.getGrade() == 0) {%> <!-- 정회원/관리자  -->
										<li id="nop"><a href="<%=request.getContextPath()%>/list.hh?userNo=<%= loginUser.getUserNo() %>">하트 히스토리</a></li>
									<% } %>
								<% } else { %> <!-- 로그인 안했을 때 -->
									<li id="nop"><a href='<%= request.getContextPath() %>/views/account/accountLoginForm.jsp' onclick="question();">정회원 등업</a></li>
									<li id="nop"><a href='<%= request.getContextPath() %>/views/account/accountLoginForm.jsp'' onclick="question();">하트 히스토리</a></li>								
								<% } %>
							</ul>
						</li>
						
						<li class="s-menu" id="myPage"><span onclick="">마이페이지</span>
							<ul class="dept01">	
								<% if(loginUser != null) { // login상태일 경우 접근 가능 %>
								<%-- <li id="nop"><a href="<%=request.getContextPath()%>/views/myPage/user/memberGradeUpForm.jsp">정회원 등업</a></li> --%>
								<li id="nop"><a href="<%= request.getContextPath()%>/selectProfileServlet">기본정보</a></li>	
								<li id="nop"><a href="<%= request.getContextPath() %>/select.ui">나의 프로필</a></li>
								<li id="nop"><a href="<%= request.getContextPath() %>/select.up">이상형 정보</a></li>
								<li id="nop">
									<a href="<%=request.getContextPath()%>/list.mwl?userNo=<%= loginUser.getUserNo() %>">작성글 조회</a>
								</li>
									<% if(loginUser.getGrade() == 2 || loginUser.getGrade() == 0) { // 로그인 + 등급이 관리자 혹은 정회원 %>
								<%-- <li id="nop">
									<a href="<%=request.getContextPath()%>/list.hh?userNo=<%= loginUser.getUserNo() %>">하트 히스토리</a>
								</li> --%>
									<% } %>
								<% } else { // 위 조건들이 하나도 맞지 않을 경우 %>
									<%-- <li id="nop"><a href='<%= request.getContextPath() %>/views/account/accountLoginForm.jsp' onclick="question();">정회원 등업</a></li> --%>
									<li id="nop"><a href='<%= request.getContextPath() %>/views/account/accountLoginForm.jsp' onclick="question();">기본정보</a></li>
									<li id="nop"><a href='<%= request.getContextPath() %>/views/account/accountLoginForm.jsp' onclick="question();">나의 프로필</a></li>
									<li id="nop"><a href='<%= request.getContextPath() %>/views/account/accountLoginForm.jsp' onclick="question();">이상형 정보</a></li>
									<li id="nop">
										<a href='<%= request.getContextPath() %>/views/account/accountLoginForm.jsp'' onclick="question();">작성글 조회</a>
									</li>
									<%-- <li id="nop">
										<a href='<%= request.getContextPath() %>/views/account/accountLoginForm.jsp'' onclick="question();">하트 히스토리</a>
									</li> --%>
								<% } %>
								
								<% if(loginUser != null && loginUser.getGrade() == 0){ %>
									<br>
									<li id="nop">
										<a href="<%=request.getContextPath()%>/manage.mem">회원 관리</a>
									</li>
									<li id="nop">
										<a href="<%=request.getContextPath()%>/manage.bo">게시물 관리</a>
									</li>
									<li id="nop">
										<a href="<%=request.getContextPath() %>/adminList.faq">FAQ 관리</a>
									</li>
								<% } %>
							</ul>
						</li>
						<% if(loginUser == null) { %>
						<li>
							<span id="loginBtn" onclick="login();" style="font-size: 10px; padding: 10px;">login</span> 
							<span id="MemberJoinBtn" onclick="memberJoin();" style="font-size: 10px; padding: 10px;">sign up</span>
						</li>
						<% } else { %>
						<li style="width: 10%; height: 10%">
							<ul>
								<li style="margin: 5px;">
									<span class="imageBox" onclick="myPage();" style="border-bottom: none;">
										<img id="loginPicture" src='<%=request.getContextPath()%>/images/common/user.png' onclick="goUpdateProfile();"> 
									</span> 
									<%-- <span id="alert"> <img id="redDot" src='<%=request.getContextPath()%>/images/common/redDot.png'></span> --%>
							 	</li>
							 	<li>
									<span onclick="myPage();" style="padding: 3px;"><%= loginUser.getUserName() %>님</span>
								</li>
								<li style="margin: 5px;">
									<span id="logoutBtn" onclick="logout();" style="font-size: 10px; padding: 10px; border-bottom: none;">로그아웃</span>
								</li>
							</ul>
						</li>
						<% } %>
					</ul>
				</div>
			</nav>
		</header>
	</div>
	<div class="none">

	</div>
	<script>
		$(document).on('mouseenter', '.topMenu span', function() {
			$('.dept01').slideDown(300)
		});
		$(document).on('mouseleave', '.topMenu', function() {
			$('.dept01').slideUp(300)
		});

	    function login(){
				location.href='<%= request.getContextPath() %>/views/account/accountLoginForm.jsp';
			}
	    
		function logout(){
			location.href='<%= request.getContextPath() %>/logout.me';
		}
	    
		function memberJoin(){
			location.href="<%= request.getContextPath()%>/views/account/joinAccountForm.jsp";
		}
		
		function myPage(){
			location.href="<%= request.getContextPath()%>/selectProfileServlet";
		}
			
		var msg = "<%= msg %>";
		
		$(function(){
			if(msg != "null"){
				alert(msg);
			}
		});
		
		function goIndex(){
			location.href="<%= request.getContextPath()%>/index.jsp";
		}
		
		function question(){
			alert("로그인 후 사용 가능합니다.");
			<%-- location.href="<%= request.getContextPath()%>/views/account/accountLoginForm.jsp"; --%>
		}
				
	</script>
</body>
</html>