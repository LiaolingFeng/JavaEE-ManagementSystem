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
    <title>My JSP 'train_recordshow.jsp' starting page</title>
  
  </head>
  
  <body background="images/mypic/mainbackground.jpg">
    <center><h3><font color="white">�ѱ����γ�</font></h3></center>
     <h3><font color="white">���ã�<%= session.getAttribute("username") %>, ���������Ŀγ����£�</font></h3>
    <table bgcolor="grey" border=1 width=1000 border=1 width=1000>
        <tr bgcolor="#a9987b">
          <td>�γ̱��</td>
          <td>�γ�����</td>
          <td>����ʱ��</td>
          <td>����״̬</td>
            <td>����</td>
           
        </tr>
        
        <%
           request.setCharacterEncoding("GBK");
           Connection conn=jdbc_connection.getConn();
           Statement stmt=jdbc_connection.getStmt(conn);
           String sql="select * from train_record";
           ResultSet rs=jdbc_connection.getRs(stmt,sql);
           
           try{
             while(rs.next()){
             out.println("<tr>");
                out.println("<td>"+rs.getString("trainNum")+"</td>");
                out.println("<td>"+rs.getString("trainName")+"</td>");
                out.println("<td>"+rs.getString("trainTime")+"</td>");
                out.println("<td>"+rs.getString("state")+"</td>");
        %>
          
               <td><a href="trainManager/class_delete.jsp?trainNum=<%= rs.getString("trainNum") %>&&state=<%= rs.getString("state") %>">�˿�</a> </td>
           
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
    
    <br><br>
     <center><a href="mainMessage.html"><font color="white">������ҳ��</font></a></center>
  </body>
</html>
