<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*, java.util.*"%>
<%
	Board b = (Board)request.getAttribute("board");
	BestCouple bc = (BestCouple)request.getAttribute("bc");
	ArrayList<Photo> fileList = (ArrayList<Photo>)request.getAttribute("fileList");
	System.out.println("fileList의 크기 : " + fileList);
	Photo titleImg = fileList.get(0);
	String content = b.getContent();
	
	String[] conArr = content.split("/////");
	
	String content1 ="";
	String content2 = "";
	for(int i =0; i<conArr.length; i++){
		if(i %2 == 0){
			content1 += conArr[i];		
		}else{
			content2 += conArr[i];
		}
	}	
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
	#titleImg,#contentImg1{width:400px; height:300px}
	.detailImg{width:250px; height:180px;}
	.downBtn{width: 80px; height: 25px; color: white; border-radius: 5px; background: #D1B2FF;}
	#thumbTable{margin: auto;}
   #updateBtn, #menuBtn, #deleteBtn{background: #B2CCFF; color: white; border-radius: 15px; width: 80px; heigth: 25px; text-align:center; display: inline-block;}
   #menuBtn{background: #D1B2FF;}
   #deleteBtn{background: #D5D5D5;}
   #updateBtn:hover, #menuBtn:hover, #deleteBtn:hover{cursor: pointer;}
   
   
   #title,.wac{
   	border-radius: 10px;
   	width:80%;
   	padding: 5px;
   }
   .Rwac{
   	border-radius: 10px;
   	width:80%;
   	padding: 10px;
   }
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
					<div class="review">
						<table id="reviewTable" align=center>
							<tr>
								<th >작성자</th>
								<td width="100px"><%= b.getUserId() %></td>
								<th width="20px">조회수</th>
								<td width="20px"><%= b.getHit() %></td>
								<th width="40px">작성일</th>
								<td width="150px"><%= b.getCreateDate() %></td> 
							</tr>
							<tr>
								<th width="20px">제목<input type="hidden" name ="postNo" value = "<%= request.getParameter("postNo") %>"> </th>
								<td colspan="5">
									<input type="hidden" value="<%= b.getTitle() %>" name="title"><input id="title" value='<%= b.getTitle() %>' readonly>
								</td>
							</tr>
							<tr>
								<th>남자친구의 이름</th>
								<th>여자친구의 이름</th>
							</tr>
							<tr>
								<td><input type="hidden" name="mName" value="<%= bc.getmName() %>"><input  class="wac" value="<%= bc.getmName() %>" readonly></td>
								<td><input type="hidden" name="fName" value="<%= bc.getfName() %>"><input class="wac" value='<%= bc.getfName() %>' readonly></td>
							</tr>
								
							<tr>
								<td>연애 기간</td>
								<td>즐겨하는 데이트</td>
							</tr>
							
							<tr>
								<td><input type="hidden" name="dtPeriod" value="<%= bc.getDtPeriod()%>"><input class="wac" value="<%= bc.getDtPeriod() %>" class="wac" readonly>&nbsp;일</td>
								<td><input type="hidden" name="fvDate" value="<%= bc.getFvDate() %>"><input  class="wac" value="<%= bc.getFvDate()%>"name="fvDate" readonly></td>
							</tr>
							<tr>
								<td>이어드림의 서비스 중 가장 만족했던 서비스를  작성해주세요.</td>
							</tr>
							<tr>
								<td colspan=2>
									<input type="hidden" name = "content1" value="<%=content1 %>"><input class="Rwac" value="<%=content1 %>" readonly>
								</td>
							</tr>
							<tr>
								<td>후기</td>
							</tr>
							<tr>
								<td colspan=2 width=100%>
								<input type="hidden" name = "content2" value="<%=content2 %>"><input class="Rwac" value="<%=content2 %>" readonly>
								</td>
							</tr>
							<tr>
								<td colspan=2>
								<input type="hidden" name = "con" value="<%=content1 %><%= content2 %>">
								</td>
							</tr>
							
							<tr>
								<td>커플 사진</td>
							</tr>
							<%if(loginUser.getGrade() !=0){%>
							<tr>
									<td colspan="4">
									<img id="titleImg"  width="150" height="200" src="<%= request.getContextPath() %>/photo_uploadFiles/<%= titleImg.getChangeName() %>">
										<input type="hidden" value="<%= titleImg.getChangeName() %>" name="titleImage">
										<input type="hidden" value="<%= titleImg.getPhotoNo() %>" name="detailImgId0">
								</td>
								<td>
									<img id="contentImg1" width="150" height="200" class="detailImg" src="<%= request.getContextPath() %>/photo_uploadFiles/<%= fileList.get(1).getChangeName() %>">
								<input type="hidden" value="<%= fileList.get(1).getChangeName() %>" name="detailImg1">
								<input type="hidden" value="<%= fileList.get(1).getPhotoNo() %>" name="detailImgId1">
							</td>
							</tr>
							<% } else { %>
								<tr>
									<td colspan="4">
									<a href="<%= request.getContextPath() %>/photo_uploadFiles/<%=titleImg.getChangeName() %>" download="<%=titleImg.getOriginName() %>">
									<img id="titleImg"  width="150" height="200" src="<%= request.getContextPath() %>/photo_uploadFiles/<%= titleImg.getChangeName() %>">
										<input type="hidden" value="<%= titleImg.getChangeName() %>" name="titleImage">
										<input type="hidden" value="<%= titleImg.getPhotoNo() %>" name="detailImgId0">
									</a>
								</td>
								<td>
								<a href="<%= request.getContextPath() %>/photo_uploadFiles/<%=titleImg.getChangeName() %>" download="<%=titleImg.getOriginName() %>">
									<img id="contentImg1" width="150" height="200" class="detailImg" src="<%= request.getContextPath() %>/photo_uploadFiles/<%= fileList.get(1).getChangeName() %>">
								<input type="hidden" value="<%= fileList.get(1).getChangeName() %>" name="detailImg1">
								<input type="hidden" value="<%= fileList.get(1).getPhotoNo() %>" name="detailImgId1">
								</a>
							</td>
							</tr>
							
							<% } %>
						</table>
						<div class="btnBox" align="center">
								<% if(loginUser != null && loginUser.getId().equals(b.getUserId())){ %>
							<input type ="submit" id="updateBtn" value="수정">
							<input type ="button" onclick="deleteThumb();" id="deleteBtn" value="삭제">
							<% } %>
							<div onclick="location.href='<%=request.getContextPath() %>/list.wac'" id="menuBtn">메뉴로</div>
							<% if(loginUser != null && loginUser.getGrade()==0){ %>
							<input type="button" onclick="updateBC();" id="menuBtn" value="베스트 커플">
							<input type ="button" onclick="deleteThumb();" id="deleteBtn" value="삭제">
							<% } %>
						</div>
					</div>
				</div>
				</form>
			</div>
			<br>
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
		
		function updateBC(){
			$('#detailForm').attr('action','<%=request.getContextPath() %>/views/coupleStory/weAreCouple/TestBC.jsp'); /* 합칠 때 이름 바꾸기 */
			$('#detailForm').submit();
		}
	</script>
</body>
</html>