<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="gbk"%>
<%@ page contentType="text/html;charset=gbk"%>
<jsp:useBean id="jdbc_connection" class="dataBase.jdbc_connection" scope="page"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<base href="<%=basePath%>">
  <head>
    <title>employee_insert page</title>

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
     PreparedStatement pstmt=null;
     pstmt=conn.prepareStatement("insert into employeeInfo values(?,?,?,?,?,?,?,?)");
     pstmt.setString(1,Eid);
     pstmt.setString(2,name);
     pstmt.setString(3,sex);
     pstmt.setString(4,age);
     pstmt.setString(5,educational);
     pstmt.setString(6,department);
     pstmt.setString(7,position);
     pstmt.setString(8,state);
     pstmt.executeUpdate();
     %>
     
     <center>
     <br><br><h3><font color="white">��ӳɹ���</font></h3>
     <br>
     <br><h3><font color="white">��Ӻ���Ϣ</font></h3>
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
            ResultSet rs=pstmt.executeQuery("select * from employeeInfo where Eid="+Eid+"");
           
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
           }%>
           <% 
		rs.close();
		pstmt.close();
		conn.close();
        %>
        </table>
      <center><a href="filePro/employeeInformation.jsp"><font color="white">����Ա����Ϣҳ��</font></a></center>
     </center>
     
  </body>
</html>
