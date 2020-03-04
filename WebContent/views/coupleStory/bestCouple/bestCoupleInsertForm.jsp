<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*, java.util.*"%>
<%
	//String mName = (String)request.getAttribute("mName");
	String mName = request.getParameter("mName");
	String fName = request.getParameter("fName");
	String content = request.getParameter("con");
	String dtPeriod = request.getParameter("dtPeriod");
	String fvDate = request.getParameter("fvDate");
	BestCouple bc = (BestCouple)request.getAttribute("bc");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>이어드림 - 이 달의 베스트커플</title>
<style>


	.contents{
			text-align: left;
			width: 900px;
			border: 8px solid pink;
			box-shadow: 3px 3px 3px 3px gray;
	}
	
	.subj{
		height: 70px;
	}
	#subjtitle{
		margin: 3%;
		display: inline-block;
	}
	#subjbox{
      width: 60%;
      height: 22px;
      background: #f9f2f5;
      border-radius: 5px;
   }
	
	.contn1{
		width: 95%;
		height: 200px;
		border: 2px solid #f7cee1;
		margin: 0 2% 3%;
	}
	
	.contn1box{
		margin: 1% 0;
	}
	
	.contn2{
		width: 95%;
		height: 200px;
		background: #f9f2f5;
		margin: 0 2%;
		resize: none;
	}
	
	.label{
		display: inline-block;
		margin: 1.5% 3%;
	}
	
	.bx{
      width: 65px;
      height: 20px;
      border-radius: 5px;
   }
	
	.file{
		margin: 2%;
	}
	
	#file1{
		margin-bottom: 1%;
	}
	.datebx{
      width: 180px;
      height: 22px;
      border-radius: 5px;
   }

#cancelBtn{
      background: #D5D5D5;
   }
</style>
</head>
<body>
	<%@ include file="../../common/mainmenu.jsp" %>
	<section>
		<div class="outer">
			<div class="wrapper">
				<div class="main">
					<div class="pageTitle"><h1>이달의 베스트 커플</h1></div>
					<form action="<%= request.getContextPath() %>/insert.bc" method="post" encType="multipart/form-data">
						<div class="contents">
							<div class="subj">
								<div id="subjtitle">제목</div>
								<input type="text" name="title" id="subjbox" required>
							</div>
							
							<div class="contn1">
								<div class="contn1box">
									<div class="label">
										<label>남자 이름 : </label>
									</div>
									<input type="text" name="mName" class="bx" value="<%= mName %>" required><br>
									
									<div class="label">
										<label>여자 이름 : </label>
									</div>
									<input type="text" name="fName" class="bx" value="<%= fName %>" required><br>
									
									<div class="label">
										<label>연애 기간 : </label>
									</div>
									<input type="number" name="dtPeriod" min="1" value="<%=dtPeriod %>" class="bx" required >&nbsp;일<br>
									
									<div class="label">
										<label>즐겨하는 데이트 : </label>
									</div>
									<input type="text" name="fvDate" class="datebx" maxlength="12" placeholder="12자이내로 입력하세요." value="<%=fvDate %>" required>
								</div>
							</div>
							
							<textarea class="contn2" name="content" placeholder="내용을 자유롭게 입력해주세요." required><%= content %></textarea>
							
							<div class="file">
								<input type="file" name="photo1" multiple="multiple" id="file1" required><br>
								<input type="file" name="photo2" multiple="multiple" required>
							</div>
						</div>
						
						<div class="btnBox">
							<button type="submit" class="defaultBtn">등록</button>
							<button type="reset" class="defaultBtn" id="cancelBtn" onclick="location.href='<%= request.getContextPath() %>/list.bc'">취소</button>
						</div>	
					</form>
				</div>
			</div>
		</div>
	</section>
</body>
<%@ include file="../../common/footer.jsp"%> 
</html>






<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>이어드림 - 이 달의 베스트커플</title>
<style>

	.contents{
		text-align: left;
		width: 900px;
		border: 8px solid pink;
		box-shadow: 3px 3px 3px 3px gray;
	}
	
	.subj{
		height: 70px;
	}
	
	#subjtitle{
		margin: 3%;
		display: inline-block;
	}
	
	#subjbox{
		width: 60%;
		height: 22px;
		background: #f9f2f5;
		border-radius: 5px;
	}
	
	.contn1{
		width: 95%;
		height: 200px;
		border: 2px solid #f7cee1;
		margin: 0 2% 3%;
	}
	
	.contn1box{
		margin: 1% 0;
	}
	
	.contn2{
		width: 95%;
		height: 200px;
		background: #f9f2f5;
		margin: 0 2%;
		resize: none;
	}
	
	.label{
		display: inline-block;
		margin: 1.5% 3%;
	}
	
	.bx{
		width: 65px;
		height: 20px;
		border-radius: 5px;
	}
	
	.datebx{
		width: 180px;
		height: 22px;
		border-radius: 5px;
	}
	
	.file{
		margin: 2%;
	}
	
	#file1{
		margin-bottom: 1%;
	}
	
	#cancelBtn{
		background: #D5D5D5;
	}
	
</style>
</head>
<body>
	<%@ include file="../../common/mainmenu.jsp" %>
	<section>
		<div class="outer">
			<div class="wrapper">
				<div class="main">
					<div class="pageTitle"><h1>이달의 베스트 커플</h1></div>
					<form action="<%= request.getContextPath() %>/insert.bc" method="post" encType="multipart/form-data">
						<div class="contents">
							<div class="subj">
								<div id="subjtitle">제목</div>
								<input type="text" name="title" id="subjbox" required>
							</div>
							
							<div class="contn1">
								<div class="contn1box">
									<div class="label">
										<label>남자 이름 : </label>
									</div>
									<input type="text" name="mName" class="bx" required><br>
									
									<div class="label">
										<label>여자 이름 : </label>
									</div>
									<input type="text" name="fName" class="bx" required><br>
									
									<div class="label">
										<label>연애 기간 : </label>
									</div>
									<input type="number" name="dtPeriod" min="1" value="1" class="bx" required>&nbsp;일<br>
									
									<div class="label">
										<label>즐겨하는 데이트 : </label>
									</div>
									<input type="text" name="fvDate" class="datebx" maxlength="12" placeholder="12자이내로 입력하세요." required>
								</div>
							</div>
							
							<textarea class="contn2" name="content" placeholder="내용을 자유롭게 입력해주세요." required></textarea>
							
							<div class="file">
								<input type="file" name="photo1" multiple="multiple" id="file1" required><br>
								<input type="file" name="photo2" multiple="multiple" required>
							</div>
						</div>
						
						<div class="btnBox">
							<button type="submit" class="defaultBtn">등록</button>
							<button type="reset" class="defaultBtn cancelBtn" onclick="location.href='<%= request.getContextPath() %>/list.bc'">취소</button>
						</div>	
					</form>
				</div>
			</div>
		</div>
	</section>
</body>
<%@ include file="../../common/footer.jsp" %>
</html> --%>