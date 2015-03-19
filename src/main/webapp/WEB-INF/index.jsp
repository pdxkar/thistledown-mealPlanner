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
				alert("Error ->" + xmlhttp.responseText); 
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
                
                //Display the calories calculated from the servings (x) measurement 
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
	            
	            for (var i = 0; i < det2.report.food.nutrients[1].measures.length; i++) 
	            {
	             		var label = det2.report.food.nutrients[1].measures[i].label; 
						var grams = det2.report.food.nutrients[1].measures[i].eqv; 
						var qty = det2.report.food.nutrients[1].measures[i].qty;
						var kcal = det2.report.food.nutrients[1].measures[i].value;  
	               		//var option = new Option (qty + " " + label + " " + kcal + " kcal");  
	               		
	               		if (label == "oz"){
	               			var option = new Option ("g", Math.round(kcal/28.3495));
	               			selectElement.options[selectElement.options.length] = option;
	               		}
	               			var option = new Option (label, kcal); 
	               			selectElement.options[selectElement.options.length] = option;
	                
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
	            var caloriesOfSelectedMeasurement;
	            var baseUnitOfMeasure;
				
 				calculateButton.addEventListener('click', function(){
	             	var usersQuantity = document.getElementById("userQty").value;
	             	var e = document.getElementById("measurementSelectBox");
	             	caloriesOfSelectedMeasurement = e.options[e.selectedIndex].value;
	             	baseUnitOfMeasure = e.options[e.selectedIndex].text;
		            document.getElementById('totalCalBox').value = caloriesOfSelectedMeasurement * usersQuantity;
				}); 
				document.body.appendChild(calculateButton);
				
				//add some line breaks
				//THERE HAS GOT TO BE A BETTER WAY TO DO THIS :(
				var spacer3 = document.createElement('a');
                spacer.innerHTML = "<br><br>";
                document.body.appendChild(spacer3); 
			
				//create button that can save selected measurement to the db
				var inputElement = document.createElement('input');
				inputElement.type = "button";
				inputElement.value = "Save Selection to My QuickList";
				inputElement.addEventListener('click', function(){
				saveSelectionToDatabase(itemname, 1, baseUnitOfMeasure, caloriesOfSelectedMeasurement, true);

				});
				document.body.appendChild(inputElement);
                

			} else
				alert("Error ->" + xmlhttp.responseText); 
		}
	};

return false;
} 

//see http://stackoverflow.com/questions/9643311/pass-string-parameter-in-an-onclick-function
function saveSelectionToDatabase(itemName, baseQuantity, baseUnitOfMeasure, caloriesOfSelectedMeasurement, isFavorite) {
var http = new XMLHttpRequest();
var urlTest = "http://localhost:8080/mealPlanner/data/addComponent";

var params = "itemName=" + itemName 
			+ "&baseQuantity=" + baseQuantity 
			+ "&baseUnitOfMeasure=" + baseUnitOfMeasure 
			+ "&calories=" + caloriesOfSelectedMeasurement
			+ "&isFavorite=" + isFavorite;

http.open("POST", urlTest, true);

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