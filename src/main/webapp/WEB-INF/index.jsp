<!DOCTYPE HTML>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.2.min.js"></script>

<style type="text/css">

/*  #boxB { float:right; width: 50%; margin-right: 50px; background-color: #b0e0e6; -moz-user-select:none; } 
 #runningTotalBox { float:right; width: 50%; height: 10%; margin-right: 50px; background-color: #CCFFFF; } */

</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript">

/* 	var quickSortHits = 0;

	var runningTotalCalories = 0;
	var runningTotalCarbs = 0;
	var runningTotalProtein = 0;
	var runningTotalFiber = 0;
	var runningTotalSugar = 0;
	var runningTotalSodium = 0;
	var runningTotalFat = 0;
	var runningTotalCholesterol = 0; */

	var xmlhttp;
	function init() {
		// put more code here in case you are concerned about browsers that do not provide XMLHttpRequest object directly
		xmlhttp = new XMLHttpRequest();
	}
	
	function getdetails(category) {
	
//	var url = "http://localhost:8080/mealPlanner/data/components/";

	var url = "http://api.data.gov/usda/ndb/reports/?ndbno=01009&type=f&format=json&api_key=a0C0r0iDT31VwSIDjDXChPXkDLpkGBQoSOSDDall";

	xmlhttp.open('GET', url, true);
	xmlhttp.send(null);
	xmlhttp.onreadystatechange = function() {

		if (xmlhttp.readyState == 4) {

			if (xmlhttp.status == 200) {
				 var det = eval("(" + xmlhttp.responseText + ")"); 
				
				var containingDiv = document.createElement('div');
				containingDiv.id = "containingDiv";
				containingDiv.style.height = "500px";
				containingDiv.style.width = "600px";
				containingDiv.style.border =  "1px solid #ccc";
                containingDiv.style.overflow = "scroll"; 
				
 				var magicDiv = document.createElement('div');
				magicDiv.id = "magicDiv" + 1; 
/* 				 magicDiv.innerHTML = "<b>This is coming from the magic div</b>";  */
				
				magicDiv.itemname = "magicDiv String";
				
 				/* magicDiv.itemname = det.name;   */
				
				/* magicDiv.innerHTML = "<b>" + magicDiv.itemname + "</b>";  */
				
				magicDiv.innerHTML = "<b>" + magicDiv.itemname + "</b>";
				
				containingDiv.appendChild(magicDiv);
				document.body.appendChild(containingDiv);
				
				//sort the array
/* 				var sortedDet = quickSort(det);
		
		//		var sortedDet = det;
				
				//clear any component list previously displayed
				if(document.getElementById("containingDiv") != null){
					var element = document.getElementById("containingDiv");
   					element.parentNode.removeChild(element);
				}
				
				var containingDiv = document.createElement('div');
				containingDiv.id = "containingDiv";
				containingDiv.style.height = "500px";
				containingDiv.style.width = "600px";
				containingDiv.style.border =  "1px solid #ccc";
				containingDiv.style.overflow = "scroll";
				
					for (var i = 0; i < sortedDet.length; i++) {
						if(sortedDet[i].category == category || category == 0) {
							//dynamically create a div
							var magicDiv = document.createElement('div');
							magicDiv.id = "magicDiv" + i;
							//set custom attributes to be totaled after element is draggedAndDropped
							magicDiv.basequantity = sortedDet[i].basequantity;
							//blank out null values for baseunitofmeasure to make UI more readable
							if (sortedDet[i].baseunitofmeasure){
								magicDiv.baseunitofmeasure = sortedDet[i].baseunitofmeasure;
							} else { 
								magicDiv.baseunitofmeasure = ""; 
							}
							magicDiv.itemname = sortedDet[i].itemname; 
							magicDiv.calories = sortedDet[i].calories;
							magicDiv.carbs = sortedDet[i].carbs;
							magicDiv.protein = sortedDet[i].protein;
							magicDiv.fiber = sortedDet[i].fiber;
							magicDiv.sugar = sortedDet[i].sugar;
							magicDiv.sodium = sortedDet[i].sodium;
							magicDiv.fat = sortedDet[i].fat;
							magicDiv.cholesterol = sortedDet[i].cholesterol;

							//set innerHTML
							magicDiv.innerHTML = 
										 "<b>" + "<a style=\"color:blue; font-size:105%;\">" + magicDiv.itemname + "</a>"
										 + ", " + magicDiv.basequantity
										 + " " + magicDiv.baseunitofmeasure + "</b>" 
										 + "<br />" + "&nbsp; &nbsp; &nbsp;" 
										 + "<b>" + magicDiv.calories + " cal" + "</b>" 
										 + "<a style=\"color: grey; font-size: 85%; font-style: italic;\">"
										 + ", "+ magicDiv.protein + " g protein "
										 + ", "+ magicDiv.carbs + " g carbs "
										 + ", "+ magicDiv.fiber + " g fiber "
										 + ", "+ magicDiv.sugar + " g sugar "
										 + ", "+ magicDiv.fat + " g fat "
										 + ", "+ magicDiv.cholesterol + " mg chol "
										 + ", "+ magicDiv.sodium + " mg sodium "
    									 + "</a>";
							
							magicDiv.draggable = "true";
							containingDiv.appendChild(magicDiv);
						document.body.appendChild(containingDiv);

						function drag(event) {
  								 return dragStart(event);
						}

						magicDiv.addEventListener("dragstart", drag);
					} 
				} */
			} else
				alert("Error ->" + xmlhttp.responseText); 
		}
	};
}



</script> 
</head>
<body onload="init()">
	<h1>Meal Planner</h1>
 	<table>
		<tr>
		<td><input type="button" value="Show All" onclick="getdetails(0)" /></td>
		<td><input type="button" value="Show Protein" onclick="getdetails(1)" /></td>
		<td><input type="button" value="Show Carbs" onclick="getdetails(2)" /></td>
		<td><input type="button" value="Show Fruit" onclick="getdetails(3)" /></td>
		<td><input type="button" value="Show Veggies" onclick="getdetails(4)" /></td>
		<td><input type="button" value="Show Dairy" onclick="getdetails(5)" /></td>
		<td><input type="button" value="Show Beverages" onclick="getdetails(8)" /></td>
		<td><input type="button" value="Show Condiments" onclick="getdetails(10)" /></td>
		<td><input type="button" value="Show Alcohol" onclick="getdetails(9)" /></td>		
		<td><input type="button" value="Show Meals" onclick="getdetails(6)" /></td>
		<td><input type="button" value="Show Other" onclick="getdetails(7)" /></td>
		</tr>
	</table> 
	
<div>Gonzo</div>	



<!-- <div id="boxB" ondragenter="return dragEnter(event)" 
     ondrop="return dragDrop(event)" 
     ondragover="return dragOver(event)"><b>Menu</b></div>
     
<div id="runningTotalBox">Totals:</div> -->


     
</body>
</html>