<%@ page language="java"  import="java.util.*"  pageEncoding="UTF-8"%>
<%-- <%@include file="Count.jsp" %> --%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->


    <meta charset="utf-8">
	<title>修改物品</title>
	<style>
	 table{
	 	align:center;
	 }
	 td{
	 	text-align:center
	 }
	</style>
</head>
<body>
   // 验证权限 只有卖家可以 应该列出该商家所有在卖的商品 可以选择修改哪一个
   <center>
   <form method="post" action="addittype1.jsp">
     <table border="1" cellpadding="1" cellspacing="0">
       <th colspan="6" text-align:center>修改商品</th>
       <tr>
        <td>物品名称:</td>
        <td><input type="text" name="name"></td>
		<td>物品价格:</td>
		<td><input type="text" name="price"></td>
		<td>物品折扣:</td>
		<td><input type="text" name="agio"></td>
        <td>
         <input type="radio" name="type" id="man" checked="checked" value="1">买家 //从数据库中取出类别 做循环
         <input type="radio" name="type" id="woman" value="2">卖家
        </td>
       <tr >
        <td colspan="6"><input type="submit" value="提交" width="200px"></td>
       </tr>
     </table>
   </form>
   </center>
</body>
</html>
