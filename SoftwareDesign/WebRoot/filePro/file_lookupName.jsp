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
    <title>My JSP 'file_lookupName.jsp' starting page</title>

  </head>
  
  <body background="images/mypic/mainbackground.jpg">
     <% 
       String str=request.getParameter("select");
       String find=request.getParameter("find");
       Connection conn=jdbc_connection.getConn();
       Statement stmt=jdbc_connection.getStmt(conn);
       String sql="select * from fileInfo where "+str+"='"+find+"' ";
       ResultSet rs=jdbc_connection.getRs(stmt,sql);
    %>
    
      <form action="filePro/file_lookupName.jsp">
       <h3><select name="select">
           <option value="fileNum">��������Ų���</option>
           <option value="fileName">���������Ʋ���</option>
           <option value="Eid">��Ա��ID����</option>
           <option value="name">��Ա����������</option>
           <option value="fileContent">���ĵ����ݲ���</option>
        </select>
        <input type="text" name="find">
        <input type="submit" value="��ѯ">
    </form>
    
     <br>
       <h3><font color="white">����������Ա������</font></h3><hr>
    <br>
    <table bgcolor="grey" border=1 width=1000 border=1 width="1000">
        <tr bgcolor="#a9987b">
           <td>�������</td>
           <td>��������</td>
           <td>��ԱID</td>
           <td>����</td>
           <td>����</td>
            <%if("Ա��".equals(session.getAttribute("roleplay"))){ %>
            <%}else if("����Ա".equals(session.getAttribute("roleplay"))||"����".equals(session.getAttribute("roleplay"))){ %>
            <td>����</td>
            <%} %>
        </tr>
        <% 
            while(rs.next()){
              out.println("<tr>");
              out.println("<td>"+rs.getString("fileNum")+"</td>");
              out.println("<td>"+rs.getString("fileName")+"</td>");
              out.println("<td>"+rs.getString("Eid")+"</td>");
              out.println("<td>"+rs.getString("name")+"</td>");
              out.println("<td>"+rs.getString("fileContent")+"</td>");
        %>
        
       <%if("Ա��".equals(session.getAttribute("roleplay"))) {%>
            <%}else if("����Ա".equals(session.getAttribute("roleplay"))||"����".equals(session.getAttribute("roleplay"))){ %>
              <td><a href="filePro/file_update.jsp?Eid=<%= rs.getString("Eid") %>">�޸�</a>|<a href="filePro/file_delete.jsp?Eid=<%=rs.getString("Eid")%>">ɾ��</a></td>
               <%} %>
              
              <%
              out.println("</tr>");
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
        <h3><a href="filePro/file_document.jsp"><font color="white">����Ա������ҳ��</font></a></h3>
  </body>
</html>
