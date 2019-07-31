<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>

<head>
	<title>List users</title>
	
	<!-- reference our style sheet -->

        <style>
            html, body{
	margin-left:15px; margin-right:15px; 
	padding:0px; 
	font-family:Verdana, Arial, Helvetica, sans-serif;
}

table {   
	border-collapse:collapse;
	border-bottom:1px solid gray;
	font-family: Tahoma,Verdana,Segoe,sans-serif;
	width:72%;
}
 
th {
	border-bottom:1px solid gray;
	background:none repeat scroll 0 0 #09c332;
	padding:10px;
	color: #FFFFFF;
}

tr {
	border-top:1px solid gray;
	text-align:center;	
}
 
tr:nth-child(even) {background: #FFFFFF}
tr:nth-child(odd) {background: #BBBBBB}	
 
#wrapper {width: 100%; margin-top: 0px; }
#header {width: 70%; background: #09c332; margin-top: 0px; padding:15px 0px 15px 15px;}
#header h2 {width: 100%; margin:auto; color: #FFFFFF;}
#container {width: 100%; margin:auto}
#container h3 {color: #000;}
#container #content {margin-top: 20px;}

.add-button {
	border: 1px solid #666; 
	border-radius: 5px; 
	padding: 4px; 
	font-size: 12px;
	font-weight: bold;
	width: 120px; 
	padding: 5px 10px; 
	
	margin-bottom: 15px;
	background: #cccccc;
}
        </style>

</head>

<body>

	<div id="wrapper">
		<div id="header">
			<h2>WEB PRODAVNICA-prodaja/kupci</h2>
		</div>
	</div>
	
	<div id="container">
	
		<div id="content">
		
			 <input type="button" value="DODAJ KUPCA" onclick="window.location.href='showFormForAdd'; return false;"  class="add-button" />
		
			<table>
				<tr>
					<th>id</th>
					<th>ime</th>
					<th>prezime</th>
                                        <th>Action</th>
				</tr>
				
				<!-- loop over and print our customers -->
				<c:forEach var="kupci" items="${kupci}">
                                    <c:url var="updateLink" value="popunjavanjetabele">
                                        <c:param name="kupac_id" value="${kupci.id}" />
                                    </c:url>
                                   
					<tr>
						<td>${kupci.id}</td>
						<td>${kupci.ime}</td>
						<td>${kupci.prezime}</td>
                                                <td>
                                                    <a href="${updateLink}">PRODAJ NJEMU/NJOJ</a>
                                                   
                                                </td>
					</tr>
				
				</c:forEach>
						
			</table>
				
		</div>
	
	</div>
	

</body>

</html>
