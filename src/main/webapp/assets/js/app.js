/**
 * Loads the page when the href link is hit
 */

// Copy of what works below....
myApp.config([
		'$routeProvider',
		'$locationProvider',
		function($routeProvider, $locationProvider) {
			//When the url is "/mealPlanner/" then redirect to the browseComponents page
			$routeProvider.when(__appContext__, {
				templateUrl : __appContext__ + '/assets/partials/browseComponents.html',
				controller : 'ComponentListCtrl'
					//When the url is "/mealPlanner/component" then redirect to the component page
					}).when('/component',{
						templateUrl : __appContext__
								+ '/assets/partials/browseComponents.html',
						controller : 'ComponentListCtrl'
					//When the url is "/mealPlanner/about" then redirect to the about page		
					}).when(__appContext__ + '/about', {
						templateUrl : __appContext__ + '/assets/partials/aboutUs.html'
					//if the url is "mealPlanner/*" then redirect to the "/browseComponents.html" page	
					}).otherwise({
				redirectTo : '/component'
			});
			$locationProvider.html5Mode(true);
		} ]);


