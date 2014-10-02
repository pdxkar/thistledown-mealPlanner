<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script language="javascript">
    var xmlhttp;
    function init() {
       // put more code here in case you are concerned about browsers that do not provide XMLHttpRequest object directly
       xmlhttp = new XMLHttpRequest();
    }
    function getdetails() {
 //       var empno = document.getElementById("empno");
 		var componentid = document.getElementById("componentid");
//        var url = "http://localhost:8084/webservicedemo/resources/employee/" + empno.value;
		var url = "http://localhost:8080/mealPlanner/data/components/" + componentId.value;
        xmlhttp.open('GET',url,true);
        xmlhttp.send(null);
        xmlhttp.onreadystatechange = function() {

//               var empname =  document.getElementById("empname");
 			  var componentname =  document.getElementById("componentname");
//               var age =  document.getElementById("age");
				var componentcalories =  document.getElementById("componentcalories");
               if (xmlhttp.readyState == 4) {
                  if ( xmlhttp.status == 200) {
                       var det = eval( "(" +  xmlhttp.responseText + ")");
//                       if (det.age > 0 ) {
					if (det.componentcalories > 0 ) {
 //                         empname.value = det.name;
 					componentname.value = det.componentname;
//                          age.value = det.age;
 					componentcalories.value = det.componentcalories;
                       }
                       else {
                           empname.value = "";
  //                         age.value ="";
   							componentcalories.value ="";
  //                         alert("Invalid Employee ID");
  							alert("Invalid component ID");
                       }
                 }
                 else
                       alert("Error ->" + xmlhttp.responseText);
              }
        };
    }
  </script>
  </head>
  <body  onload="init()">
   <h1>Call Employee Service </h1>
   <table>
   <tr>
 <!--       <td>Enter Employee ID :  </td> -->
	 <td>Enter Component ID :  </td>
  <!--      <td><input type="text" id="empno" size="10"/>  <input type="button" value="Get Details" onclick="getdetails()"/> -->
       <td><input type="text" id="componentid" size="10"/>  <input type="button" value="Get Details" onclick="getdetails()"/>
   </tr>
   <tr>
 <!--       <td>Enter Name :  </td> -->
       <td>Enter Component Name :  </td>
       <!-- <td><input type="text" readonly="true" id="empname" size="20"/> </td>  --> 
       <td><input type="text" readonly="true" id="componentname" size="20"/> </td> 
   </tr>

   <tr>
<!--        <td>Employee Age : </td> -->
       <td>component calories : </td>
<!--        <td><input type="text" readonly="true" id="age" size="10"/> </td> -->
       <td><input type="text" readonly="true" id="componentcalories" size="10"/> </td>
   </tr>
   </table>
  </body>
</html>