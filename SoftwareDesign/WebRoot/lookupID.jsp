<%@ page language="java" import="java.util.*" import="java.sql.*"  pageEncoding="GBK"%>
<jsp:useBean id="jdbc_connection" class="dataBase.jdbc_connection" scope="page"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <base href="<%=basePath%>">
    <title>Ա������</title>

  </head>
  
  <body background="images/mypic/mainbackground.jpg">
    <% 
       	
       String id=request.getParameter("lookupID");
       String str=request.getParameter("select");
       Connection conn=jdbc_connection.getConn();
       Statement stmt=jdbc_connection.getStmt(conn);
       String sql="select * from employeeInfo where "+str+"='"+id+"'";
       ResultSet rs=jdbc_connection.getRs(stmt,sql);
    %>
    
     <form  action="lookupID.jsp"/><font color="white">
    <h3>����<% out.println(str);%>����:<input type="text" name="lookupID">
    <input type="submit" value="����"></h3>
  </form>
  
    <br>
       <h3> <font color="white">����������Ա����Ϣ</font></h3><hr></font>
    <br>
    <table bgcolor="grey" border=1 width=1000 border=1 width=1000>
        <tr bgcolor="#a9987b">
            <td>��ԱID</td>
            <td>����</td>
            <td>�Ա�</td>
            <td>����</td>
            <td>ѧ��</td>
            <td>����</td>
            <td>ְλ</td>
            <td>��ְ״̬</td>
       </tr>

    <%
       if(rs.next()){
                out.println("<tr>");
				out.println("<td>"+rs.getString("Eid")+"</td>");
				out.println("<td>"+rs.getString("name")+"</td>");
				out.println("<td>"+rs.getString("sex")+"</td>");
				out.println("<td>"+rs.getString("age")+"</td>");
				out.println("<td>"+rs.getString("educational")+"</td>");
				out.println("<td>"+rs.getString("department")+"</td>");
				out.println("<td>"+rs.getString("position")+"</td>");
				out.println("<td>"+rs.getString("state")+"</td>");
				
	 %>
	   <td><a href="deploy.jsp?Eid=<%=rs.getString("Eid")%>">����</a> <a href="employee_delete.jsp?Eid=<%=rs.getString("Eid")%>">����</a></td>
	      <% out.println("</tr>");
       }else{
       out.println("<h4>WRONG��</h4>");
       }
    
     %>
      </table>
      
      <%
       jdbc_connection.close(rs);
		jdbc_connection.close(stmt);
		jdbc_connection.close(conn);
       %>
       
       <br>
        <br>
        <h3><a href="mainMessage.html"> <font color="white">������ҳ��</font></a></h3>
  </body>
</html>
