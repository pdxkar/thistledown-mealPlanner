/**
 * 
 */
	var runningTotalCalories = 0;
	var runningTotalCarbs = 0;
	var runningTotalProtein = 0;
	var runningTotalFiber = 0;
	var runningTotalSugar = 0;
	var runningTotalSodium = 0;
	var runningTotalFat = 0;
	var runningTotalCholesterol = 0;

	var xmlhttp;
	function init() {
		// put more code here in case you are concerned about browsers that do not provide XMLHttpRequest object directly
		xmlhttp = new XMLHttpRequest();
	}
	
	function getDayMenu() {
	
	var url = "http://localhost:8080/mealPlanner/data/1/";

	xmlhttp.open('GET', url, true);
	xmlhttp.send(null);
	xmlhttp.onreadystatechange = function() {

		if (xmlhttp.readyState == 4) {

			if (xmlhttp.status == 200) {
				//var det = eval("(" + xmlhttp.responseText + ")");
				//to make it easier, let's call it "sortedDet until we actually sort it 
				var sortedDet = eval("(" + xmlhttp.responseText + ")");
				//let's not sort yet
				//sort the array
				//var sortedDet = quickSort(det);
				
				//I don't know how to adapt this to the dayplan
				//clear any component list previously displayed
/*				if(document.getElementById("componentContainer").innerHTML != null){
					var element = document.getElementById("componentContainer");
					element.innerHTML = "";
				} */
				
					for (var i = 0; i < sortedDet.length; i++) {
						//we're just going to show everything for now, so comment the "if" out:
						//if( sortedDet[i].category == category || category == 0 || (sortedDet[i].favorite === true && showFavorites === true) )  {
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
						
						componentContainer.appendChild(magicDiv);

						function drag(event) {
  								 return dragStart(event);
						}

						magicDiv.addEventListener("dragstart", drag);
					//} else {
						//alert("Oh well, something's screwed up.");
					//	var t = 1;
					//}
				}
			} else
				alert("Error ->" + xmlhttp.responseText); 
		}
	};
}