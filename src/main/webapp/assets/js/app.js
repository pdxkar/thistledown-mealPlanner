/**
 * Loads the page when the href link is hit
 */
myApp.config(['$routeProvider',	'$locationProvider',
		function($routeProvider, $locationProvider) {
			$routeProvider.when('/', {
						templateUrl : __appContext__ + '/assets/partials/browseBooks.html',
						controller : 'BookListCtrl'
							
					//This is to redirect to the new components html page
							//i.e. when the url = localhost:8080/books/components, it goes the components.html page
					}).when(__appContext__ + '/components', {
						templateUrl : __appContext__ + '/assets/partials/browseComponents.html',
						controller : 'ComponentListCtrl'
							
					}).when(__appContext__, {
						templateUrl : __appContext__ + '/assets/partials/browseBooks.html',
						controller : 'BookListCtrl'
							
					}).when(__appContext__ + '/about', {
						templateUrl : __appContext__ + '/assets/partials/aboutUs.html'
						
					}).when(__appContext__ + '/:isbn13', {
						templateUrl : __appContext__ + '/assets/partials/books-detail.html',
						controller : 'BookDetailCtrlISBN'
							
					}).otherwise({
				redirectTo : '/books'
			});
			$locationProvider.html5Mode(true);
} ]);

