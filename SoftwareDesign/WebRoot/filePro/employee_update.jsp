<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="GBK"%>
<jsp:useBean id="jdbc_connection" class="dataBase.jdbc_connection" scope="page"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <base href="<%=basePath%>">
    <title>My JSP 'employee_update.jsp' starting page</title>

  </head>
  
  <body background="images/mypic/mainbackground.jpg"> 
  <center><h3><font color="white">��Ҫ�޸���Ա���</font></h3></center>
  <%
    request.setCharacterEncoding("GBK"); 
    Connection conn=jdbc_connection.getConn();
    Statement stmt=jdbc_connection.getStmt(conn);
    String Eid=request.getParameter("Eid");
    String sql="select * from employeeInfo where Eid="+Eid+"";
    ResultSet rs=jdbc_connection.getRs(stmt, sql);
     while(rs.next()){
    %>
         <form action="filePro/employee_update1.jsp" method="post">
           <table bgcolor="grey" border=1 width=1000 border=1 width="1000">
             <tr bgcolor="#a9987b">
              <td>Ա��ID</td>
			  <td><input type="text" name="Eid" value="<%=rs.getString("Eid") %>" ></td>
			  <td>����</td>
			  <td><input type="text" name="name" value="<%=rs.getString("name") %>"></td>
			  <td>����</td>
			  <td><input type="text" name="age" value="<%=rs.getString("age") %>"></td>
		     </tr>	
		     <tr>
		        <td>�Ա�</td>
		        <td>
		         <input type="text" value="<%=rs.getString("sex")%>">
		         <input type="radio" name="sex" id="male" value="male" checked="checked"><label for="male">��</label>
                 <input type="radio" name="sex" id="female" value="female"><label for="female">Ů</label>
		        </td>
		        <td>ѧ��</td>
		        <td><input type="text" name="educational" value="<%= rs.getString("educational") %>"></td>
		        <td>����</td>
		        <td><input type="text" value="<%= rs.getString("department") %>"></td>
		        <td>
		          <select name="department">
                    <option value="��Ʋ�">��Ʋ�</option>
                    <option value="������">������</option>
                    <option value="������">������</option>
                  </select>
		        </td>
		     </tr>
		     <td>ְλ</td>
		     <td><input type="text" value="<%= rs.getString("position") %>"></td>
            <td>
               <select name="position">
                  <option value="��Ա">��Ա</option>
                  <option value="����">����</option>
                  <option value="����">����</option>
               </select>
            </td>
      
            <td>��ְ״̬</td>
            <td><input type="text" value="<%= rs.getString("state") %>"></td>
            <td>
                <input type="radio" name="state" id="true" value="true" checked="checked"><label for="true">true</label>
                <input type="radio" name="state" id="false" value="false"><label for="false">false</label>
            </td>
            <td><input type="submit" value="ȷ���޸�">
                <input type="reset" value="����"></td>
        </tr>
		   </table>	
		 </form>		
				<%
			
			}
    %>

 <% jdbc_connection.close(rs);
		jdbc_connection.close(stmt);
		jdbc_connection.close(conn); %>
  </body>
</html>
