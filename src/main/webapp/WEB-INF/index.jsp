<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript">
	var xmlhttp;
	function init() {
		// put more code here in case you are concerned about browsers that do not provide XMLHttpRequest object directly
		xmlhttp = new XMLHttpRequest();
	}
	function getdetails() {
	
		var componentid = document.getElementById("componentid");
		
		var url = "http://localhost:8080/mealPlanner/data/components/";

		xmlhttp.open('GET', url, true);
		xmlhttp.send(null);
		xmlhttp.onreadystatechange = function() {

			var componentname = document.getElementById("componentname");
			var componentcalories = document.getElementById("componentcalories");
			if (xmlhttp.readyState == 4) {

				if (xmlhttp.status == 200) {
					var det = eval("(" + xmlhttp.responseText + ")");
					var i=0;
					var tot = 0;
					
					for (tot=det.length; i < tot; i++) {
							if (det[i].itemid == componentid.value) {
								componentname.value = det[i].itemname;
								componentcalories.value = det[i].calories;
								break;
							}
					}  
					
				} else
					alert("Error ->" + xmlhttp.responseText); 
			}
		};
	}
	
</script>
</head>
<body onload="init()">
	<h1>Component Lookup</h1>
	<table>
		<tr>
			<td>Enter Component ID :</td>
			<td><input type="text" id="componentid" size="10" /> 
				<input type="button" value="Get Details" onclick="getdetails()" />
		</tr>
		<tr>
			<td>Component Name :</td>
			<td><input type="text" readonly="true" id="componentname" size="20" /></td>
		</tr>

		<tr>
			<td>Component calories :</td>
			<td><input type="text" readonly="true" id="componentcalories"
				size="10" /></td>
		</tr>
	</table>
</body>
</html>