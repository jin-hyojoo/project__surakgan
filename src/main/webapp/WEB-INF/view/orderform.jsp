<%@page import="dto.OderDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Calendar cal = Calendar.getInstance();

	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");

	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH);
	int date = cal.get(Calendar.DATE);

	if (strYear != null) {
		year = Integer.parseInt(strYear);
		month = Integer.parseInt(strMonth);
	}

	//년도/월 셋팅
	cal.set(year, month, 1);
	int startDay = cal.getMinimum(java.util.Calendar.DATE);
	int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
	int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
	int newLine = 0;

	//오늘 날짜 저장.
	Calendar todayCal = Calendar.getInstance();
	//SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
	SimpleDateFormat sdf = new SimpleDateFormat("dd");
	int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
	
	//주문내역
	List<OderDTO> orderList = (List<OderDTO>)request.getAttribute("orderList"); 
	int listCnt = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/myorder.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>

</head>
<body>
	<div id="content">
		<div id="calendar_div">
			<div><center><%=month+1 %>월</center></div>
			<table id="calendar_table">
				<tr>
					<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>
				</tr>
				<tr>
				<%
					//
					for(int i=1; i<start; i++){
						out.println("<td>&nbsp;</td>");
						newLine++;
					}
				
					for(int i=1; i<=endDay; i++){
						String color = "";
						
						if(newLine==0)	color = "#f45452";
						else if(newLine == 6) color = "#3d7dff";
						else	color = "#737373";
						
						//주문내역
						int startCnt = listCnt;
						String schedule = "<ul>";
						for(int j=0; j<3; j++){
							if(listCnt<orderList.size() && orderList.get(listCnt).getOn_getdate().getDate()==i){
								schedule += "<li>"+orderList.get(listCnt).getI_name()+" X "+orderList.get(listCnt).getOn_cnt()+"</li>";
								listCnt++;
							}else{
								break;
							}
						}
						
						for(;listCnt<orderList.size();listCnt++){
							if(orderList.get(listCnt).getOn_getdate().getDate()!=i){
								break;
							}
						}
						int endCnt = listCnt-1;
						
						schedule += "</ul>";
						
						out.println("<td><a href='#'><div class='day' style='color:"+color+"'>");
						if(i==intToday){
							out.println("<strong style='border:1px solid #e0e0e0'>"+i+"</strong>");
						}else{
							out.println(i);
						}
						out.println("</div>");
						out.println("<div class='schedule'>"+schedule+"</div></a></td>");
						newLine++;
						
						if(newLine==7){
							out.println("</tr>");
							if(i<endDay){
								out.println("<tr>");
							}
							newLine=0;
						}
					}
					//마지막 공란 LOOP
					while(newLine > 0 && newLine < 7)
					{
					  out.println("<td>&nbsp;</td>");
					  newLine++;
					}
				%>
				</tr>
			</table>
		</div>
	</div>

</body>
</html>