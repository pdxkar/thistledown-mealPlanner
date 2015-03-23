<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<link href="<c:url value="/assets/css/globals.css" />" rel="stylesheet">
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
				
				var containingDiv3 = document.createElement('div');
				containingDiv3.id = "containingDiv3";
				containingDiv3.style.height = "500px";
				containingDiv3.style.width = "1200px";
				containingDiv3.style.border =  "1px solid #ccc";
                containingDiv3.style.overflow = "scroll"; 
                
                //Label page with the item's name 
                var itemname = det2.report.food.name;
                var nameDiv = document.createElement('div');
                nameDiv.innerHTML = "<br>" + "How many calories in<br>" 
                	+ "<b>" + "<a style=\"color:black; font-size:120%;\">" 
                	+ itemname + "</a>" + "</b>";
                containingDiv3.appendChild(nameDiv);
                document.body.appendChild(containingDiv3);  
                
                //Display the calories calculated from the servings times the measurement 
                var calculatedCalories = document.createElement('input');
                calculatedCalories.type = "text";
                calculatedCalories.id = "totalCalBox"; 
                calculatedCalories.value = 0;
                containingDiv3.appendChild(calculatedCalories);
                document.body.appendChild(containingDiv3);
                
                //add some line breaks
				//THERE HAS GOT TO BE A BETTER WAY TO DO THIS :(
				var spacer2 = document.createElement('a');
                spacer2.innerHTML = "<br><br>"; 
                containingDiv3.appendChild(spacer2);
                document.body.appendChild(containingDiv3);
                
				//Label the following two boxes with the words "Serving Size"
				//There is probably a better way to do this.
				var spacer = document.createElement('a');
                spacer.innerHTML = "<br>Serving Size<br>";
                containingDiv3.appendChild(spacer);
                document.body.appendChild(containingDiv3);
				   
	           	//create textbox to get the user's desired quantity to measure
				var userQtyTextBox = document.createElement('input');
				userQtyTextBox.type = "text";
				userQtyTextBox.id = "userQty";
				containingDiv3.appendChild(userQtyTextBox);
                document.body.appendChild(containingDiv3);
				var qtyEnteredByUser = document.getElementById("userQty").value;
				
				//put a multiplication symbol between the user's qty textbox and the measurement select box
				//THERE HAS GOT TO BE A BETTER WAY TO DO THIS :(
				var multSymbol = document.createElement('a');
                multSymbol.innerHTML = " X ";
                containingDiv3.appendChild(multSymbol);
                document.body.appendChild(containingDiv3); 
				
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
               		//var foodItem = {label: label, gramEquivalent: gramEquivalent, baseQty: 1, calPerUnit: kcal};
               		
               		var option = new Option (foodItem); 
             		option.text = foodItem.label;
             		option.value = foodItem.calPerUnit;
             		
             		selectElement.options[i++] = option;
	            	
	            }
	            containingDiv3.appendChild(selectElement);
                document.body.appendChild(containingDiv3); 
	            
				//add some line breaks
				//THERE HAS GOT TO BE A BETTER WAY TO DO THIS :(
				var spacer5 = document.createElement('a');
                spacer5.innerHTML = "<br><br>";
                containingDiv3.appendChild(spacer5);
                document.body.appendChild(containingDiv3);
                
                //CALCULATE BUTTON - multiplies serving by measurement to calculate calories
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
				containingDiv3.appendChild(calculateButton);
                document.body.appendChild(containingDiv3);
				
				//add some line breaks
				//THERE HAS GOT TO BE A BETTER WAY TO DO THIS :(
				var spacer3 = document.createElement('a');
                spacer3.innerHTML = "<br><br>";
                containingDiv3.appendChild(spacer3);
                document.body.appendChild(containingDiv3);
                
                //create a dropdown list for the user to pick which meal the item goes into
                //label the dropdown
				var mealBoxLabel = document.createElement('a');
                mealBoxLabel.innerHTML = "<br>Which meal should this be saved to? ";
                containingDiv3.appendChild(mealBoxLabel);
                document.body.appendChild(containingDiv3);
				
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
				containingDiv3.appendChild(mealNameSelectElement);
                document.body.appendChild(containingDiv3);
				
			
				//create button that can save selected measurement to the db
				var inputElement = document.createElement('input');
				inputElement.type = "button";
				inputElement.value = "Save Selection to My QuickList";
				inputElement.addEventListener('click', function(){

					var e2 = document.getElementById("mealNameSelectBox");
	             	mealEnteredByUser = e2.options[e2.selectedIndex].value;

					saveSelectionToDatabase(itemname, mealEnteredByUser, 1, baseUnitOfMeasure, caloriesOfSelectedMeasurement, true);
	
				});
				containingDiv3.appendChild(inputElement);
                document.body.appendChild(containingDiv3);
				
				//add some line breaks
				//THERE HAS GOT TO BE A BETTER WAY TO DO THIS :(
				var spacer4 = document.createElement('a');
                spacer4.innerHTML = "<br><br>";
                containingDiv3.appendChild(spacer4);
                document.body.appendChild(containingDiv3);
				
				//create button to display contents of quicklist
				var inputElement = document.createElement('input');
				inputElement.type = "button";
				inputElement.value = "Display QuickList";
				inputElement.addEventListener('click', function(){
					fetchQuickListFromDB();
	
					});
				containingDiv3.appendChild(inputElement);
                document.body.appendChild(containingDiv3);

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
		//document.body.appendChild(inputElement);
		containingDiv3.appendChild(inputElement);
        document.body.appendChild(containingDiv3);
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

	//need to clear the screen of everything but the quicklist
	if(document.getElementById("containingDiv3") != null){
		var element2 = document.getElementById("containingDiv3");
		element2.parentNode.removeChild(element2);
	}

	var urlGetQuickList = "http://localhost:8080/mealPlanner/data/getQuickList";
	
	xmlhttp.open('GET', urlGetQuickList, true);
	xmlhttp.send(null);
	xmlhttp.onreadystatechange = function() {

		if (xmlhttp.readyState == 4) {

			if (xmlhttp.status == 200) {

				var det5 = eval("(" + xmlhttp.responseText + ")"); 
				
				//i is the counter for the items in the quicklist
				//it's global for now so the textboxes can be for-ed through to tally their calories
				var i;
				
				//all of these stupid divs should be consolidated and css'ed
				var containingDiv2 = document.createElement('div');
				containingDiv2.className = "quickListContainerDiv";
				containingDiv2.id = "containingDiv2"; //I'm not sure that this is used
				
 				//Button to recalculate all the totals
				var calcQuickListTotalButton = document.createElement('input');
				calcQuickListTotalButton.type = "button";
				calcQuickListTotalButton.value = "Recalculate!";
 				calcQuickListTotalButton.addEventListener('click', function(){ 				
 					recalculateQuickListItemCalories(i);					
				}); 
				containingDiv2.appendChild(calcQuickListTotalButton); 
                
                //preWorkoutDiv
                var preWorkoutDiv = document.createElement('div');
                preWorkoutDiv.className = "mealTimeDiv";
				preWorkoutDiv.id = "preWorkoutDiv";  //I'm not sure that this is used
				preWorkoutDiv.innerHTML = "<a style=\"color: black; font-size: 110%; font-weight: bold;\">"
					+ "Pre-Workout Snack" + "</a>" + "&nbsp; &nbsp; &nbsp;";	
                
                //Preworkout Total textbox
                //create a textbox to display the total calories selected in the preWorkout
                //until I figure out how to toggle the item on and off, the calories of ALL preworkout snacks
                //will be counted
                var totalpreWorkoutCalBox = document.createElement('input'); //this is probably not really input since it's display only
                totalpreWorkoutCalBox.type = "text";
                totalpreWorkoutCalBox.className = "mealTotalCalBox";
                //TODO change this id to be consistent with rest of project
                totalpreWorkoutCalBox.id = "totalCalpreWorkoutBox"; 
                totalpreWorkoutCalBox.innerHTML = "<br />";
                totalpreWorkoutCalBox.value = 0;
                preWorkoutDiv.appendChild(totalpreWorkoutCalBox);
                
                //create breakfastDiv
                var breakfastDiv = document.createElement('div');
                breakfastDiv.className = "mealTimeDiv";
				breakfastDiv.id = "breakfastDiv"; 
				breakfastDiv.innerHTML = "<a style=\"color: black; font-size: 110%; font-weight: bold;\">"
					+ "Breakfast" + "</a>" + "&nbsp; &nbsp; &nbsp;";	
                
                //Breakfast Total textbox
                //same as preworkouttotal textbox
                var totalBreakfastCalBox = document.createElement('input'); //this is probably not really input since it's display only
                totalBreakfastCalBox.type = "text";
                totalBreakfastCalBox.className = "mealTotalCalBox";
                totalBreakfastCalBox.id = "totalCalBreakfastBox"; 
                totalBreakfastCalBox.innerHTML = "<br />";
                totalBreakfastCalBox.value = 0;
                breakfastDiv.appendChild(totalBreakfastCalBox);
                
                //create aMSnackDiv
                var aMSnackDiv = document.createElement('div');
                aMSnackDiv.className = "mealTimeDiv";
				aMSnackDiv.id = "aMSnackDiv";  
				aMSnackDiv.innerHTML = "<a style=\"color: black; font-size: 110%; font-weight: bold;\">"
					+ "Morning Snack" + "</a>" + "&nbsp; &nbsp; &nbsp;";	
				
				//AM Snack Total textbox
                //same as preworkouttotal textbox
                var totalAMSnackCalBox = document.createElement('input'); //this is probably not really input since it's display only
                totalAMSnackCalBox.type = "text";
                totalAMSnackCalBox.className = "mealTotalCalBox";
                totalAMSnackCalBox.id = "totalCalAMSnackBox"; 
                totalAMSnackCalBox.innerHTML = "<br />";
                totalAMSnackCalBox.value = 0;
                aMSnackDiv.appendChild(totalAMSnackCalBox);
 
                //create lunchDiv
                var lunchDiv = document.createElement('div');
                lunchDiv.className = "mealTimeDiv";
				lunchDiv.id = "lunchDiv";  
				lunchDiv.innerHTML = "<a style=\"color: black; font-size: 110%; font-weight: bold;\">"
					+ "Lunch" + "</a>" + "&nbsp; &nbsp; &nbsp;";
                
                //AM Snack Total textbox
                //same as preworkouttotal textbox
                var totalLunchCalBox = document.createElement('input'); //this is probably not really input since it's display only
                totalLunchCalBox.type = "text";
                totalLunchCalBox.className = "mealTotalCalBox";
                totalLunchCalBox.id = "totalCalLunchBox"; 
                totalLunchCalBox.innerHTML = "<br />";
                totalLunchCalBox.value = 0;
                lunchDiv.appendChild(totalLunchCalBox);    
                
                //create preDinnerSnackDiv
                var preDinnerSnackDiv = document.createElement('div');
                preDinnerSnackDiv.className = "mealTimeDiv";
				preDinnerSnackDiv.id = "preDinnerSnackDiv";  
				preDinnerSnackDiv.innerHTML = "<a style=\"color: black; font-size: 110%; font-weight: bold;\">"
					+ "Pre-Dinner Snack" + "</a>" + "&nbsp; &nbsp; &nbsp;";	     
                
                //PreDinnerSnack Total textbox
                //same as preworkouttotal textbox
                var totalPreDinnerSnackCalBox = document.createElement('input'); //this is probably not really input since it's display only
                totalPreDinnerSnackCalBox.type = "text";
                totalPreDinnerSnackCalBox.className = "mealTotalCalBox";
                totalPreDinnerSnackCalBox.id = "totalCalPreDinnerSnackBox"; 
                totalPreDinnerSnackCalBox.innerHTML = "<br />";
                totalPreDinnerSnackCalBox.value = 0;
                preDinnerSnackDiv.appendChild(totalPreDinnerSnackCalBox);    
                
                 //create dinnerDiv
                var dinnerDiv = document.createElement('div');
                dinnerDiv.className = "mealTimeDiv";
				dinnerDiv.id = "dinnerDiv";  
				dinnerDiv.innerHTML = "<a style=\"color: black; font-size: 110%; font-weight: bold;\">"
					+ "Dinner" + "</a>" + "&nbsp; &nbsp; &nbsp;";	      
                
                //PreDinnerSnack Total textbox
                var totalDinnerCalBox = document.createElement('input'); //this is probably not really input since it's display only
                totalDinnerCalBox.type = "text";
                totalDinnerCalBox.className = "mealTotalCalBox";
                totalDinnerCalBox.id = "totalCalDinnerBox"; 
                totalDinnerCalBox.innerHTML = "<br />";
                totalDinnerCalBox.value = 0;
                dinnerDiv.appendChild(totalDinnerCalBox);  
                
                //create pmSnackDiv
                var pmSnackDiv = document.createElement('div');
                pmSnackDiv.className = "mealTimeDiv";
				pmSnackDiv.id = "pmSnackDiv";  //I'm not sure that this is used
				pmSnackDiv.innerHTML = "<a style=\"color: black; font-size: 110%; font-weight: bold;\">"
					+ "After-Dinner Snack" + "</a>" + "&nbsp; &nbsp; &nbsp;";				
				
				//PMSnacktotal textbox
                var totalPMSnackCalBox = document.createElement('input'); //this is probably not really input since it's display only
                totalPMSnackCalBox.type = "text";
                totalPMSnackCalBox.className = "mealTotalCalBox";
                //TODO change the id of this to make it consistent with the rest of the project
                totalPMSnackCalBox.id = "totalPMSnackBox"; 
                totalPMSnackCalBox.innerHTML = "<br />";
                totalPMSnackCalBox.value = 0;
                pmSnackDiv.appendChild(totalPMSnackCalBox);  
                
                //totalCalorieDiv
                var totalCalorieDiv = document.createElement('div');
                totalCalorieDiv.className = "mealTimeDiv";
				totalCalorieDiv.id = "totalCalorieDiv";  
				totalCalorieDiv.innerHTML = "<a style=\"color: black; font-size: 110%; font-weight: bold;\">"
					+ "Total Calories" + "</a>" + "&nbsp; &nbsp; &nbsp;";				
				
				//TOTAL CALORIES of QUICKLIST
                var totalQuicklistCaloriesBox = document.createElement('input'); //this is probably not really input since it's display only
                totalQuicklistCaloriesBox.type = "text";
                totalQuicklistCaloriesBox.className = "mealTotalCalBox";
                //TODO rename this id to something consistent with the project
                totalQuicklistCaloriesBox.id = "totalCalQuicklistBox"; 
                totalQuicklistCaloriesBox.innerHTML = "<br />";
                totalQuicklistCaloriesBox.value = 0;
                totalCalorieDiv.appendChild(totalQuicklistCaloriesBox);
  
				//for each item in the quicklist that came back from the db
				for (i = 0; i < det5.length; i++) {
				
					//lineItemDiv: holds ITEM QUANTITY, BASE MEASURE, item info from the db, and calculated CALORIES
					var lineItemDiv = document.createElement('div');
					lineItemDiv.id = "lineItemDiv";
					
					//ITEM QUANTITY - user entered
 					var userQuickListQtyTextBox = document.createElement('input');
					userQuickListQtyTextBox.type = "text";
					userQuickListQtyTextBox.className = "userQuickListQtyBox";
					userQuickListQtyTextBox.id = "userQuickListQtyBox" + i;
                	userQuickListQtyTextBox.value = 0;
                	
                	//BASE MEASURE textbox (i.e. ounces/grams/cup)
					var itemBaseMeasureTextBox = document.createElement('input');
					itemBaseMeasureTextBox.type = "text";
					itemBaseMeasureTextBox.className = "baseMeasureBox";
					itemBaseMeasureTextBox.id = "itemBaseMeasureTextBox" + i;
                	itemBaseMeasureTextBox.value = det5[i].baseunitofmeasure;
				
					//quickListDiv - item info from TD DB
					var quickListDiv = document.createElement('div');
					quickListDiv.className = "quickListDiv";
					quickListDiv.id = "quickListDiv" + i; //I'm not sure that this is used
					quickListDiv.itemname = det5[i].itemname; 
					quickListDiv.baseQuantity = det5[i].basequantity; 
					quickListDiv.whichMeal = det5[i].category; 
					quickListDiv.baseunitofmeasure = det5[i].baseunitofmeasure;
					quickListDiv.calories = det5[i].calories;
					
					//each quickListDiv represents a single quicklist item
					quickListDiv.innerHTML = 
						"<a style=\"color: blue; font-size: 100%; \">"
										 + quickListDiv.itemname 
    									 + "</a>"
    									 + "<a style=\"color: grey; font-size: 85%; font-style: italic; \">"
    									 + " calories per unit: "
    									 + quickListDiv.calories
    									 + "</a>"
    									 ;
    									
										 
					//ITEM CALCULATED CALORIES textbox (i.e. itemQuantity times item's BaseCalories)
					var itemCalcCalTextBox = document.createElement('input');
					itemCalcCalTextBox.type = "text";
					itemCalcCalTextBox.className = "itemCalcCalTextBox";
					itemCalcCalTextBox.id = "itemCalcCalTextBox" + i;
                	itemCalcCalTextBox.value = quickListDiv.calories * userQuickListQtyTextBox.value; 
                	
                	lineItemDiv.appendChild(userQuickListQtyTextBox);
					lineItemDiv.appendChild(itemBaseMeasureTextBox);	
					lineItemDiv.appendChild(quickListDiv);	
					lineItemDiv.appendChild(itemCalcCalTextBox);
					
					//figure out which meal slot to put the quickList Item					 
					switch (quickListDiv.whichMeal) {
					    case 0:
					    	totalpreWorkoutCalBox.value =  
					    		parseInt(totalpreWorkoutCalBox.value)
					    			+ (quickListDiv.calories * userQuickListQtyTextBox.value);
					        preWorkoutDiv.appendChild(lineItemDiv);
					        break;
					    case 1:
							totalBreakfastCalBox.value =  
								parseInt(totalBreakfastCalBox.value)
									+ (quickListDiv.calories * userQuickListQtyTextBox.value);
					        breakfastDiv.appendChild(lineItemDiv);
					        break;
					    case 2:
					    	totalAMSnackCalBox.value =  
								parseInt(totalAMSnackCalBox.value)
									+ (quickListDiv.calories * userQuickListQtyTextBox.value);
					        aMSnackDiv.appendChild(lineItemDiv);
					        break;
					    case 3:
					    	totalLunchCalBox.value =  
								parseInt(totalLunchCalBox.value)
									+ (quickListDiv.calories * userQuickListQtyTextBox.value);
					        lunchDiv.appendChild(lineItemDiv);
					        break;
					    case 4:
					    	totalPreDinnerSnackCalBox.value =  
								parseInt(totalPreDinnerSnackCalBox.value)
									+ (quickListDiv.calories * userQuickListQtyTextBox.value);
					        preDinnerSnackDiv.appendChild(lineItemDiv);
					        break;
					    case 5:
					    	totalDinnerCalBox.value =  
								parseInt(totalDinnerCalBox.value)
									+ (quickListDiv.calories * userQuickListQtyTextBox.value);
					        dinnerDiv.appendChild(lineItemDiv);
					        break;
					    case 6:
					    	totalPMSnackCalBox.value =  
								parseInt(totalPMSnackCalBox.value)
									+ (quickListDiv.calories * userQuickListQtyTextBox.value);
					        pmSnackDiv.appendChild(lineItemDiv);
					        break;
					    default:
					    	alert("something went horribly wrong...");
					        break;    
					}	
					
				}
				
					//sum all the meals' calories into the total box at the bottom of the sheet				
					totalQuicklistCaloriesBox.value =
						parseInt(totalQuicklistCaloriesBox.value) 
						  + parseInt(totalpreWorkoutCalBox.value)	
						  + parseInt(totalBreakfastCalBox.value)						  
						  + parseInt(totalAMSnackCalBox.value)
						  + parseInt(totalLunchCalBox.value)
						  + parseInt(totalPreDinnerSnackCalBox.value)
						  + parseInt(totalDinnerCalBox.value)
						  + parseInt(totalPMSnackCalBox.value);

					//add each meal time's div to the containing div
					containingDiv2.appendChild(preWorkoutDiv);
					containingDiv2.appendChild(breakfastDiv);
					containingDiv2.appendChild(aMSnackDiv);
					containingDiv2.appendChild(lunchDiv);
					containingDiv2.appendChild(preDinnerSnackDiv);
					containingDiv2.appendChild(dinnerDiv);
					containingDiv2.appendChild(pmSnackDiv);
					containingDiv2.appendChild(totalCalorieDiv);
					document.body.appendChild(containingDiv2);	 
					
			} else
				alert("Error ->" + xmlhttp.responseText); 
		}
	};
	
	return false;
}

function recalculateQuickListItemCalories(numberOfFoodItems){
	//for every QuickList item
	for(var m = 0; m < numberOfFoodItems; m++){
		
		//multiply the user-entered amount times the calories of the base amount
		var userEnteredItemQty = document.getElementById("userQuickListQtyBox" + m).value;
		var baseCaloriesOfItem = document.getElementById("quickListDiv" + m).calories;
		var totCalOfItem = userEnteredItemQty * baseCaloriesOfItem;
		//var totCalOfQuickList = document.getElementById("totalCalQuicklistBox").value;
		
		//set the value of the item total box to this calculation
		document.getElementById("itemCalcCalTextBox" + m).value = totCalOfItem;
		
		var mealType = document.getElementById("quickListDiv" + m).whichMeal;
		
		//update the quickList's total calories
    	document.getElementById("totalCalQuicklistBox").value
    		= parseInt(document.getElementById("totalCalQuicklistBox").value)
    			+ totCalOfItem;
		
		switch (mealType) {
		    case 0: 
		    	//update the meal's total calories
		    	document.getElementById("totalCalpreWorkoutBox").value 
		    	 	= parseInt(document.getElementById("totalCalpreWorkoutBox").value)
		    			+ totCalOfItem;
			    break;
		    case 1:  
		    	document.getElementById("totalCalBreakfastBox").value 
		    	 	= parseInt(document.getElementById("totalCalBreakfastBox").value)
		    			+ totCalOfItem;
		        break;
		    case 2:
		    	document.getElementById("totalCalAMSnackBox").value 
		    	 	= parseInt(document.getElementById("totalCalAMSnackBox").value)
		    			+ totCalOfItem;
		        break;
		    case 3:
		    	document.getElementById("totalCalLunchBox").value 
		    	 	= parseInt(document.getElementById("totalCalLunchBox").value)
		    			+ totCalOfItem;					    	
		        break;
		    case 4:
		    	document.getElementById("totalCalPreDinnerSnackBox").value 
		    	 	= parseInt(document.getElementById("totalCalPreDinnerSnackBox").value)
		    			+ totCalOfItem;	
		        break;
		    case 5:
		    	document.getElementById("totalCalDinnerBox").value 
		    	 	= parseInt(document.getElementById("totalCalDinnerBox").value)
		    			+ totCalOfItem;	
		        break;
		    case 6:
		    	document.getElementById("totalPMSnackBox").value 
		    	 	= parseInt(document.getElementById("totalPMSnackBox").value)
		    			+ totCalOfItem;
		        break;
		    default:
		    	alert("something went horribly wrong...");
		        break;    
		} 
		

	}
	
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