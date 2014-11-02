<!DOCTYPE HTML>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.2.min.js"></script>

<style type="text/css">

 #boxB { float:right; width: 50%; margin-right: 50px; background-color: #b0e0e6; -moz-user-select:none; } 
 #runningTotalBox { float:right; width: 50%; margin-right: 50px; background-color: #666699; }

</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript">

	var runningTotalCalories = 0;
	var runningTotalCarbs = 0;
	var runningTotalProtein = 0;
	var runningTotalFiber = 0;
	var runningTotalSugar = 0;
	var runningTotalSodium = 0;
	var runningTotalFat = 0;

	var xmlhttp;
	function init() {
		// put more code here in case you are concerned about browsers that do not provide XMLHttpRequest object directly
		xmlhttp = new XMLHttpRequest();
	}
	
	function getdetails() {
		
		var url = "http://localhost:8080/mealPlanner/data/components/";

		xmlhttp.open('GET', url, true);
		xmlhttp.send(null);
		xmlhttp.onreadystatechange = function() {

			if (xmlhttp.readyState == 4) {

				if (xmlhttp.status == 200) {
					var det = eval("(" + xmlhttp.responseText + ")");
					
					for (var i = 0; i < det.length; i++) {
							//dynamically create a div
							var magicDiv = document.createElement('div');
							magicDiv.id = "magicDiv" + i;
							//set custom attributes to be totaled after element is draggedAndDropped
							magicDiv.basequantity = det[i].basequantity;
							magicDiv.baseunitofmeasure = det[i].baseunitofmeasure;
							magicDiv.itemname = det[i].itemname; 
							magicDiv.calories = det[i].calories;
							magicDiv.carbs = det[i].carbs;
							magicDiv.protein = det[i].protein;
							magicDiv.fiber = det[i].fiber;
							magicDiv.sugar = det[i].sugar;
							magicDiv.sodium = det[i].sodium;
							magicDiv.fat = det[i].fat;
							//set innerHTML
							magicDiv.innerHTML = det[i].basequantity
										 + " " + det[i].baseunitofmeasure 
										 + " " + det[i].itemname 
										 + ", "+ det[i].calories + " cal "
										 + ", "+ det[i].carbs + " g carbs "
										 + ", "+ det[i].protein + "g protein "
										 + ", "+ det[i].fiber + "g fiber "
										 + ", "+ det[i].sugar + "g sugar "
										 + ", "+ det[i].sodium + "mg sodium "
										 + ", "+ det[i].fat + "g fat ";
							
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
    
    runningTotalCalories += document.getElementById(src).calories;
    runningTotalCarbs += document.getElementById(src).carbs;
    runningTotalProtein += document.getElementById(src).protein;
    runningTotalFiber += document.getElementById(src).fiber;
    runningTotalSugar += document.getElementById(src).sugar;
    runningTotalSodium += document.getElementById(src).sodium;
    runningTotalFat += document.getElementById(src).fat; 
    
	document.getElementById("runningTotalBox").innerHTML = "Totals: cal: " 
			+ runningTotalCalories + " kCal, "
			+ "carbs: " + runningTotalCarbs + "g, "
			+ "protein: " + runningTotalProtein + "g, "
			+ "fiber: " + runningTotalFiber + "g, "
			+ "sugar: " + runningTotalSugar	+ "g, "
			+ "sodium: " + runningTotalSodium + "mg, "
			+ "fat: " + runningTotalFat + "g";
    
   ev.stopPropagation();
 
   return false;
}

</script>
</head>
<body onload="init()">
	<h1>Component Lookup</h1>
	<table>
		<tr>
			<td><input type="button" value="Get Everything in DB" onclick="getdetails()" />
		</tr>
	</table>

<div id="boxB" ondragenter="return dragEnter(event)" 
     ondrop="return dragDrop(event)" 
     ondragover="return dragOver(event)"><b>Menu</b></div>
     
<div id="runningTotalBox">Totals:</div>
     
</body>
</html>