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
  
  <body background="images/mypic/mainbackground.jpg"><font color="white">
  <h2>��ǰλ�ã�ϵͳ������ɫ����</h2></font>
  <form  action="rolelookup.jsp" method="post">
    <h3><select name="select1">
           <option value="role">����ɫ������</option>
           <option value="files">�����˵�������</option>
           <option value="education">��������ѵ����</option>
           <option value="department">�����Ź������</option>
           <option value="deploy">�����µ������</option>
           
        </select>
    <input type="text" name="rolelookup">
   
    <input type="submit" value="����"></h3>
  </form>
  
  
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
       
           request.setCharacterEncoding("GBK");
           Connection conn=jdbc_connection.getConn();
           Statement stmt=jdbc_connection.getStmt(conn);
           String sql="select * from role_table";
           ResultSet rs=jdbc_connection.getRs(stmt,sql);
           
           try{
             while(rs.next()){
             out.println("<tr>");
				out.println("<td>"+rs.getString("role")+"</td>");
				out.println("<td>"+rs.getString("files")+"</td>");
				out.println("<td>"+rs.getString("education")+"</td>");
				out.println("<td>"+rs.getString("department")+"</td>");
				out.println("<td>"+rs.getString("deploy")+"</td>");
		%>
		       <td><a href="role_update.jsp?id=<%=rs.getString("id")%>">�޸�</a> <a href="role_delete?id=<%=rs.getString("id")%>">ɾ��</a></td>
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
     <center><a href="mainMessage.html"> <font color="white">������ҳ��</font></a></center>
     
  </body>
</html>
