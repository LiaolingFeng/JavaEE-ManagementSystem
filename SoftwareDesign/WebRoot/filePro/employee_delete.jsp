<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="gb2312"%>
<jsp:useBean id="jdbc_connection" class="dataBase.jdbc_connection" scope="page"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <base href="<%=basePath%>">
    <title>employee_delete page</title>
   
  </head>
  
  <body background="images/mypic/mainbackground.jpg">
  <% 
    Connection conn=jdbc_connection.getConn();
    Statement stmt=jdbc_connection.getStmt(conn);
    String Eid=request.getParameter("Eid");
    String sql="delete from employeeInfo where Eid="+Eid+"";
    int x=stmt.executeUpdate(sql);
    if(x==1){
    %>
       <font color="white">
    <%
         out.println("<center><br><br><h3>ɾ���ɹ���</h3></center>");
    }else{
         out.println("<center><br><br><h3>ɾ��ʧ�ܣ�</h3></center>");
    }
   %>
   </font>
   <center><a href="filePro/employeeInformation.jsp"><font color="white">������ҳ��</font></a></center>
   <%
		jdbc_connection.close(stmt);
		jdbc_connection.close(conn);
    %>
  </body>
</html>
