<%@ page contentType="text/html;charset=GBK" import="java.sql.*" contentType="text/html;charset=GBK"%>
<jsp:useBean id="jdbc_connection" class="dataBase.jdbc_connection" scope="page"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'train_insert.jsp' starting page</title>

  </head>
  
  <body background="images/mypic/mainbackground.jpg">
    <%
       request.setCharacterEncoding("gbk");
      String trainNum=request.getParameter("trainNum");
      String trainName=request.getParameter("trainName");
      String trainPay=request.getParameter("trainPay");
      String trainTime=request.getParameter("trainTime");
      String trainLevel=request.getParameter("trainLevel");
      Connection conn=jdbc_connection.getConn();
      PreparedStatement pstmt=null;
      pstmt=conn.prepareStatement("insert into train values(?,?,?,?,?)");
      pstmt.setString(1,trainNum);
      pstmt.setString(2,trainName);
      pstmt.setString(3,trainPay);
      pstmt.setString(4,trainTime);
      pstmt.setString(5,trainLevel);
      pstmt.executeUpdate();
     %>
     <center>
     <br><br><h3><font color="white">��ӿγ̳ɹ���</font></h3>
     <br>
     <br><h3><font color="white">��Ӻ���Ϣ</font></h3>
     <br>
     <br>
      <table bgcolor="grey" border=1 width=1000 border=1 >
        <tr bgcolor="#a9987b">
          <td>�γ̱��</td>
          <td>�γ�����</td>
          <td>��ѵ����</td>
          <td>����ʱ��</td>
          <td>�����ż�</td>
            <td>����</td>
           
        </tr>
        
        <%
        ResultSet rs=pstmt.executeQuery("select * from train where trainNum='"+trainNum+"'");
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
       rs.close();
		pstmt.close();
		conn.close();
        }
         %>
         </table>
          <br>
     
     
      <center><a href="trainManager/trainType.jsp"><font color="white">���ؿγ���Ϣҳ��</font></a></center>
     </center>
  </body>
</html>
