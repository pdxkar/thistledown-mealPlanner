<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<!-- <style>
#div1 {width:350px;height:120px;padding:10px;border:1px solid #aaaaaa;}
</style> -->

<style type="text/css">
#boxA, #boxB {
   float:left;padding:10px;margin:10px;-moz-user-select:none;
}
#boxA { background-color: #6633FF; width:75px; height:75px;  }
#boxB { background-color: #FF6699; width:150px; height:150px; }

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
							//	componentname.value = det[i].itemname;
								componentcalories.value = det[i].calories;
								componentNameFromList.value = det[i].itemname;
								break;
							}
					}  
					
				} else
					alert("Error ->" + xmlhttp.responseText); 
			}
		};
	}
	
//This is the beginning of the W3Schools drag and drop exercise	(js part)
/* 	function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text/html", ev.target.id);
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text/html");
    ev.target.appendChild(document.getElementById(data));
} */
//This is the end of the W3Schools drag and drop exercise

//This is the beginning of TutorialsPoint draganddrop exercise (javascript)
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
//This is the end of TutorialsPoint draganddrop exercise (javascript)
	
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
<!-- 		<tr>
			<td>Component Name :</td>
			<td><input type="text" readonly="true" id="componentname" size="20" /></td>
		</tr> -->

		<tr>
			<td>Component calories :</td>
			<td><input type="text" readonly="true" id="componentcalories" size="10" /></td>
		</tr>
	</table>
	
	
	<!-- This is the beginning of the W3Schools drag and drop exercise HTML -->	
<!-- 	<p>Drag the monster images into the rectangle:</p>

<div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
<br>
<img id="drag1" src="../assets/img/monster.gif" draggable="true" ondragstart="drag(event)" width="87" height="99">
<img id="drag2" src="../assets/img/monster2.jpg" draggable="true" ondragstart="drag(event)" width="99" height="99">

 <p id="drag3" draggable="true" ondragstart="drag(event)">This is a VERY Extremely draggable paragraph.</p> 
 <div id="dragme" draggable="true" ondragstart="drag(event)">
 	<input type="text" id="componentNameFromList" />
 </div> -->

<!-- This is the end of the W3Schools drag and drop exercise HTML -->

<!-- This is the beginning of the tutorialsPoint drag and drop exercise -->

<div>Try to move the purple box into the pink box.</div>

<div id="boxA" draggable="true" 
     ondragstart="return dragStart(event)">
   <p>Drag Me</p>
</div>

<div id="boxC" draggable="true" 
     ondragstart="return dragStart(event)">
   <input type="text" id="componentNameFromList" />
</div>

<div id="boxB" ondragenter="return dragEnter(event)" 
     ondrop="return dragDrop(event)" 
     ondragover="return dragOver(event)">Dustbin</div>
     

     
<!-- This is the end of the tutorialsPoint drag and drop exercise -->

	

</body>
</html>