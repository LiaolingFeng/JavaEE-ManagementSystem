<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="GBK"%>
<jsp:useBean id="jdbc_connection" class="dataBase.jdbc_connection" scope="page"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'train_update.jsp' starting page</title>
   
  </head>
  
  <body background="images/mypic/mainbackground.jpg">
  
   <center><h3><font color="white">��Ҫ�޸Ŀγ����</font></h3></center>
   
    <%
       request.setCharacterEncoding("GBK"); 
    Connection conn=jdbc_connection.getConn();
    Statement stmt=jdbc_connection.getStmt(conn);
    String trainNum=request.getParameter("trainNum");
    String sql="select * from train where trainNum='"+trainNum+"' ";
    ResultSet rs=jdbc_connection.getRs(stmt, sql);
     while(rs.next()){
     %>
      
        <form action="trainManager/train_update1.jsp">
           <table bgcolor="grey" border=1 width=1000 border=1 width=1000>
             <tr bgcolor="#a9987b">
               <td>�γ̱��</td>
               <td><input type="text" name="trainNum" value="<%= rs.getString("trainNum") %>"></td>
               <td>�γ�����</td>
               <td><input type="text" name="trainName" value="<%= rs.getString("trainName") %>"></td>
               <td>�γ̷���</td>
               <td><input type="text" name="trainPay" value="<%= rs.getString("trainPay") %>"></td>
             </tr>
             <tr>
               <td>����ʱ��</td>
               <td><input type="text" name="trainTime" value="<%= rs.getString("trainTime") %>"></td>
               <td>�����ż�</td>
                <td><input type="text" name="trainLevel" value="<%= rs.getString("trainLevel") %>"></td> 
               <td><input type="submit" value="ȷ���޸�">
                <input type="reset" value="����"></td>
             </tr>
           </table>
        </form>
     
    <%} %>

 <% jdbc_connection.close(rs);
        jdbc_connection.close(stmt);
        jdbc_connection.close(conn); %>
  </body>
</html>
