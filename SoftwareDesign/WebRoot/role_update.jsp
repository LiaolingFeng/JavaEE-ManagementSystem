<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="gbk"%>
<%@ page contentType="text/html;charset=gbk"%>
<jsp:useBean id="jdbc_connection" class="dataBase.jdbc_connection" scope="page"/>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>��ɫ����</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body background="images/mypic/mainbackground.jpg">
   <center><h3> <font color="white">��Ҫ�޸ĵĽ�ɫ��Ȩ�����</font></h3></center>
    <%
      request.setCharacterEncoding("GBK");
      String id=request.getParameter("id");
      Connection conn=jdbc_connection.getConn();
      Statement stmt=jdbc_connection.getStmt(conn);
      String sql="select * from role_table where id="+id+"";
      ResultSet rs=jdbc_connection.getRs(stmt,sql);
    while(rs.next()){
   
    %>
      <form action="role_update2.jsp">
          <table bgcolor="grey" border=1 width=1000 >
          <tr bgcolor="#a9987b">
            <td>Ȩ��ID</td>>
            <td><input type="text" name="id" value="<%= rs.getString("id") %>"></td>
            <td>���˵���</td>
            <td><input type="text" name="files" value="<%= rs.getString("files") %>"></td>
            <td>������ѵ</td>
            <td><input type="text" name="education" value="<%= rs.getString("education") %>"></td>
          </tr>
          <tr>
            <td>���Ź���</td>
            <td><input type="text" name="department" value="<%= rs.getString("department") %>"></td>
       
            <td>���µ���</td>
            <td><input type="text" name="deploy" value="<%= rs.getString("deploy") %>"></td>
            <td><input type="submit" value="�޸�"></td>
            <td><input type="reset" value="����"></td>
          </tr>
          </table>
      </form>
   <%
			
			}
    %>

 <%jdbc_connection.close(rs);
		jdbc_connection.close(stmt);
		jdbc_connection.close(conn); %>
  </body>
</html>
