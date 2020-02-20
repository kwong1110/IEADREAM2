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
	* {margin: 0; padding: 0; }
	body{background-color:  rgb(250, 212, 216); width: 100%; margin: 0 auto;}
	
	.header {
	height: 100%; background-color: white; 
	box-shadow: 1px 0.5px 1px 1px gray;
	}
            
	li {list-style: none;}
	            
	.logo {margin: 50px 0; font-size: 30px; text-align: center;}
	            
	.topMenu {
		width: 100%; 
		text-align: center; 
		padding: 25px;
	}
	
	.topMenu a{
		text-decoration: none;
		color: black;
	}
	.topMenu:after {content: ""; display: block; clear: both; }
	.menu01>li {float: left; width: 12%; vertical-align: middle;}
	.menu01 span {font-size: 20px; font-weight: bold; vertical-align: middle; padding: 10px}
	
	.dept01 {display: none; padding: 20px 0;}
	            
	#nop {float: none;}
	            
	.none:after {content: ""; display: block; clear: both; }

	img{width: 60%; height: 50%; display: inline;}
	#loginPicture{width:20px; height: 20px; border-radius: 100%;}
	#alert{position: relative; left: -20px;}
	#redDot{width:15px; height:15px; border-radius:100%;}
	.imageBox child{margin:0;}
	
	.s-menu{margin-top:1%;}
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
								<li id="nop"><a href="">회사 소개</a></li>
								<li id="nop"><a href="<%=request.getContextPath()%>/views/ieaDream/wayToCome.jsp">오시는 길</a></li>
							</ul>
						</li>
						<li class="s-menu"><span onclick="goIdealType();">이상형</span>
							<ul class="dept01">
								<li id="nop"><a href="">이상형 매칭</a></li>
								<li id="nop"><a href="">이상형의 이상형 찾기</a></li>
							</ul>
						</li>
						<li class="s-menu"><span onclick="goLoveParty();">러브파티</span>
							<ul class="dept01">
								<li id="nop"><a href="">베스트 후기</a></li>
								<li id="nop"><a href="">러브파티</a></li>
								<!-- views/loveParty/partyReview/partyReviewListView.jsp -->
								<li id="nop"><a href="<%=request.getContextPath()%>/list.pr">파티참여 후기</a></li>
							</ul>
						</li>
						<li class="s-menu"><span onclick="goCoupleStory();">커플이야기</span>
							<ul class="dept01">
								<li id="nop"><a href="<%= request.getContextPath() %>/list.bc">베스트 커플</a></li>
								<li id="nop"><a href="">우리 커플 됐어요</a></li>
							</ul>
						</li>
						<li class="s-menu"><span onclick="goQuestionBoard();">문의게시판</span>
							<ul class="dept01">
								<% if(loginUser != null){ %>
									<li id="nop"><a href="<%=request.getContextPath() %>/list.qu?userNo=<%= loginUser.getUserNo() %>">1:1</a></li>
								<% } else {%>
									<li id="nop"><a href="<%=request.getContextPath() %>/list.qu">1:1</a></li>
								<% } %>
								<li id="nop"><a href="<%=request.getContextPath() %>/list.faq">FAQ</a></li>
								<li id="nop"><a href="<%=request.getContextPath() %>/adminList.faq">FAQ-admin</a></li>
							</ul>
						</li>
						
						<li class="s-menu"><span onclick="">마이페이지</span>
							<ul class="dept01">							
								<li id="nop"><a href="<%=request.getContextPath()%>/views/myPage/user/memberGradeUpForm.jsp">정회원 등업</a></li>
								<li id="nop"><a href="">기본정보</a></li>
								<li id="nop"><a href="">나의 프로필</a></li>
								<li id="nop"><a href="">이상형 정보</a></li>
								<li id="nop">
									<a href="<%=request.getContextPath()%>/views/myPage/user/myWritingListForm.jsp">작성글 조회</a>
								</li>
								<li id="nop">
									<a href="<%=request.getContextPath()%>/list.hh">하트 히스토리</a>
								</li>
							</ul>
						</li>
						<% if(loginUser == null) { %>
						<li>
							<span id="loginBtn" onclick="login();" style="font-size: 10px; padding: 10px;">login</span> 
							<span id="MemberJoinBtn" onclick="memberJoin();" style="font-size: 10px; padding: 10px;">sign in</span>
						</li>
						<% } else { %>
						<li style="width: 10%; height: 10%">
							<ul>
								<li style="margin: 5px;">
									<span class="imageBox">
										<img id="loginPicture" src='<%=request.getContextPath()%>/images/common/user.png' onclick="goUpdateProfile();"> 
									</span> 
									<%-- <span id="alert"> <img id="redDot" src='<%=request.getContextPath()%>/images/common/redDot.png'></span> --%>
							 	</li>
							 	<li>
									<span><%= loginUser.getUserName() %>님</span>
								</li>
								<li style="margin: 5px;">
									<span id="logoutBtn" onclick="logout();" style="font-size: 10px; padding: 10px;">로그아웃</span>
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
			
		var msg = "<%= msg %>";
		
		$(function(){
			if(msg != "null"){
				alert(msg);
			}
		});
		
		
		<%-- var adminLogin = <%= loginUser.getGrade() %>;
		
		$(function(){
			if(adminLogin == 0){
				<li id="nop">
					<a href="<%=request.getContextPath()%>/views/myPage/admin/memberManageForm.jsp">회원 관리</a>
				</li>
				<li id="nop">
					<a href="<%=request.getContextPath()%>/views/myPage/admin/boardManageForm.jsp">게시물 관리</a>
				</li>
				<li id="nop">
					<a href="<%=request.getContextPath()%>/views/myPage/admin/PartyManageForm.jsp">파티 관리</a>
				</li>
				
			}
		}); --%>
		
	</script>
</body>
</html>