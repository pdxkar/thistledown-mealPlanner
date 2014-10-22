<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.2.min.js"></script>
<!-- <style>
#div1 {width:350px;height:120px;padding:10px;border:1px solid #aaaaaa;}
</style> -->

<style type="text/css">
#boxA, #boxB {
   float:left;padding:10px;margin:10px;-moz-user-select:none;
}
#boxA { background-color: #6633FF; width:75px; height:75px;  }
#boxB { background-color: #FF6699; width:150px; height:150px; }

/* This is the beginning of Dharmendra's click and move example ()  */

select {
	width:200px;
	height:100px;
}

/* This is the end of Dharmendra's click and move example (css)  */

</style>

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
							//	componentNameFromList.value = det[i].itemname;
							
							/* 
							function setText(id,newvalue) {
  							var s= document.getElementById(id);
  							s.innerHTML = newvalue;
							 */
							var s = document.getElementById("boxC");
							s.innerHTML = "hello";
							
								break;
							}
					}  
					
				} else
					alert("Error ->" + xmlhttp.responseText); 
			}
		};
	}

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

//This is the beginning of Dharmendra's click and move example (javascript)

   /*
		@param1 - sourceid - This is the id of the multiple select box whose item has to be moved.
		@param2 - destinationid - This is the id of the multiple select box to where the iterms should be moved.
	*/
	
	//this will move selected items from source list to destination list			
	function move_list_items(sourceid, destinationid)
	{
		$("#"+sourceid+"  option:selected").appendTo("#"+destinationid);
	}

	//this will move all selected items from source list to destination list
	function move_list_items_all(sourceid, destinationid)
	{
		$("#"+sourceid+" option").appendTo("#"+destinationid);
	}
	
//This is the end of Dharmendra's click and move example (javascript)
	
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
	
<!-- This is the beginning of the tutorialsPoint drag and drop exercise -->

<div>Try to move the purple box into the pink box.</div>

<div id="boxA" draggable="true" 
     ondragstart="return dragStart(event)">
   <p>Drag Me</p>
</div>

<div id="boxC" draggable="true" 
     ondragstart="return dragStart(event)">
<!--    <input type="text" id="componentNameFromList" /> -->
</div> 

<div id="boxB" ondragenter="return dragEnter(event)" 
     ondrop="return dragDrop(event)" 
     ondragover="return dragOver(event)">Dustbin</div>
     
<!-- This is the end of the tutorialsPoint drag and drop exercise -->

<!-- this is the beginning of Dharmendra's click and move example (html) -->
	<table cellpadding="5" cellspacing="5">

<tbody>

<tr>

    <td colspan="2">
        <select id="from_select_list" multiple="multiple" name="from_select_list"> 
        <option value="apple">Apple</option>
        <option value="mango">Mango</option> 
        <option value="bannana">Bannana</option> 
        <option value="grapes">Grapes</option> 
        </select>
    </td>
    
    <td colspan="2">
        <select id="to_select_list" multiple="multiple" name="to_select_list"> 
        <option value="winder">Winter</option> 
        <option value="summer">Summer</option> 
        <option value="rainy">Rainy</option> 
        <option value="Spring">Spring</option> 
        </select>
    </td>

</tr>

<tr>

    <td><input id="moveright" type="button" value="Move Right" onclick="move_list_items('from_select_list','to_select_list');" /></td>
    
    <td><input id="moverightall" type="button" value="Move Right All" onclick="move_list_items_all('from_select_list','to_select_list');" /></td>
    
    <td><input id="moveleft" type="button" value="Move Left" onclick="move_list_items('to_select_list','from_select_list');" /></td>
    
    <td><input id="moveleftall" type="button" value="Move Left All" onclick="move_list_items_all('to_select_list','from_select_list');" /></td>

</tr>

</tbody>

</table>
<!-- this is the end of Dharmendra's click and move example (html) -->
</body>
</html>