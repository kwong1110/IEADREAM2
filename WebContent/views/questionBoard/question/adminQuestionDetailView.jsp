<%@page import="oracle.net.aso.a"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*, account.model.vo.*, java.util.ArrayList"%>
<%
	Board b = (Board)request.getAttribute("board");
	Reply r = (Reply)request.getAttribute("reply");
	//String userId = (String)request.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이어드림 - 1:1문의</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<style>

	.outer{
		width: 1000px; height: 600px; background: white;
		margin-left: auto; margin-right: auto; margin-top: 50px; margin-bottom: 50px;
	}
		.main{width: 80%; height: 100%;}
	#listArea{text-align: center;}
	.listArea{width:650px;	height:350px; margin-left:auto;	margin-right:auto;}
	th, td, thead{
		    border: 1px solid gray;
   	 border-radius: 5px;
	}
	textarea, #title, #category, #Mcommand{
		font-size:15px;
		font-family:"ON I고딕";
		outline: none;
	}
	textarea{
		margin: 0;
    	padding: 0;
   		border: none;
	}
	#manager{
		    background: #f5eded;
    width: 70px;
    height: 100%;
    text-align: center;
    vertical-align: middle
	}
	#Mcommand{
		background:#f9f9f9;
	}
	.tableArea {table-layout:fixed;}
	.tableArea tr { width: -webkit-fill-available;}
	.tableArea th {/* 게시판제목라인 */
		padding:12px 0;
		border-top:1px solid rgb(136, 136, 136); /* 상단라인색 */
		border-bottom:1px solid rgb(224, 224, 224); /* 하단라인색 */
		background:#f9f9f9;  /* 제목배경색 */ 
		color:rgb(51, 51, 51); font-size:1em;/* 제목글자크기 */ 
		letter-spacing:0.1em}/* 제목띠어쓰기간격 */ 
	.tableArea td {line-height: 10px;}
	#th_title {width:10%; text-align:rigth;border-top:1px solid rgb(136, 136, 136);}
	#td_title{width: 30%; border-top:1px solid rgb(136, 136, 136);}
	#th_writer {width:10%;text-align:left; border-top:1px solid rgb(136, 136, 136);}
	#td_writer {width:20%;text-align:left; border-top:1px solid rgb(136, 136, 136);}
	#th_category {width:15%;text-align: center; border-top:1px solid rgb(136, 136, 136);}
	#category{border-top:1px solid rgb(136, 136, 136);}
	#th_cate_select{width: 20%;}
	#con{
		resize: none;
    width: 95%;
    height: 30%;
    padding: 10px;
    border: 10px solid #f9f9f9;
	}
	.replyArea{
		background:#f9f9f9;
		width:657px;
	}
	#addReply, #updateBtn, #deleteBtn{
		margin-bottom: 20px;
		margin-left: 5px;
	}
	#insertReply{
		resize:none;
		 width: 400px;
		  height: 40%;
		   margin: 10px;
		    margin-bottom:0;
	}
	 #deleteBtn{background: #D5D5D5;}
	  #menuBtn{background: #B2CCFF;}
</style>
</head>
<body>
<%@ include file="../../common/mainmenu.jsp" %>
	<div class="outer">
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>1:1 문의</h1>
				</div>
				<div class="listArea">
					<form action="<%= request.getContextPath() %>/views/questionBoard/question/questionUpdateForm.jsp"  id="detailForm"  method="post">
						<table class="tableArea">
								<tr>
									<th  id="th_title" width=10%>제목</th>
									<td id="td_title" width=30%>
										<input type ="hidden" value ="<%= b.getPostNo() %>" name = "postNo">
										<input type="hidden" id="title" name = "title" value="<%= b.getTitle() %>"><%= b.getTitle() %>							
									</td>
									<% if(loginUser.getGrade() == 0) {%>
									<th id="th_writer">작성자</th>
									<td id="td_writer">
										<%= b.getUserId() %>
									</td>
									<% } %>
									<th width=20% id="th_category" >카테고리</th>
									<td id="category">
										<%= b.getCategory() %>
										<input type="hidden" value="<%= b.getCategory() %>" name="category">
									</td>
								</tr>
								<tr>
									<td colspan="6">
										<textarea rows="15" cols="60" id="con" name="content" style="resize:none; width: 95%;  height: 30%;"  readonly ><%= b.getContent() %></textarea>
									</td>
								</tr>
						</table>
					
						<div class="replyArea">
							<table class="replyTable">
								<tr>
									<th id="manager" colspan="2">관리자</th>
										<% if(r.getAnswerContent() == null) { %>
										<td id="Mcommand" rowspan = "3" colspan="2" align= center>
											<textarea id="insertReply" placeholder="답변을 남겨주세요."></textarea>
										</td>
										<% } else { %>
										<td id="Mcommand" rowspan = "3" colspan="2" align= center>
											<textarea id="insertReply" name ="answerContent"style="resize:none; width: 400px; height: 40%; margin-top: 10px;  background: #f9f9f9; border:1px solid #cababa " readonly><%= r.getAnswerContent() %></textarea>
										<% } %>
										
										</td>
									<th><input type="button" id="addReply" class="defaultBtn" value="등록"></th>
									<th><input type="button" id="updateBtn" class="defaultBtn" value="수정"></th>
									<th><input type="button" onclick="deleteReply();" id="deleteBtn" class="defaultBtn" value="삭제"></th>
								</tr>
							</table>
						</div>
						<div class="btnBox">
							<input type="button" onclick="location.href='<%= request.getContextPath() %>/Mlist.qu?'" class="defaultBtn" id="menuBtn" value="메뉴로" >
						</div>
					</form>
				 </div>
		 	 </div>	
	 	 </div>				
	</div>
	<script>
		function deleteReply(){
			var bool = confirm("정말로 삭제하시겠습니까?");
			if(bool){
				$('#detailForm').attr('action','<%=request.getContextPath() %>/Mdelete.qu');
				$('#detailForm').submit();
			}
		}

			$('#updateBtn').click(function(){
				//$('#reply').removeAttr("readonly");
				var postNo = <%= b.getPostNo() %>;
				var answerContent = $('#insertReply').val();
				
				console.log(answerContent);
				if(answerContent== null){
					alert("댓글 등록을 먼저 해주세요!");
				}else{
					$('#insertReply').css('background','white');
					$('#insertReply').attr('readonly',false);
				
				$.ajax({
					url: '<%= request.getContextPath() %>/updateReply.qu',
					type: 'post',
					data: {postNo: postNo, answerContent:answerContent},
					success: function(data){
						$replyTable = $('#replyTable');
						
						for(var key in data){
						var $tr= $('<tr>');
						var $writerTd = $('<td>').text('관리자');
						var $contentTd = $('<td>').text(data[key].answerContent);
						var $dateTd = $('<td>').text(data[key].answerDate);
						}
					
					}
				}); 
				}
			   });
			
			
		   $('#addReply').click(function(){
			var postNo = <%= b.getPostNo() %>;
			var answerContent = $('#insertReply').val();
			$.ajax({
				url: '<%= request.getContextPath() %>/insertReply.qu',
				type: 'post',
				data: {postNo: postNo, answerContent:answerContent},
				success: function(data){
					$replyTable = $('#replyTable');
					alert('등록되었습니다.');
					$('#insertReply').css('background','lightgray');
					$('#insertReply').attr('readonly',true);
					for(var key in data){
					var $tr= $('<tr>');
					var $writerTd = $('<td>').text('관리자');
					var $contentTd = $('<td>').text(data[key].answerContent);
					var $dateTd = $('<td>').text(data[key].answerDate);
					}
				
				}
			}); 
		   });
		   
	 	 <%--   $('.updateReply').click(function(){
				var postNo = <%= b.getPostNo() %>;
				var answerContent = $('#updateReply').val();
				console.log(answerContent);
				if(answerContent.val().equals("")){
					alert("댓글 등록을 먼저 해주세요!");
				}else{
					$('#insertReply').css('background','white');
					$('#insertReply').attr('readonly','false');
				}
				$.ajax({
					url: '<%= request.getContextPath() %>/insertReply.qu',
					type: 'post',
					data: {postNo: postNo, answerContent:answerContent},
					success: function(data){
						
						for(var key in data){
							var $tr= $('<tr>');
							var $writerTd = $('<td>').text('관리자');
							var $contentTd = $('<td>').text(data[key].answerContent);
							var $dateTd = $('<td>').text(data[key].answerDate);
							}
						
						}
					});
				}); --%>
			   
	</script>
</body>
<%@ include file="../../common/footer.jsp" %>
</html>
