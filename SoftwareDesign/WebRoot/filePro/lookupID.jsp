<%@ page language="java" import="java.util.*" import="java.sql.*"  contentType="text/html;charset=GBK"%>
<jsp:useBean id="jdbc_connection" class="dataBase.jdbc_connection" scope="page"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>lookupID.jsp</title>

  </head>
  
  <body background="images/mypic/mainbackground.jpg">
    
    
     <form  action="filePro/lookupID.jsp"/>
    <h3><select name="select">
           <option value="Eid">��Ա��ID����</option>
           <option value="name">����������</option>
           <option value="age">���������</option>
           <option value="educational">��ѧ������</option>
           <option value="department">�����Ų���</option>
           <option value="position">��ְλ����</option>
           <option value="state">����ְ״̬����</option>
        </select>
    <input type="text" name="find">
    <input type="submit" value="����"></h3>
  </form>
  <font color="white">
    <br>
       <h3><font color="white">����������Ա����Ϣ</font></h3><hr></font>
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
            <%if("Ա��".equals(session.getAttribute("roleplay"))){ %>
            <%}else if("����Ա".equals(session.getAttribute("roleplay"))||"����".equals(session.getAttribute("roleplay"))){ %>
            <td>����</td>
            <%} %>
       </tr>
<% 
       request.setCharacterEncoding("gbk");
       String str=request.getParameter("select");
       String find=request.getParameter("find");
       Connection conn=jdbc_connection.getConn();
       Statement stmt=jdbc_connection.getStmt(conn);
       String sql="select * from employeeInfo where "+str+"='"+find+"'";
       ResultSet rs=jdbc_connection.getRs(stmt,sql);
    %>
    <%
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
            <%if("Ա��".equals(session.getAttribute("roleplay"))) {%>
            <%}else if("����Ա".equals(session.getAttribute("roleplay"))||"����".equals(session.getAttribute("roleplay"))){ %>
               <td><a href="filePro/employee_update.jsp?Eid=<%=rs.getString("Eid")%>">�޸�</a> <a href="filePro/employee_delete.jsp?Eid=<%=rs.getString("Eid")%>">ɾ��</a></td>
            <%} %>
        
	     <% out.println("</tr>");
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
        <h3><a href="filePro/employeeInformation.jsp"><font color="white">����Ա����Ϣҳ��</font></a></h3>
  </body>
</html>
