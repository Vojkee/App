<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>

<head>
	<title>List Customers</title>
	
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
	width: 135px; 
	padding: 5px 10px; 
	
	margin-bottom: 15px;
	background: #cccccc;
}
        </style>

</head>

<body>

	<div id="wrapper">
		<div id="header">
			<h2>WEB PRODAVNICA-Lista Proizvoda</h2>
		</div>
	</div>
	
	<div id="container">
	
		<div id="content">
		
                    <input type="button" value="NOVI PROIZVOD" onclick="window.location.href='showFormForAddproizvod'; return false;"  class="add-button" />
		
			<table>
				<tr>
					<th>id_proizovda</th>
					<th>naziv</th>
					<th>kolicina</th>
                                        <th>dobavljavac</th>
				</tr>
				
				<!-- loop over and print our customers -->
				<c:forEach var="proizvodi" items="${proizvodi}">
                                     <c:url var="updateLink" value="showformforupdate-proizvod">
                                        <c:param name="proizvod_id" value="${proizvodi.id}" />
                                        </c:url>
                                        <c:url var="deleteLink" value="showformfordeleteforproizvod">
                                        <c:param name="proizvod_id" value="${proizvodi.id}" />
                                    </c:url>
                                    
                                 
                                  
				
					<tr>
						<td> ${proizvodi.id} </td>
						<td> ${proizvodi.naziv} </td>
						<td> ${proizvodi.kolicina} </td>
                                                <td> ${proizvodi.dobavljavac} </td>
                                                 <td>
                                                    <a href="${updateLink}">Update</a>
                                                     |
                                                    <a href="${deleteLink}" onclick="if (!(confirm('Da li si siguran da zelis da izbrises kupca?'))) return false">Delete</a>
                                         
                                                </td>
					</tr>
				
				</c:forEach>
						
			</table>
				
		</div>
	
	</div>
	
<h1><a href="${pageContext.request.contextPath}/">Vrati se na pocetnu stranicu</a></h1>
</body>

</html>
