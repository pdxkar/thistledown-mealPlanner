<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<style>
#div1 {width:350px;height:120px;padding:10px;border:1px solid #aaaaaa;}
</style>
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
	
//This is the beginning of the drag and drop exercise	(js part)
	function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text/html", ev.target.id);
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text/html");
    ev.target.appendChild(document.getElementById(data));
}
//This is the end of the drag and drop exercise	
	
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
	
	<!-- this is beginning of the drag and drop exercise (html part) -->
	
	<p>Drag the monster images into the rectangle:</p>

<div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
<br>
<img id="drag1" src="../assets/img/monster.gif" draggable="true" ondragstart="drag(event)" width="87" height="99">
<img id="drag2" src="../assets/img/monster2.jpg" draggable="true" ondragstart="drag(event)" width="99" height="99">

<p id="drag3" draggable="true" ondragstart="drag(event)">This is a draggable paragraph.</p>

<!-- 			<td><input type="text" readonly="true" id="componentcalories" size="10" /></td> -->
</body>
</html> 