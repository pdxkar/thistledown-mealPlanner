
<%
	/*
	 * use jsp _appContext_ for statically generated URLs
	 * use ng-init _appContext_ for any dynamically (client side) built URLs
	 */
	String _appContext_ = getServletContext().getContextPath();
%>
<!DOCTYPE html>
<html ng-app="booksbenchproject"
	ng-init="_appContext_='<%=getServletContext().getContextPath()%>'">

<head>
<script type="text/javascript">
var __appContext__ = '<%=getServletContext().getContextPath()%>';
</script>
<title>Meal Planner</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular-resource.min.js"></script>
<script src="<%=_appContext_%>/assets/js/require.js"></script>
<script src="<%=_appContext_%>/assets/js/services.js"></script> <!-- Need this line to make ALL pages work!  -->
<script src="<%=_appContext_%>/assets/js/tagServices.js"></script> 
<script src="<%=_appContext_%>/assets/js/bookDetailService.js"></script> <!-- Need this line to make ALL pages work!  -->
<script src="<%=_appContext_%>/assets/js/componentService.js"></script> <!-- Need this line to make ALL pages work!  -->
<script src="<%=_appContext_%>/assets/js/global.js"></script>
<script src="<%=_appContext_%>/assets/js/app.js"></script>
<script src="<%=_appContext_%>/assets/js/controllers.js"></script>
<!-- These three are for the drag and drop functionality -->
<script src="<%=_appContext_%>/assets/js/angular.js"></script>
<script src="<%=_appContext_%>/assets/js/lvl-drag-drop.js"></script>
<script src="<%=_appContext_%>/assets/js/lvl-uuid.js"></script>

<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">

	
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="<%=_appContext_%>/assets/css/globals.css">
<link rel="stylesheet" href="<%=_appContext_%>/assets/css/images.css">
<link rel="stylesheet" href="<%=_appContext_%>/assets/css/bootstrap.css">
<link rel="stylesheet" href="<%=_appContext_%>/assets/css/bootstrap-RowFluidAddonn.css">
<!-- This is for the dragAndDrop functionality -->
<link rel="stylesheet" href="<%=_appContext_%>/assets/css/dragAndDrop.css">
</head>
<body>
	<div id="container">
		<div id="header">

			<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="row-fluid">
						<div class="span4">
							<a href="<%=_appContext_%>" class="homeLink"><img
								src="<%=_appContext_%>/assets/img/homeLink.png"
								id="booksHeaderHomeLink"  class="navBarLink"></a>
						</div>


		<div class="span4">
							<a href="<%=_appContext_%>/about"> <img
								src="<%=_appContext_%>/assets/img/projectLogo.png"
								id="booksHeaderLogo" class="navBarLink">
							</a>
						</div>

						<div class="span4">
							<a href="<%=_appContext_%>/about"><img
								src="<%=_appContext_%>/assets/img/homeAboutLink.png"
								id="booksHeaderAboutLink"  class="navBarLink"></a>
						</div>

				
				</div>


				<div class="navbar-header navbar-centered">

				</div>

			</nav>
		</div>

		<div id="body">
			<div id="view" ng-view></div>

		</div>
		<div id="footer">

			<nav class="navbar navbar-default navbar-centered" role="navigation"
				style="margin-bottom: 0px;">
				<div class="row-fluid">
						<div class="span2">
							<a href="<%=_appContext_%>/about"> <img
								src="<%=_appContext_%>/assets/img/projectLogo.png"
								id="booksFooterLogo"  class="navBarLink">
							</a>
						</div>
						<div class="span4">
							<a href="<%=_appContext_%>" class="homeLink"><img
								src="<%=_appContext_%>/assets/img/homeLink.png"
								id="booksFooterHomeLink"  class="navBarLink"></a>
						</div>

						<div class="span4">
							<a href="<%=_appContext_%>/about"><img
								src="<%=_appContext_%>/assets/img/homeAboutLink.png"
								id="booksAboutLink"  class="navBarLink"></a>
						</div>


						<div class="span2">
							<a href="http://www.catalystsolves.com" target="_blank"><img
								src="<%=_appContext_%>/assets/img/logoCat2.png"
								id="booksFooterCompanyLink"  class="navBarLink"></a>
						</div>

					
				</div>
			</nav>
			<div id="copyRight">
				<strong>Copyright ©2014 Thistledown Software, Portland OR</strong>
			</div>
		</div>
	</div>


</body>
</html>

