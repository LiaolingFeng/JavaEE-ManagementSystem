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
    <title>���˸���</title>
   
  </head>
  
  <body background="images/mypic/mainbackground.jpg">
   <% 
     request.setCharacterEncoding("gbk");
     String department=request.getParameter("department");
     String Eid=request.getParameter("Eid");
     Connection conn=jdbc_connection.getConn();
     Statement stmt=jdbc_connection.getStmt(conn);
     stmt.execute("update employeeInfo set department='"+department+"'where Eid="+Eid+" ");
     ResultSet rs=stmt.executeQuery("select * from employeeInfo where Eid="+Eid+"");
     //���ż�һ 
    Connection conn2=jdbc_connection.getConn();
    Statement stmt2=jdbc_connection.getStmt(conn2);
    ResultSet resultSet2 = stmt2.executeQuery("select * from chart where degree='"+department+"'" );
    int num;
    while( resultSet2.next( ) ) 
         {
               num=resultSet2.getInt("num")+1;
            
        Connection conn1=jdbc_connection.getConn();
        Statement stmt1=jdbc_connection.getStmt(conn1);
        stmt1.execute("update chart set num="+num+" where degree='"+department+"'");           
         
        }
    //���ż�һ
    String degree=(String)session.getAttribute("department");
    System.out.println(degree);
    System.out.println(session.getAttribute("department"));
    Connection conn3=jdbc_connection.getConn();
    Statement stmt3=jdbc_connection.getStmt(conn3);
    ResultSet resultSet3 = stmt3.executeQuery("select * from chart where degree='"+degree+"'" );
    int num2;
    while( resultSet3.next( ) ) 
         {
               num2=resultSet3.getInt("num")-1;
               System.out.println(num2);
               System.out.println(resultSet3.getInt("num"));
            
        Connection conn4=jdbc_connection.getConn();
        Statement stmt4=jdbc_connection.getStmt(conn4);
        stmt4.execute("update chart set num='"+num2+"' where degree='"+degree+"'");           
         
        }   
   %>
   
   <br><font color="white">
     <h3> <font color="white">�޸ĳɹ�������</font></h3>
   <br>
   
     <h3> <font color="white">�޸ĺ���ϢΪ��</font></h3></font>
     <br>
     <br>
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
		       <td><a href="dept_add.jsp?Eid=<%=rs.getString("Eid")%>">�޸Ĳ���</a></td>
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
        <h3><a href="deptmanager.jsp"> <font color="white">���ز��Ź���ҳ��</font></a></h3>
  </body>
</html>