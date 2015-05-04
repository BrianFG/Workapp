<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <%@ page import="java.sql.*" %>
    <%@page import="work.*" %>
    <%@page import="conexion.*" %>
    
    <%
    int id = Integer.parseInt(request.getParameter("id"));
    Estadistica est = new Estadistica(id);
    String values = est.formatEst1();
    String values2 = est.formatEst2();
    
    %>
<html>
      <head>
        <!--Load the AJAX API-->
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <script type="text/javascript">

          // Load the Visualization API and the piechart package.
          google.load('visualization', '1.0', {'packages':['corechart']});

          // Set a callback to run when the Google Visualization API is loaded.
          google.setOnLoadCallback(drawChart);

          // Callback that creates and populates a data table,
          // instantiates the pie chart, passes in the data and
          // draws it.
          function drawChart() {

            // Create the data table.
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Musculo');    
            data.addColumn('number', 'Ejercicios');
            data.addRows([
              <%=values%>
            ]);
            // Create the data table.
            var data3 = new google.visualization.DataTable();
            data3.addColumn('string', 'Fecha');
            data3.addColumn('number', 'Peso');
            data3.addColumn('number', 'IMC');
            data3.addRows([
              <%=values2 %>
            ]);

            // Set chart options
            var options = {'title':'Musculos ejercitados',
                           'width':400,
                           'height':300};
            // Set chart options
            var options3 = {'title':'Peso y IMC',
                           'width':350,
                           'height':300};

            // Instantiate and draw our chart, passing in some options.
            var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
            chart.draw(data, options);
            var chart3 = new google.visualization.LineChart(document.getElementById('chart_div3'));
            chart3.draw(data3, options3);

          }
        </script>
      </head>

      <body>
        <!--Divs that will hold the charts-->
        <div id="chart_div"></div>
        <div id="chart_div2"></div>
        <div id="chart_div3"></div>
      </body>
    </html>