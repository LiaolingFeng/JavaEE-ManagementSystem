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
   
  </head>
  
  <body background="images/mypic/mainbackground.jpg">
   <% 
     request.setCharacterEncoding("gbk");
     String files=request.getParameter("files");
     String education=request.getParameter("education");
     String department=request.getParameter("department");
     String deploy=request.getParameter("deploy");
      String id=request.getParameter("id");
     Connection conn=jdbc_connection.getConn();
     Statement stmt=jdbc_connection.getStmt(conn);
     stmt.execute("update role_table set files='"+files+"',education='"+education+"',department='"+department+"',deploy='"+deploy+"' where id="+id+" ");
     ResultSet rs=stmt.executeQuery("select * from role_table where id="+id);
   %>
   <font color="white">
   <br>
     <h3>�޸ĳɹ�������</h3>
   <br>
   
     <h3>�޸ĺ���ϢΪ��</h3>
     <br>
     <br>
     <br>
      </font>
   <table bgcolor="grey" border=1 width=1000>
        <tr bgcolor="#a9987b">
            <td>��ɫ��</td>
            <td>���˵���</td>
            <td>������ѵ</td>
            <td>���Ź���</td>
            <td>���µ���</td>
            <td>����</td>
       </tr>
       <%
           try{
             while(rs.next()){
             out.println("<tr>");
				out.println("<td>"+rs.getString("role")+"</td>");
				out.println("<td>"+rs.getString("files")+"</td>");
				out.println("<td>"+rs.getString("education")+"</td>");
				out.println("<td>"+rs.getString("department")+"</td>");
				out.println("<td>"+rs.getString("deploy")+"</td>");
		%>
		       <td><a href="role_update.jsp?id=<%=rs.getString("id")%>">�޸�</a> <a href="role_delete.jsp?id=<%=rs.getString("id")%>">ɾ��</a></td>
		<% 
		        
				out.println("</tr>");
             }
           }catch(SQLException e){
           e.printStackTrace();
           }finally{
		jdbc_connection.close(rs);
		jdbc_connection.close(stmt);
		jdbc_connection.close(conn);
		}
        %>
        
    </table>
     <br><br><br>
     <center><a href="role.jsp"> <font color="white">���ؽ�ɫ����</font></a></center>
  </body>
</html>
