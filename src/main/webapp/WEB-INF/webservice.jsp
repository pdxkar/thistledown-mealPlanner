<!-- <html>
<head>
<script type="text/javascript" src="resources/jQuery.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#btnSubmit').click(function() {
		var data = $("#webservice").serializeArray();
		$.post($("#webservice").attr('action'), "{a:b, c:d}", function(json) {
			if (json.status == "fail")
			{
				alert(json.message);
			}
			if (json.status == "success")
			{
				alert(json.message);
				clearInputs();
			}
		}, "json");	
	});

	function clearInputs()
	{
		$("#webservice : input").each(function() {
			$(this).val('');
		});
	}
	
	$("#webservice").submit (function() {
		return false;
	});
});
</script>
</head>
<body>
<form id="webservice" action="postMethod">
	<input type="hidden" name="field1" value="abc"/>	
	<input type="hidden" name="field2" value="def"/>
	<input name="btnSubmit" id="btnSubmit" type="submit" value="submit"/>
</form>
</body>
</html> -->