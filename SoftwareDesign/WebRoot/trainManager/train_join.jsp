<%@ page contentType="text/html;charset=GBK" import="java.sql.*" contentType="text/html;charset=GBK"%>
<jsp:useBean id="jdbc_connection" class="dataBase.jdbc_connection" scope="page"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <base href="<%=basePath%>">
    <title>My JSP 'train_join.jsp' starting page</title>
    
  </head>
  
  <body background="images/mypic/mainbackground.jpg">
    
    <center><h3><font color="white">�ѱ����γ�</font></h3></center>
    
    <h3><font color="white">���ã�<%= session.getAttribute("username") %>, ���������Ŀγ����£���ȷ�ϣ�</font></h3>
    <table bgcolor="grey" border=1 width=1000 border=1 width=1000>
      <tr bgcolor="#a9987b">
        <td>�����γ̱��</td>
        <td>�����γ�����</td>
        <td>�γ̿�������</td>
        <td>����״̬</td>
        <td>����</td>
      </tr>
      
      <%
        String trainNum=request.getParameter("trainNum");
        Connection conn=jdbc_connection.getConn();
        Statement stmt=jdbc_connection.getStmt(conn);
        String sql="select*from train where trainNum='"+trainNum+"' ";
        ResultSet rs=jdbc_connection.getRs(stmt, sql);
        while(rs.next()){
          out.println("<tr>");
          out.println("<td>"+rs.getString("trainNum")+"</td>");
          out.println("<td>"+rs.getString("trainName")+"</td>");
          out.println("<td>"+rs.getString("trainTime")+"</td>");
          out.println("<td>"+true+"</td>");
          %>
          <td><a href="trainManager/train_record.jsp?trainNum=<%= rs.getString("trainNum") %>&&trainName=<%= rs.getString("trainName") %>&&trainTime=<%= rs.getString("trainTime") %>">ȷ�ϱ���</a></td>
          <% 
          out.println("</tr>");
        
        }
       %>
    </table>
   
    <br><br>
    <h3><center><a href="trainManager/train_record.jsp"><font color="white">�鿴�������Ŀγ�</font></a></center></h3>
    <%
       jdbc_connection.close(rs);
        jdbc_connection.close(stmt);
        jdbc_connection.close(conn);
     %>
  </body>
</html>
