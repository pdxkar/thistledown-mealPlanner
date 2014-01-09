/**
 * Loads the page when the href link is hit
 */

// Copy of what works below....
myApp.config([
		'$routeProvider',
		'$locationProvider',
		function($routeProvider, $locationProvider) {
			$routeProvider.when(
					'/component',
					{
						templateUrl : __appContext__
								+ '/assets/partials/browseComponents.html',
						controller : 'ComponentListCtrl'

					// This is to redirect to the new components html page
					// i.e. when the url = localhost:8080/books/components, it
					// goes the components.html page
					}).otherwise({
				redirectTo : '/component'
			});
			$locationProvider.html5Mode(true);
		} ]);

/*
 * .when(__appContext__ + '/components', { templateUrl : __appContext__ +
 * '/assets/partials/browseComponents.html', controller : 'ComponentListCtrl'
 * 
 * }).when(__appContext__, { templateUrl : __appContext__ +
 * '/assets/partials/browseBooks.html', controller : 'BookListCtrl'
 * 
 * }).when(__appContext__ + '/about', { templateUrl : __appContext__ +
 * '/assets/partials/aboutUs.html'
 * 
 * }).when(__appContext__ + '/:isbn13', { templateUrl : __appContext__ +
 * '/assets/partials/books-detail.html', controller : 'BookDetailCtrlISBN'
 *  })
 */

