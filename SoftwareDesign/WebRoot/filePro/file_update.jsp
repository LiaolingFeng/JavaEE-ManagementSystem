 <%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html;charset=GBK"%>
<jsp:useBean id="jdbc_connection" class="dataBase.jdbc_connection" scope="page"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'file_update.jsp' starting page</title>
    
  </head>
  
  <body background="images/mypic/mainbackground.jpg">
  <center><h3><font color="white">��Ҫ�޸ĵ������</font></h3></center>
    <%
    request.setCharacterEncoding("GBK"); 
    Connection conn=jdbc_connection.getConn();
    Statement stmt=jdbc_connection.getStmt(conn);
    String Eid=request.getParameter("Eid");
    String sql="select * from fileInfo where Eid="+Eid+"";
    ResultSet rs=jdbc_connection.getRs(stmt, sql);
     while(rs.next()){
    %>
      <form action="filePro/file_update1.jsp">
          <table bgcolor="grey" border=1 width=1000 border=1 width=1000>
          <tr bgcolor="#a9987b">
            <td>�������</td>
            <td><input type="text" name="fileNum" value="<%= rs.getString("fileNum") %>"></td>
            <td>��������</td>
            <td><input type="text" name="fileName" value="<%= rs.getString("fileName") %>"></td>
            <td>��ԱID</td>
            <td><input type="text" name="Eid" value="<%= rs.getString("Eid") %>"></td>
          </tr>
          
          <tr>
            <td>����</td>
            <td><input type="text" name="name" value="<%= rs.getString("name") %>"></td>
            <td>��������</td>
            <td><input type="text" name="fileContent" value="<%= rs.getString("fileContent") %>"></td>
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
