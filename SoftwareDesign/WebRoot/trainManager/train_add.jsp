<%@ page contentType="text/html;charset=GBK" import="java.sql.*" contentType="text/html;charset=GBK"%>
<jsp:useBean id="jdbc_connection" class="dataBase.jdbc_connection" scope="page"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'train_add.jsp' starting page</title>

  </head>
  
  <body background="images/mypic/mainbackground.jpg">
  <center><h3><font color="white">�����γ���Ϣ</font></h3></center>
    <%request.setCharacterEncoding("GBK"); %>
    <form action="trainManager/train_insert.jsp">
           <table border=1 width=1000>
             <tr bgcolor="#a9987b">
               <td>�γ̱��</td>
               <td><input type="text" name="trainNum" ></td>
               <td>�γ�����</td>
               <td><input type="text" name="trainName" ></td>
               <td>�γ̷���</td>
               <td><input type="text" name="trainPay" ></td>
             </tr>
             <tr>
               <td>����ʱ��</td>
               <td><input type="text" name="trainTime" ></td>
               <td>�����ż�</td>
                <td><input type="text" name="trainLevel" ></td> 
               <td><input type="submit" value="�ύ">
                <input type="reset" value="����"></td>
             </tr>
           </table>
        </form>
  </body>
</html>
