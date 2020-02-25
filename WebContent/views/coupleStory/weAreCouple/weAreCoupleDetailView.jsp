<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*, java.util.*"%>
<%
	Board b = (Board)request.getAttribute("board");
	ArrayList<Photo> fileList = (ArrayList<Photo>)request.getAttribute("fileList");
	System.out.println("fileList의 크기 : " + fileList);
	Photo titleImg = fileList.get(0);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer {
		width:1000px; height:735px; background: rgba(255, 255, 255, 0.4); border: 5px solid white;
		margin-left:auto; margin-right:auto; margin-top:50px;
	}
	.detail{text-align:center;}
	.detail th, .detail td{width: 1000px; padding: 10px; background: rgba(255, 255, 255, 0.4);}
	.detail th{background: white;}
	#titleImgArea{width:500px; height:300px; margin-left:auto; margin-right:auto;}
	#contentArea{height:30px;}
	.detailImgArea{width:250px; height:210px; margin-left:auto; margin-right:auto;}
	#titleImg{width:500px; height:300px;}
	.detailImg{width:250px; height:180px;}
	.downBtn{width: 80px; height: 25px; color: white; border-radius: 5px; background: #D1B2FF;}
	#thumbTable{margin: auto;}
   #updateBtn, #menuBtn, #deleteBtn{background: #B2CCFF; color: white; border-radius: 15px; width: 80px; heigth: 25px; text-align:center; display: inline-block;}
   #menuBtn{background: #D1B2FF;}
   #deleteBtn{background: #D5D5D5;}
   #updateBtn:hover, #menuBtn:hover, #deleteBtn:hover{cursor: pointer;}
</style>
</head>
<body>
	<%@ include file="../../common/mainmenu.jsp" %>
	<div class="outer">
		<div class="wrapper">
			<div class="main">
				<form action="<%= request.getContextPath() %>/views/coupleStory/weAreCouple/weAreCoupleUpdateForm.jsp" id="detailForm" method="post">
				<div class="pageTitle">
					<h1>우리 커플 됐어요</h1>
				</div>
				<div class="tableArea">
				<table class="detail" id="thumbTable">
					<tr>
						<th width="50px">제목<input type="hidden" name ="postNo" value = "<%= request.getParameter("postNo") %>"></th>
						<td colspan="5">
						<input type="hidden" value="<%= b.getTitle() %>" name="title">
						<%= b.getTitle() %></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><%= b.getUserId() %></td>
						<th>조회수</th>
						<td><%= b.getHit() %></td>
						<th>작성일</th>
						<td><%= b.getCreateDate() %></td> 
					</tr>
					<tr>
						<th>대표<br>사진</th>
						<td colspan="4">
							<div id="titldImgArea" align="center">
								<img id="titleImg" src="<%= request.getContextPath() %>/photo_uploadFiles/<%= titleImg.getChangeName() %>">
									<input type="hidden" value="<%= titleImg.getChangeName() %>" name="titleImage">
									<input type="hidden" value="<%= titleImg.getPhotoNo() %>" name="detailImgId0">
							</div>
						</td>
					</tr>
					<tr>
						<th>사진<br>메모</th>
						<td colspan="6">
							<p id="contentArea">
								<%
									String memo = b.getContent();
									if(memo == null){ %>
										(메모 없음)
									}
								<%
									} else {%>
									<%= memo %>
								<%	
									}
								%>
								<input type="hidden" value="<%= memo %>" name="memo">
							</p>
						</td>
					</tr>
				</table>
				
				<table class="detail">
					<tr>
					<% for(int i = 1; i<fileList.size(); i++){ %>
						<td>
							<div class="detailImageArea">
								<img id="detailImg" class="detailImg" src="<%= request.getContextPath() %>/photo_uploadFiles/<%= fileList.get(i).getChangeName() %>">
							<input type="hidden" value="<%= fileList.get(i).getChangeName() %>" name="detailImg<%= i %>">
							<input type="hidden" value="<%= fileList.get(i).getPhotoNo() %>" name="detailImgId<%= i %>">
							</div>
						</td>
					<% } %>
					</tr>
				</table>
				</div>
				<br>
				
				<div class="btnBox" align="center">
					<% if(loginUser != null && loginUser.getId().equals(b.getUserId())){ %>
					<input type ="submit" id="updateBtn" value="수정">
					<input type ="button" onclick="deleteThumb();" id="deleteBtn" value="삭제">
					<% } %>
					<div onclick="location.href='<%=request.getContextPath() %>/list.wac'" id="menuBtn">메뉴로</div>
				</div>
			</form>
			</div>
		</div>
	</div>
	<script>
		function deleteThumb(){
			var bool = confirm('정말로 삭제하시겠습니까?');
			if(bool){
				$('#detailForm').attr('action', '<%= request.getContextPath() %>/delete.wac');
				$('#detailForm').submit();
			}
		}
	</script>
</body>
</html>