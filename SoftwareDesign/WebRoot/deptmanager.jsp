<%@ page language="java" import="java.util.*, java.io.File,java.io.IOException,java.sql.*,java.text.DecimalFormat,java.text.NumberFormat,org.jfree.chart.ChartFactory,org.jfree.chart.ChartUtilities,
org.jfree.chart.JFreeChart,org.jfree.chart.labels.StandardPieSectionLabelGenerator, org.jfree.chart.plot.PiePlot,org.jfree.data.general.DefaultPieDataset" pageEncoding="GBK"%>
<jsp:useBean id="jdbc_connection" class="dataBase.jdbc_connection" scope="page"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>���Ź���</title>
    
  </head>
  
  <body background="images/mypic/mainbackground.jpg"><font color="white">
  <h1>��ǰλ�ã����Ź���-->���Ź���</h1></font>
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
           request.setCharacterEncoding("GBK");
           Connection conn=jdbc_connection.getConn();
           Statement stmt=jdbc_connection.getStmt(conn);
           String sql="select * from employeeinfo";
           ResultSet rs=jdbc_connection.getRs(stmt,sql);
           
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
		      <td><a href="dept_add.jsp?Eid=<%=rs.getString("Eid")%>&&department=<%=rs.getString("department")%>">�޸Ĳ���</a></td>
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
     <% 
          Connection conn3=jdbc_connection.getConn();
          Statement stmt3=jdbc_connection.getStmt(conn3);
          ResultSet resultSet = stmt3.executeQuery("select * from chart" );
          DefaultPieDataset dataset = new DefaultPieDataset( );
       
         
          while( resultSet.next( ) ) 
          {
             dataset.setValue( 
             resultSet.getString("degree" ) ,
             Double.parseDouble( resultSet.getString( "num" )));
          }
          JFreeChart chart = ChartFactory.createPieChart(
             "���������ֲ�",  // chart title           
             dataset,         // data           
             true,            // include legend          
             true,           
             false );
          PiePlot pieplot = (PiePlot) chart.getPlot(); //ͨ��JFreeChart ������
          pieplot.setNoDataMessage("�����ݿɹ���ʾ��"); // û�����ݵ�ʱ����ʾ������
          pieplot.setLabelGenerator(new StandardPieSectionLabelGenerator(
          ("{0}: ({2})"), NumberFormat.getNumberInstance(),
          new DecimalFormat("0.00%")));
          
          int width = 700; /* Width of the image */
          int height = 330; /* Height of the image */ 
          File pieChart = new File( "../webapps/SoftwareDesign/images/Pie_Chart.jpeg" );
          ChartUtilities.saveChartAsJPEG( pieChart , chart , width , height );
        
    
  %>
     
     <img src="images/Pie_Chart.jpeg"><img>
  </body>
</html>
