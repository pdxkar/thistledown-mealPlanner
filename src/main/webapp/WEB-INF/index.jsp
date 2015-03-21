<!DOCTYPE HTML>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.2.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript">

var xmlhttp;
function init() {
		
	xmlhttp = new XMLHttpRequest();

}
	
function Search(){

var keywrod = document.getElementById("keyword").value; 
var url2 = "http://api.nal.usda.gov/usda/ndb/search/?format=json&q=" + keywrod + "&sort=n&max=250&offset=0&api_key=a0C0r0iDT31VwSIDjDXChPXkDLpkGBQoSOSDDall";

	xmlhttp.open('GET', url2, true);
	xmlhttp.send(null);
	xmlhttp.onreadystatechange = function() {

		if (xmlhttp.readyState == 4) {

			if (xmlhttp.status == 200) {
				var det = eval("(" + xmlhttp.responseText + ")"); 
				
				//clear any component list previously displayed
				if(document.getElementById("containingDiv") != null){
					var element = document.getElementById("containingDiv");
   					element.parentNode.removeChild(element);
				}
				
				var containingDiv = document.createElement('div');
				containingDiv.id = "containingDiv";
				containingDiv.style.height = "500px";
				containingDiv.style.width = "1200px";
				containingDiv.style.border =  "1px solid #ccc";
                containingDiv.style.overflow = "scroll"; 
				
				for (var i = 0; i < det.list.item.length; i++) {
					var magicDiv = document.createElement('div');
					magicDiv.id = "magicDiv" + 1; 
					
					magicDiv.group = det.list.item[i].group;
					magicDiv.itemname = det.list.item[i].name; 
					magicDiv.ndbno = det.list.item[i].ndbno;
					
					//set innerHTML
					magicDiv.innerHTML = 
						"<a style=\"color: grey; font-size: 85%; font-style: italic;\">"
										 + magicDiv.group 
    									 + "</a>"
										 + "<br />" + "&nbsp; &nbsp; &nbsp;"
										 + "<b>" 
										 + "<a style=\"color:blue; font-size:105%;\">" 
										 + "<a href=\"javascript:void(0);\" onclick=\"showValues(" + "'" + magicDiv.ndbno + "'" + ");\">" 
										 + magicDiv.itemname 
										 + "</a>" 
										 + "</a>"
										 + "</b>"
										 + "<br />";
					
					containingDiv.appendChild(magicDiv);
					document.body.appendChild(containingDiv);

				}

			} else
				//this alert happens if there is a gateway timeout (server 199.136.16.15 is unreachable)
				alert("Error ->" + xmlhttp.responseText); 
				
				//this alternative doesn't seem to work if the site is actually functioning
				//showValues(10011);
				
		}
	};

return false;
} 

function showValues(ndbno) {

	//get the associated measurements from usda using ndbno#
	var url3 = "http://api.nal.usda.gov/usda/ndb/reports/?ndbno=" + ndbno + "&type=f&format=json&api_key=a0C0r0iDT31VwSIDjDXChPXkDLpkGBQoSOSDDall";

	xmlhttp.open('GET', url3, true);
	xmlhttp.send(null);
	xmlhttp.onreadystatechange = function() {
	
		var totCalories = 0;

		if (xmlhttp.readyState == 4) {

			if (xmlhttp.status == 200) {
				var det2 = eval("(" + xmlhttp.responseText + ")"); 
				
				//clear the component list previously displayed
				if(document.getElementById("containingDiv") != null){
					var element = document.getElementById("containingDiv");
   					element.parentNode.removeChild(element);
				}
                
                //Label page with the item's name 
                var itemname = det2.report.food.name;
                var nameDiv = document.createElement('div');
                nameDiv.innerHTML = "<br>" + "How many calories in<br>" 
                	+ "<b>" + "<a style=\"color:black; font-size:120%;\">" 
                	+ itemname + "</a>" + "</b>";
                document.body.appendChild(nameDiv);  
                
                //Display the calories calculated from the servings times the measurement 
                var calculatedCalories = document.createElement('input');
                calculatedCalories.type = "text";
                calculatedCalories.id = "totalCalBox"; 
                calculatedCalories.value = 0;
                document.body.appendChild(calculatedCalories); 
                
                //add some line breaks
				//THERE HAS GOT TO BE A BETTER WAY TO DO THIS :(
				var spacer2 = document.createElement('a');
                spacer2.innerHTML = "<br><br>";
                document.body.appendChild(spacer2); 
                
				//Label the following two boxes with the words "Serving Size"
				//There is probably a better way to do this.
				var spacer = document.createElement('a');
                spacer.innerHTML = "<br>Serving Size<br>";
                document.body.appendChild(spacer); 
				   
	           	//create textbox to get the user's desired quantity to measure
				var userQtyTextBox = document.createElement('input');
				userQtyTextBox.type = "text";
				userQtyTextBox.id = "userQty";
				document.body.appendChild(userQtyTextBox);
				var qtyEnteredByUser = document.getElementById("userQty").value;
				
				//put a multiplication symbol between the user's qty textbox and the measurement select box
				//THERE HAS GOT TO BE A BETTER WAY TO DO THIS :(
				var multSymbol = document.createElement('a');
                multSymbol.innerHTML = " X ";
                document.body.appendChild(multSymbol); 
				
				//this puts the measurement info into the select box and then adds the box to the dom   
				//is the "1" in the array indicating that "calories" are selected? 
	            var selectElement = document.createElement ("select");
	            selectElement.id = "measurementSelectBox";
	            
	            //these variables need to be global so we can add g and oz to the select box if they aren't already there
	            var isGramMeasurePresentInList = false;
	           	var isOunceMeasurePresentInList = false;
	           	var label;
	           	var gramEquivalent;
	           	var qty;
	           	var kcal;
	           	//i has to be global so gram and ounce can be added to the list
	           	var i;
	            
	            //for each measurement of the selected food item, create an option in the selectbox            
	            for (i = 0; i < det2.report.food.nutrients[1].measures.length; i++) 
	            {
	            	//THESE ARE THE ONLY FOUR THINGS AVAILABLE AT THIS URL
	            	//label is the USDA's name of the measurement ("oz", "cup, diced" etc.)
	            	label = det2.report.food.nutrients[1].measures[i].label; 
             		//eqv is the USDA's gram equivalent for each measurement
					gramEquivalent = det2.report.food.nutrients[1].measures[i].eqv;
					//qty : not really sure...is it a base serving size, like 1 gram or 3 links?
					qty = det2.report.food.nutrients[1].measures[i].qty;
					//value is the USDA's calories in each measurement
					kcal = det2.report.food.nutrients[1].measures[i].value;  
					
					//below is an example of how to load multiple things into the select box:
               		//var option = new Option (qty + " " + label + " " + kcal + " kcal");  
               		
               		//declare measurement "oz"'s presence in the select box list
               		if(label == "oz"){
               			isOunceMeasurePresentInList = true;
               		}
               		//declare measurement "g"'s presence in the select box list
               		if(label == "g"){
               			isGramMeasurePresentInList = true;
               		}
               		              		
               		//create a foodItem object to put into the select box
               		var foodItem = {label: label, gramEquivalent: gramEquivalent, baseQty: qty, calPerUnit: kcal};
               		
               		//create an option in the dropdown list that corresponds with this measurement
             		var option = new Option (foodItem); 
             		option.text = foodItem.label;
             		option.value = foodItem.calPerUnit;
             		selectElement.options[selectElement.options.length] = option;
	            }
	            
	            //now that each of the measurements have been put into the option list, put "g" and "oz" in
	            //if they aren't already present in the list
	            if(isOunceMeasurePresentInList == false){
	            
	            	//create an option in the dropdown list that corresponds with gram
	            	label = "oz";
	            	//This is using the values that are left over in the variables above
	            	//it would be better to specifically pick the first selection
	            	calPerOz = kcal/(gramEquivalent/28.3495); 
             		
             		//create a foodItem object to match it
               		var foodItem = {label: label, gramEquivalent: 1, baseQty: 1, calPerUnit: calPerOz};
               		
               		var option = new Option (foodItem); 
             		option.text = foodItem.label;
             		option.value = foodItem.calPerUnit;

             		selectElement.options[i++] = option;

	            	
	            }
	            if(isGramMeasurePresentInList == false){
	            
	            	//create an option in the dropdown list that corresponds with gram
	            	label = "g";
	            	//This is using the values that are left over in the variables above
	            	//it would be better to specifically pick the first selection
	            	calPerG = kcal/gramEquivalent; 

            		//create a foodItem object to match it
               		var foodItem = {label: label, gramEquivalent: 1, baseQty: 1, calPerUnit: calPerG};
               		
               		var option = new Option (foodItem); 
             		option.text = foodItem.label;
             		option.value = foodItem.calPerUnit;
             		
             		selectElement.options[i++] = option;
	            	
	            }
	            document.body.appendChild (selectElement); 
	            
				//add some line breaks
				//THERE HAS GOT TO BE A BETTER WAY TO DO THIS :(
				var spacer = document.createElement('a');
                spacer.innerHTML = "<br><br>";
                document.body.appendChild(spacer); 
                
                //create button that will multiply serving by measurement to calculate calories
                //this is temporary.  I want to figure out how to do this as soon as the 
                //user enters the qty and/or selects the drop down measurement
				var calculateButton = document.createElement('input');
				calculateButton.type = "button";
				calculateButton.value = "How Many Calories?";
				
				//these have to be global so they can be saved to the quicklist below
				//var itemname //<==defined somewhere else
				//var category;
				//var baseQuantity;
				var baseUnitOfMeasure;
	            var caloriesOfSelectedMeasurement;
	            //var isFavorite;

				//add a "calculate Calories" button to the ui
 				calculateButton.addEventListener('click', function(){
	             	var usersQuantity = document.getElementById("userQty").value;
 	             	var e = document.getElementById("measurementSelectBox");
	             	caloriesOfSelectedMeasurement = e.options[e.selectedIndex].value;
	             	baseUnitOfMeasure = e.options[e.selectedIndex].text; 
		            document.getElementById('totalCalBox').value = Math.round(caloriesOfSelectedMeasurement * usersQuantity);
				}); 
				document.body.appendChild(calculateButton);
				
				//add some line breaks
				//THERE HAS GOT TO BE A BETTER WAY TO DO THIS :(
				var spacer3 = document.createElement('a');
                spacer3.innerHTML = "<br><br>";
                document.body.appendChild(spacer3); 
                
                //create a dropdown list for the user to pick which meal the item goes into
                //label the dropdown
				var mealBoxLabel = document.createElement('a');
                mealBoxLabel.innerHTML = "<br>Which meal should this be saved to? ";
                document.body.appendChild(mealBoxLabel); 
				
				var mealNameSelectElement = document.createElement ("select");
	            mealNameSelectElement.id = "mealNameSelectBox";
				
				var quickListMeals = [
				    {"mealId": 0, "mealName":"Pre-Workout Snack"}, 
				    {"mealId": 1, "mealName":"Breakfast"},
				    {"mealId": 2, "mealName":"Morning Snack"},
				    {"mealId": 3, "mealName":"Lunch"},
				    {"mealId": 4, "mealName":"Afternoon Snack"},
				    {"mealId": 5, "mealName":"Dinner"},
				    {"mealId": 6, "mealName":"After-Dinner Snack"},
				];
				
				//j has to be global so the selection can be seen
				var j;
				var mealPosition;
				var mealEnteredByUser;
				
				//for each measurement of the selected food item, create an option in the selectbox            
	            for (j = 0; j < quickListMeals.length; j++) 
	            {
					//grab the number equivalent of the meal
	            	mealPosition = quickListMeals.mealId;  

               		//create an option in the dropdown list that corresponds to each meal
             		var option = new Option (quickListMeals[j]); 
             		option.text = quickListMeals[j].mealName;
             		option.value = quickListMeals[j].mealId;
             		mealNameSelectElement.options[mealNameSelectElement.options.length] = option;
	            }
				document.body.appendChild (mealNameSelectElement); 
				
			
				//create button that can save selected measurement to the db
				var inputElement = document.createElement('input');
				inputElement.type = "button";
				inputElement.value = "Save Selection to My QuickList";
				inputElement.addEventListener('click', function(){

					var e2 = document.getElementById("mealNameSelectBox");
	             	mealEnteredByUser = e2.options[e2.selectedIndex].value;
					saveSelectionToDatabase(itemname, mealEnteredByUser, 1, baseUnitOfMeasure, caloriesOfSelectedMeasurement, true);
	
				});
				document.body.appendChild(inputElement);
				
				//add some line breaks
				//THERE HAS GOT TO BE A BETTER WAY TO DO THIS :(
				var spacer4 = document.createElement('a');
                spacer4.innerHTML = "<br><br>";
                document.body.appendChild(spacer4); 
				
				//create button to display contents of quicklist
				var inputElement = document.createElement('input');
				inputElement.type = "button";
				inputElement.value = "Display QuickList";
				inputElement.addEventListener('click', function(){
					fetchQuickListFromDB();
	
					});
				document.body.appendChild(inputElement);

			} else
				//this alert happens if there is a gateway timeout (server 199.136.16.15 is unreachable)
				alert("Error ->" + xmlhttp.responseText); 
				
				//this alternative doesn't seem to work if the site is actually functioning
				//createDisplayQuicklistButton();
		}
	};

return false;
} 

//create showQuickList button
//right now this function only gets called if the USDA site is down
function createDisplayQuicklistButton(){
		//create button to display contents of quicklist
		var inputElement = document.createElement('input');
		inputElement.type = "button";
		inputElement.value = "Display QuickList";
		inputElement.addEventListener('click', function(){
			fetchQuickListFromDB();

			});
		document.body.appendChild(inputElement);
}

//see http://stackoverflow.com/questions/9643311/pass-string-parameter-in-an-onclick-function
function saveSelectionToDatabase(itemName, category, baseQuantity, baseUnitOfMeasure, caloriesOfSelectedMeasurement, isFavorite) {
	var http = new XMLHttpRequest();
	var urlAddComponent = "http://localhost:8080/mealPlanner/data/addComponent";
	
	var params = "itemName=" + itemName 
				+ "&category=" + category 
				+ "&baseQuantity=" + baseQuantity 
				+ "&baseUnitOfMeasure=" + baseUnitOfMeasure 
				+ "&calories=" + caloriesOfSelectedMeasurement
				+ "&isFavorite=" + isFavorite;
	
	http.open("POST", urlAddComponent, true);
	
	//Send the proper header information along with the request
	http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	http.setRequestHeader("Content-length", params.length);
	http.setRequestHeader("Connection", "close");
	
	http.onreadystatechange = function() {    //Call a function when the state changes.
	    if(http.readyState == 4 && http.status == 200) {
	        alert(http.responseText);
	    }
	};
	http.send(params); 

}  

function fetchQuickListFromDB(){

	var urlGetQuickList = "http://localhost:8080/mealPlanner/data/getQuickList";
	
	xmlhttp.open('GET', urlGetQuickList, true);
	xmlhttp.send(null);
	xmlhttp.onreadystatechange = function() {

		if (xmlhttp.readyState == 4) {

			if (xmlhttp.status == 200) {

				var det5 = eval("(" + xmlhttp.responseText + ")"); 
				
				//all of these stupid divs should be consolidated and css'ed
				var containingDiv2 = document.createElement('div');
				containingDiv2.id = "containingDiv2"; //I'm not sure that this is used
				containingDiv2.style.height = "500px";
				containingDiv2.style.width = "1200px";
				containingDiv2.style.border =  "1px solid #ccc";
                containingDiv2.style.overflow = "scroll"; 
                
                //create preWorkoutDiv
                var preWorkoutDiv = document.createElement('div');
				preWorkoutDiv.id = "preWorkoutDiv";  //I'm not sure that this is used
				preWorkoutDiv.innerHTML = "<a style=\"color: black; font-size: 110%; font-weight: bold;\">"
					+ "Pre-Workout Snack" + "</a>" + "<br />";	
				preWorkoutDiv.style.height = "100px";
				preWorkoutDiv.style.width = "1200px";
				preWorkoutDiv.style.border =  "1px solid #ccc";
                preWorkoutDiv.style.overflow = "scroll"; 
                
                //create breakfastDiv
                var breakfastDiv = document.createElement('div');
				breakfastDiv.id = "breakfastDiv";  //I'm not sure that this is used
				breakfastDiv.innerHTML = "<a style=\"color: black; font-size: 110%; font-weight: bold;\">"
					+ "Breakfast" + "</a>" + "<br />";	
				breakfastDiv.style.height = "100px";
				breakfastDiv.style.width = "1200px";
				breakfastDiv.style.border =  "1px solid #ccc";
                breakfastDiv.style.overflow = "scroll"; 
                
                //create aMSnackDiv
                var aMSnackDiv = document.createElement('div');
				aMSnackDiv.id = "aMSnackDiv";  //I'm not sure that this is used
				aMSnackDiv.innerHTML = "<a style=\"color: black; font-size: 110%; font-weight: bold;\">"
					+ "Morning Snack" + "</a>" + "<br />";	
				aMSnackDiv.style.height = "100px";
				aMSnackDiv.style.width = "1200px";
				aMSnackDiv.style.border =  "1px solid #ccc";
                aMSnackDiv.style.overflow = "scroll"; 
 
                //create lunchDiv
                var lunchDiv = document.createElement('div');
				lunchDiv.id = "lunchDiv";  //I'm not sure that this is used
				lunchDiv.innerHTML = "<a style=\"color: black; font-size: 110%; font-weight: bold;\">"
					+ "Lunch" + "</a>" + "<br />";	
				lunchDiv.style.height = "100px";
				lunchDiv.style.width = "1200px";
				lunchDiv.style.border =  "1px solid #ccc";
                lunchDiv.style.overflow = "scroll";      
                
                //create preDinnerSnackDiv
                var preDinnerSnackDiv = document.createElement('div');
				preDinnerSnackDiv.id = "preDinnerSnackDiv";  //I'm not sure that this is used
				preDinnerSnackDiv.innerHTML = "<a style=\"color: black; font-size: 110%; font-weight: bold;\">"
					+ "Pre-Dinner Snack" + "</a>" + "<br />";	
				preDinnerSnackDiv.style.height = "100px";
				preDinnerSnackDiv.style.width = "1200px";
				preDinnerSnackDiv.style.border =  "1px solid #ccc";
                preDinnerSnackDiv.style.overflow = "scroll";        
                
                 //create dinnerDiv
                var dinnerDiv = document.createElement('div');
				dinnerDiv.id = "dinnerDiv";  //I'm not sure that this is used
				dinnerDiv.innerHTML = "<a style=\"color: black; font-size: 110%; font-weight: bold;\">"
					+ "Dinner Snack" + "</a>" + "<br />";	
				dinnerDiv.style.height = "100px";
				dinnerDiv.style.width = "1200px";
				dinnerDiv.style.border =  "1px solid #ccc";
                dinnerDiv.style.overflow = "scroll";      
                
                //create pmSnackDiv
                var pmSnackDiv = document.createElement('div');
				pmSnackDiv.id = "pmSnackDiv";  //I'm not sure that this is used
				pmSnackDiv.innerHTML = "<a style=\"color: black; font-size: 110%; font-weight: bold;\">"
					+ "After-Dinner Snack" + "</a>" + "<br />";				
				pmSnackDiv.style.height = "100px";
				pmSnackDiv.style.width = "1200px";
				pmSnackDiv.style.border =  "1px solid #ccc";
                pmSnackDiv.style.overflow = "scroll";    
                
				
				for (var i = 0; i < det5.length; i++) {
					var quickListDiv = document.createElement('div');
					quickListDiv.id = "quickListDiv" + 1; //I'm not sure that this is used
					
					quickListDiv.itemname = det5[i].itemname; 
					quickListDiv.baseQuantity = det5[i].baseQuantity; 
					quickListDiv.whichMeal = det5[i].category; 
					quickListDiv.baseunitofmeasure = det5[i].baseunitofmeasure;
					quickListDiv.calories = det5[i].calories;
					
					//each quickListDiv represents a single quicklist item
					quickListDiv.innerHTML = 
						"<a style=\"color: grey; font-size: 85%; font-style: italic;\">"
										 + quickListDiv.itemname 
    									 + "</a>"
										 + "&nbsp;" + "&nbsp;"
										 + quickListDiv.baseunitofmeasure  
										 + "&nbsp;" + "&nbsp;"
										 + quickListDiv.calories 
										 + "<br />";
					
					//figure out which meal slot to put the quickList Item					 
					switch (quickListDiv.whichMeal) {
					    case 0:
					        preWorkoutDiv.appendChild(quickListDiv);
					        break;
					    case 1:
					        breakfastDiv.appendChild(quickListDiv);
					        break;
					    case 2:
					        aMSnackDiv.appendChild(quickListDiv);
					        break;
					    case 3:
					        lunchDiv.appendChild(quickListDiv);
					        break;
					    case 4:
					        preDinnerSnackDiv.appendChild(quickListDiv);
					        break;
					    case 5:
					        dinnerDiv.appendChild(quickListDiv);
					        break;
					    case 6:
					        pmSnackDiv.appendChild(quickListDiv);
					        break;
					}		
					
					//add each meal time's div to the containing div
					containingDiv2.appendChild(preWorkoutDiv);
					containingDiv2.appendChild(breakfastDiv);
					containingDiv2.appendChild(aMSnackDiv);
					containingDiv2.appendChild(lunchDiv);
					containingDiv2.appendChild(preDinnerSnackDiv);
					containingDiv2.appendChild(dinnerDiv);
					containingDiv2.appendChild(pmSnackDiv);
					document.body.appendChild(containingDiv2);	 

				}

			} else
				alert("Error ->" + xmlhttp.responseText); 
		}
	};
	
	return false;
}

</script> 
</head>

<body onload="init()">
<h1>Meal Planner</h1>

<form name="search" >Search for this item: 
  <input type="text" name="keyword" id="keyword"  />
  <input type="button" name="btnser" onclick="Search()" value="Search" />
</form>

   
</body>
</html>