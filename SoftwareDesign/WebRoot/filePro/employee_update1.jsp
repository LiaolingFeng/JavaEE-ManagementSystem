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
    <title>employee_update1 page</title>

  </head>
  
  <body background="images/mypic/mainbackground.jpg">
   <%
     request.setCharacterEncoding("GBK");
     String Eid=request.getParameter("Eid");
     String name=request.getParameter("name");
     String age=request.getParameter("age");
     String sex=request.getParameter("sex");
     String educational=request.getParameter("educational");
     String department=request.getParameter("department");
     String position=request.getParameter("position");
     String state=request.getParameter("state");
        Connection conn=jdbc_connection.getConn();
        Statement stmt=jdbc_connection.getStmt(conn);
        stmt.execute("update employeeInfo set name='"+name+"',age='"+age+"',sex='"+sex+"',educational='"+educational+"',department='"+department+"',position='"+position+"',state='"+state+"' where Eid="+Eid+" ");
        ResultSet rs=stmt.executeQuery("select * from employeeInfo where Eid="+Eid+"");
   %>
   
   <br>
     <h3><font color="white">�޸ĳɹ�������</font></h3>
   <br>
   
     <h3><font color="white">�޸ĺ���ϢΪ��</font></h3>
     <br>
     <br>
     <br>
     <table bgcolor="grey" border=1 width=1000 border=1 width="1000">
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
		       <td><a href="filePro/employee_update.jsp?Eid=<%=rs.getString("Eid")%>">�޸�</a> <a href="filePro/employee_delete.jsp?Eid=<%=rs.getString("Eid")%>">ɾ��</a></td>
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
        <br>
        <br>
        <h3><a href="filePro/employeeInformation.jsp"><font color="white">����Ա������ҳ��</font></a></h3>
  </body>
</html>
