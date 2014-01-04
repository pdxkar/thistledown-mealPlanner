
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
<title>Books</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script
	src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular-resource.min.js"></script>
<script src="<%=_appContext_%>/assets/js/require.js"></script>
<script src="<%=_appContext_%>/assets/js/services.js"></script>
<script src="<%=_appContext_%>/assets/js/tagServices.js"></script>
<script src="<%=_appContext_%>/assets/js/bookDetailService.js"></script>
<script src="<%=_appContext_%>/assets/js/componentService.js"></script>
<script src="<%=_appContext_%>/assets/js/global.js"></script>
<script src="<%=_appContext_%>/assets/js/app.js"></script>
<script src="<%=_appContext_%>/assets/js/controllers.js"></script>

<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">

	
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="<%=_appContext_%>/assets/css/globals.css">
<link rel="stylesheet" href="<%=_appContext_%>/assets/css/images.css">
<link rel="stylesheet" href="<%=_appContext_%>/assets/css/bootstrap.css">
<link rel="stylesheet" href="<%=_appContext_%>/assets/css/bootstrap-RowFluidAddonn.css">

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

					<!-- 					<button type="button" class="navbar-toggle" data-toggle="collapse" -->
					<!-- 						data-target=".navbar-ex1-collapse"> -->
					<!-- 						<span class="sr-only">Toggle navigation</span> <span -->
					<!-- 							class="icon-bar"></span> <span class="icon-bar"></span> <span -->
					<!-- 							class="icon-bar"></span> -->
					<!-- 					</button> -->

				</div>
				<!-- 				Collect the nav links, forms, and other content for toggling -->
				<!-- 				<div class="collapse navbar-collapse navbar-ex1-collapse navbar-centered"> -->
				<!-- 					<ul class="nav navbar-nav"> -->
				<%-- 						<li><a href="<%=_appContext_%>"  id="homeLink"><strong>BOOKS</strong></a></li> --%>
				<%-- 						<li id="homeAboutLink"><a href="<%=_appContext_%>/about"><strong>About Books</strong></a></li> --%>
				<!-- 					</ul> -->
				<!-- 				</div> -->
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
				<strong>Copyright ©2014 Thistledown Consulting, Portland OR</strong>
			</div>
		</div>
	</div>


</body>
</html>

