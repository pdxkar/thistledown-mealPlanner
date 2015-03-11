<!DOCTYPE HTML>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.2.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript">

var xmlhttp;
function init() {
		
	xmlhttp = new XMLHttpRequest();
	
		//alert("Made it to init()");
	

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

	//create button that can save selected measurement to the db
	var inputElement = document.createElement('input');
	inputElement.type = "button";
	inputElement.value = "Save Selection to My QuickList"
	inputElement.addEventListener('click', function(){
		saveSelectionToDatabase(20, "myString");
		//saveSelectionToDatabase();
	});
	document.body.appendChild(inputElement);

	//get the associated measurements from usda using ndbno#
	var url3 = "http://api.nal.usda.gov/usda/ndb/reports/?ndbno=" + ndbno + "&type=f&format=json&api_key=a0C0r0iDT31VwSIDjDXChPXkDLpkGBQoSOSDDall";

	xmlhttp.open('GET', url3, true);
	xmlhttp.send(null);
	xmlhttp.onreadystatechange = function() {

		if (xmlhttp.readyState == 4) {

			if (xmlhttp.status == 200) {
				var det2 = eval("(" + xmlhttp.responseText + ")"); 
				
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
                
                //Label page with the item's name
                var itemname = det2.report.food.name;
                var nameDiv = document.createElement('div');
                nameDiv.innerHTML = "<b>" + "<a style=\"color:black; font-size:120%;\">" + itemname + "</a>" + "</b>";
                containingDiv.appendChild(nameDiv);
				            
		            var selectElement = document.createElement ("select");
		            for (var i = 0; i < det2.report.food.nutrients[1].measures.length; i++) 
		            {
		             		var label = det2.report.food.nutrients[1].measures[i].label; 
							var grams = det2.report.food.nutrients[1].measures[i].eqv; 
							var qty = det2.report.food.nutrients[1].measures[i].qty;
							var kcal = det2.report.food.nutrients[1].measures[i].value;  
		                var option = new Option (qty + " " + label + " " + kcal + " kcal");
		                selectElement.options[selectElement.options.length] = option;
		            }
		            document.body.appendChild (selectElement); 
                

			} else
				alert("Error ->" + xmlhttp.responseText); 
		}
	};

return false;
} 

//see http://stackoverflow.com/questions/9643311/pass-string-parameter-in-an-onclick-function
//function Test(itemName, baseQuantity, baseUnitOfMeasure, calories) {
//function saveSelectionToDatabase(itemName, baseQuantity, baseUnitOfMeasure, gramEqv, kcal) {
function saveSelectionToDatabase(number, string) {
	alert("testing123");
	alert("number = " + number);
	alert("string = " + string);
//	alert("itemNum = " + itemNum);
//		alert("baseQuantity = " + baseQuantity);
//			alert("baseUnitOfMeasure = " + baseUnitOfMeasure);
//				alert("gramEqv = " + gramEqv);
//					alert("kcal = " + kcal);

/* var http = new XMLHttpRequest();
//var url = "get_data.php";
var urlTest = "http://localhost:8080/mealPlanner/data/addComponent";

//var params = "lorem=ipsum&name=binny";
//var params = "itemName=" +itemName+ "&baseQuantity=" +baseQuantity+ "&baseUnitOfMeasure=" +baseUnitOfMeasure+ "&calories=" + kcal;
var params = "itemName=" +'testing123'+ "&baseQuantity=" +2+ "&baseUnitOfMeasure=" +cup+ "&calories=" + 123;
http.open("POST", urlTest, true);

//Send the proper header information along with the request
http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
http.setRequestHeader("Content-length", params.length);
http.setRequestHeader("Connection", "close");

http.onreadystatechange = function() {//Call a function when the state changes.
    if(http.readyState == 4 && http.status == 200) {
        alert(http.responseText);
    }
};
http.send(params); */
	
//	alert("got this far");

//	return false;
}  

</script> 
</head>

<body onload="init()">
<h1>Use the USDA's Food API</h1>

<form name="search" >Search for this item: 
  <input type="text" name="keyword" id="keyword"  />
  <input type="button" name="btnser" onclick="Search()" value="Search" />
</form>

   
</body>
</html>