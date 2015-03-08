<%String _appContext_ = getServletContext().getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.4.2.min.js"></script>
<script src="<%=_appContext_%>/assets/js/test.js"></script>
<script src="<%=_appContext_%>/assets/js/dragAndDrop.js"></script>
<script src="<%=_appContext_%>/assets/js/sortComponents.js"></script>
 <style type="text/css">

 #boxB { float:right; width: 50%; margin-right: 50px; background-color: #b0e0e6; -moz-user-select:none; } 
 #runningTotalBox { float:right; width: 50%; height: 10%; margin-right: 50px; background-color: #CCFFFF; }

</style> 

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body onload="init()"> 
<!-- <body> -->
	<h1>Meal Planner</h1>
 	<table>
		<tr>
		<td><input type="button" value="Show Favorites" onclick="getdetails(11, true)" /></td>
		<td><input type="button" value="Show All" onclick="getdetails(0, false)" /></td>
		<td><input type="button" value="Show Protein" onclick="getdetails(1, false)" /></td>
		<td><input type="button" value="Show Carbs" onclick="getdetails(2, false)" /></td>
		<td><input type="button" value="Show Fruit" onclick="getdetails(3, false)" /></td>
		<td><input type="button" value="Show Veggies" onclick="getdetails(4, false)" /></td>
		<td><input type="button" value="Show Dairy" onclick="getdetails(5, false)" /></td>
		<td><input type="button" value="Show Beverages" onclick="getdetails(8, false)" /></td>
		<td><input type="button" value="Show Condiments" onclick="getdetails(10, false)" /></td>
		<td><input type="button" value="Show Alcohol" onclick="getdetails(9, false)" /></td>		
		<td><input type="button" value="Show Meals" onclick="getdetails(6, false)" /></td>
		<td><input type="button" value="Show Other" onclick="getdetails(7, false)" /></td>
		</tr>
	</table> 
	
<div id="boxB" ondragenter="return dragEnter(event)" 
     ondrop="return dragDrop(event)" 
     ondragover="return dragOver(event)"><b>Menu</b></div>
     
<div id="componentContainer" ondragenter="return dragEnter(event)" 
     ondrop="return dragDropBack(event)" 
     ondragover="return dragOver(event)"
     style="height:500px;width:600px;border:1px solid #ccc;overflow:scroll;">
     </div>
 
<div id="runningTotalBox">Totals:</div>
 <input type="button" onclick="popup()" value="Click Me!">    
</body>
</html>