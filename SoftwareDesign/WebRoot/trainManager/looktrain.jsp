<%@ page contentType="text/html;charset=GBK" import="java.sql.*" contentType="text/html;charset=GBK"%>
<jsp:useBean id="jdbc_connection" class="dataBase.jdbc_connection" scope="page"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'looktrain.jsp' starting page</title>
    
	

  </head>
  
  <body background="images/mypic/mainbackground.jpg">
   <%
      request.setCharacterEncoding("gbk");
      String str=request.getParameter("select");
      String find=request.getParameter("find");
       Connection conn=jdbc_connection.getConn();
       Statement stmt=jdbc_connection.getStmt(conn);
       String sql="select * from train where "+str+"='"+find+"'";
       ResultSet rs=jdbc_connection.getRs(stmt,sql);
    %>
    
    <form action="looktrain.jsp">
    <h3><select name="select">
           <option value="trainNum">����ѵ��Ų���</option>
           <option value="trainName">���γ����ֲ���</option>
           <option value="trainPay">��������</option>
           <option value="trainTime">����ʼʱ�����</option>
           <option value="trainLevel">�������ż�����</option>
        </select>
    <input type="text" name="find">
    <input type="submit" value="����"></h3>
    </form>
    
    <br>
      <h3><font color="white">���������Ŀγ���Ϣ</font></h3><hr>
    <br>
    
     <table bgcolor="grey" border=1 width=1000 border=1 width=1000>
        <tr bgcolor="#a9987b">
          <td>�γ̱��</td>
          <td>�γ�����</td>
          <td>��ѵ����</td>
          <td>����ʱ��</td>
          <td>�����ż�</td>
            <td>����</td>
           
        </tr>
        
        <%
           try{
             while(rs.next()){
             out.println("<tr>");
                out.println("<td>"+rs.getString("trainNum")+"</td>");
                out.println("<td>"+rs.getString("trainName")+"</td>");
                out.println("<td>"+rs.getString("trainPay")+"</td>");
                out.println("<td>"+rs.getString("trainTime")+"</td>");
                out.println("<td>"+rs.getString("trainLevel")+"</td>");
        %>
            <%if("Ա��".equals(session.getAttribute("roleplay"))||"����".equals(session.getAttribute("roleplay"))) {%>
               <td><a href="trainManager/train_join.jsp?trainNum=<%= rs.getString("trainNum") %>">����</a>
            <%}else if("����Ա".equals(session.getAttribute("roleplay"))){ %>
               <td><a href="trainManager/train_update.jsp?trainNum=<%=rs.getString("trainNum")%>">�޸�</a> <a href="trainManager/train_delete.jsp?trainNum=<%=rs.getString("trainNum")%>">ɾ��</a></td>
            <%} %>
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
        <h3><a href="trainManager/trainType.jsp"><font color="white">���ؿγ���Ϣҳ��</font></a></h3>
  </body>
</html>
