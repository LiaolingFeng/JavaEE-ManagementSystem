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
    <title>Ա����Ϣ</title>
    
  </head>
  
  <body background="images/mypic/mainbackground.jpg">
  <form  action="lookupID.jsp" method="post">
    <h3><select name="select">
           <option value="Eid">��Ա��ID����</option>
           <option value="name">����������</option>
           <option value="age">���������</option>
           <option value="educational">��ѧ������</option>
           <option value="department">�����Ų���</option>
           <option value="positionposition">��ְλ����</option>
           <option value="state">����ְ״̬����</option>
        </select>
    <input type="text" name="lookupID">
   
    <input type="submit" value="����"></h3>
  </form>
  
  
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
            <td>����</td>
       </tr>
       <%
           request.setCharacterEncoding("GBK");
           Connection conn=jdbc_connection.getConn();
           Statement stmt=jdbc_connection.getStmt(conn);
           String sql="select * from employeeinfo";
           ResultSet rs=jdbc_connection.getRs(stmt,sql);
           
           try{
             while(rs.next()){
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
		       <td><a href="deploy.jsp?Eid=<%=rs.getString("Eid")%>">����</a> <a href="deploy2.jsp?Eid=<%=rs.getString("Eid")%>&&deparment=<%=rs.getString("department")%>">����</a></td>
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
    <form action="filePro/employee_add.jsp">
     <input type="submit" value="���">
     </form>
     <br><br><br>
     <center><a href="mainMessage.html"> <font color="white">������ҳ��</font></a></center>
  </body>
</html>
