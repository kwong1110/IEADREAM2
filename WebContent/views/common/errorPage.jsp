<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 페이지</title>
<style>
	body{background: white;}
	h1{background: #c7eef2; border-radius: 7px;}
</style>
</head>
<body>
	<h1 align="center"><%= msg %></h1>
</body>
</html>