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
    <title>employee_add page</title>

  </head>
  
  <body background="images/mypic/mainbackground.jpg">
  <font color="white"><center><h3>����Ա����Ϣ</h3></center></font>
  <%request.setCharacterEncoding("GBK"); %>
  <form action="filePro/employee_insert.jsp">
    <table bgcolor="grey" border=1 width=1000 border=1 >
        <tr bgcolor="#a9987b">
          <td>����</td>
          <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>Ա��ID</td>
            <td><input type="text" name="Eid"></td>
            <td>����</td>
            <td><input type="text" name="age"></td>
        </tr>
        
        <tr>
            <td>�Ա�</td>
            <td>
                <input type="radio" name="sex" id="male" value="male" checked="checked"><label for="male">��</label>
                <input type="radio" name="sex" id="female" value="female"><label for="female">Ů</label>
            </td>
            <td>ѧ��</td>
            <td><input type="text" name="educational"></td>
        </tr>
        
        <tr>
            <td>����</td>
            <td>
               <select name="department">
                  <option value="��Ʋ�">��Ʋ�</option>
                  <option value="������">������</option>
                  <option value="������">������</option>
               </select>
            </td>
            <td>ְλ</td>
            <td>
               <select name="position">
                  <option value="��Ա">��Ա</option>
                  <option value="����">����</option>
                  <option value="����">����</option>
               </select>
            </td>
        </tr>
        
        <tr>
            <td>��ְ״̬</td>
            <td>
                <input type="radio" name="state" id="true" value="true" checked="checked"><label for="true">true</label>
                <input type="radio" name="state" id="false" value="false"><label for="false">false</label>
            </td>
            <td><input type="submit" value="�ύ">
                <input type="reset" value="����"></td>
        </tr>
        
        
    </table>
    </form>
  </body>
</html>
