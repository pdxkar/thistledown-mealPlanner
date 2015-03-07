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

	var xmlhttp;
	function init() {
		// put more code here in case you are concerned about browsers that do not provide XMLHttpRequest object directly
		xmlhttp = new XMLHttpRequest();
	}
	
	function getdetails(category) {
	
// 09040 = banana
// 01009 = cheddar cheese
	var url = "http://api.data.gov/usda/ndb/reports/?ndbno=09040&type=f&format=json&api_key=a0C0r0iDT31VwSIDjDXChPXkDLpkGBQoSOSDDall";

	xmlhttp.open('GET', url, true);
	xmlhttp.send(null);
	xmlhttp.onreadystatechange = function() {

		if (xmlhttp.readyState == 4) {

			if (xmlhttp.status == 200) {
				 var det = eval("(" + xmlhttp.responseText + ")"); 
				
				var containingDiv = document.createElement('div');
				containingDiv.id = "containingDiv";
				containingDiv.style.height = "500px";
				containingDiv.style.width = "1200px";
				containingDiv.style.border =  "1px solid #ccc";
                containingDiv.style.overflow = "scroll"; 
				
 				var magicDiv = document.createElement('div');
				magicDiv.id = "magicDiv" + 1; 

				magicDiv.itemname = det.report.food.name; 
				magicDiv.measurement = det.report.food.nutrients[1].measures[0].eqv;
				magicDiv.calories = det.report.food.nutrients[1].measures[0].value;
								 
				 				magicDiv.innerHTML = "<b>itemname: " + magicDiv.itemname + "</b>"
				 + " base measurement: " + magicDiv.measurement + " grams "
				 + " base kCal: " + magicDiv.calories
				 + " my measurement: " + "_______" + " grams " // I enter g here
				 + " my kCal: " + "_______" + " grams "; //this is calculated to be: (base g/base kcal)*my g
				
				
				containingDiv.appendChild(magicDiv);
				document.body.appendChild(containingDiv);
				
function myFunction() {
    var myGrams = document.getElementById("myGrams").value.indexOf("@");
/*     var age = document.getElementById("age").value;
    var fname = document.getElementById("fname").value; */
    submitOK = "true";

     if (myGrams.length > 0) {
        alert("# grams entered: ") + myGrams;
       // submitOK = "false";
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
	<h1>Meal Planner</h1>
 	<table>
		<tr>
<!-- 		<td><input type="button" value="Show All" onclick="getdetails(0)" /></td>
		<td><input type="button" value="Show Protein" onclick="getdetails(1)" /></td>
		<td><input type="button" value="Show Carbs" onclick="getdetails(2)" /></td>
		<td><input type="button" value="Show Fruit" onclick="getdetails(3)" /></td>
		<td><input type="button" value="Show Veggies" onclick="getdetails(4)" /></td>
		<td><input type="button" value="Show Dairy" onclick="getdetails(5)" /></td>
		<td><input type="button" value="Show Beverages" onclick="getdetails(8)" /></td>
		<td><input type="button" value="Show Condiments" onclick="getdetails(10)" /></td>
		<td><input type="button" value="Show Alcohol" onclick="getdetails(9)" /></td>	-->	
		<td><input type="button" value="Display List" onclick="getdetails(6)" /></td>  
		<td><input type="button" value="Calculate" onclick="getdetails(7)" /></td><br>
		</tr>
	</table> 

<form action="#" onsubmit="return myFunction()">
  My grams: <input type="text" id="myGrams" size="5"><br>
<!--   Age (from 1 to 100): <input type="text" id="age" size="20"><br>
  E-mail: <input type="text" id="email" size="20"><br><br> -->
  <input type="submit" value="Submit"> 
</form>



<!-- <div id="boxB" ondragenter="return dragEnter(event)" 
     ondrop="return dragDrop(event)" 
     ondragover="return dragOver(event)"><b>Menu</b></div>
     
<div id="runningTotalBox">Totals:</div> -->


     
</body>
</html>