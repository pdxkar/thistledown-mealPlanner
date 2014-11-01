<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.2.min.js"></script>

<style type="text/css">
/* #boxB {    margin-left: auto; margin-right: auto; width: 70%; background-color: #b0e0e6; -moz-user-select:none; } */
 #boxB { float:right; width: 60%; margin-right: 100px; background-color: #b0e0e6; -moz-user-select:none; } 
/* #boxB { float:right;padding:10px;margin:10px;-moz-user-select:none; } */
/* #boxB { background-color: #FF6699; width:150px; height:150px; } */
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript">

	var xmlhttp;
	function init() {
		// put more code here in case you are concerned about browsers that do not provide XMLHttpRequest object directly
		xmlhttp = new XMLHttpRequest();
	}
	
	function getdetails() {
	
		/* var componentid = document.getElementById("componentid"); */
		
		var url = "http://localhost:8080/mealPlanner/data/components/";

		xmlhttp.open('GET', url, true);
		xmlhttp.send(null);
		xmlhttp.onreadystatechange = function() {

		//	var componentname = document.getElementById("componentname");
		//	var componentcalories = document.getElementById("componentcalories");
			if (xmlhttp.readyState == 4) {

				if (xmlhttp.status == 200) {
					var det = eval("(" + xmlhttp.responseText + ")");
					
					for (var i = 0; i < det.length; i++) {
//							if (det[i].itemid == componentid.value) {
							//	componentname.value = det[i].itemname;
							//	componentcalories.value = det[i].calories;
							//	componentNameFromList.value = det[i].itemname;
							
							//dynamically create a div
							var magicDiv = document.createElement('div');
							magicDiv.id = "magicDiv" + i;
							//magicDiv.innerHTML = "I'm another kind of div";
							magicDiv.innerHTML = det[i].itemname;
							//det[i].itemname
							magicDiv.draggable = "true";
							document.body.appendChild(magicDiv);

							function drag(event) {
   								 return dragStart(event);
							}

							magicDiv.addEventListener("dragstart", drag);
					}
					
				} else
					alert("Error ->" + xmlhttp.responseText); 
			}
		};
	}

function dragStart(ev) {
   ev.dataTransfer.effectAllowed='move';
   ev.dataTransfer.setData("Text", ev.target.getAttribute('id'));
   ev.dataTransfer.setDragImage(ev.target,0,0);
   return true;
}
function dragEnter(ev) {
   event.preventDefault();
   return true;
}
function dragOver(ev) {
    return false;
}
function dragDrop(ev) {
   var src = ev.dataTransfer.getData("Text");
   ev.target.appendChild(document.getElementById(src));
   ev.stopPropagation();
   return false;
}

</script>
</head>
<body onload="init()">
	<h1>Component Lookup</h1>
	<table>
		<tr>
			<!-- <td>Enter Componentgggg ID :</td> -->
			<td>
			<!-- <input type="text" id="componentid" size="10" />  -->
				<input type="button" value="Get Everything in DB" onclick="getdetails()" />
		</tr>
<!-- 		<tr>
			<td>Component Name :</td>
			<td><input type="text" readonly="true" id="componentname" size="20" /></td>
		</tr>  -->

<!-- 		<tr>
			<td>Component calories :</td>
			<td><input type="text" readonly="true" id="componentcalories" size="10" /></td>
		</tr> -->
	</table>

<div id="boxB" ondragenter="return dragEnter(event)" 
     ondrop="return dragDrop(event)" 
     ondragover="return dragOver(event)">Menu</div>
     
</body>
</html>