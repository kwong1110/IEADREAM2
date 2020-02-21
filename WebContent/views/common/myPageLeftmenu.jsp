<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* .admin{
		display: none;
	} */
</style>
</head>
<body>

		<!-- 실험 페이지... -->

	<div class="nav">
		<div class="leftMenuTitle">마이페이지</div>
		<ul>
			<li class="leftMenu memberGradeUp"><a href="<%= request.getContextPath() %>/views/myPage/user/memberGradeUpForm.jsp">정회원 등업</a></li>
			<li class="leftMenu"><a href="">기본정보</a></li>
			<li class="leftMenu"><a href="">나의 프로필</a></li>
			<li class="leftMenu"><a href="">이상형 정보</a></li>
			<li class="leftMenu "><a href="">작성글 조회</a></li>			
			<li class="leftMenu heartHistory"><a href="<%= request.getContextPath() %>/list.hh">하트 히스토리</a></li>
			<br>
			<li class="leftMenu admin memberManage">
				<a href="<%=request.getContextPath()%>/manage.mem">회원 관리</a>
			</li>
			<li class="leftMenu admin boardManage">
				<a href="<%=request.getContextPath()%>/views/myPage/admin/boardManageForm.jsp">게시물 관리</a>
			</li>
			<li class="leftMenu admin partyManage">
				<a href="<%=request.getContextPath()%>/views/myPage/admin/partyManageForm.jsp">파티 관리</a>
			</li>	
		</ul>
	</div>

	<script>
		
	</script>
</body>
</html>