'use strict';
/**
 * Retrieves the book json object
 * 
 * !!this service seems to be necessary for loading the components page
 */
angular.module('bookDetailServices', [ 'ngResource' ]).factory('BookDetail',
		function($resource) {
			return $resource('/books/data/:isbn13', {}, {
				// gets a single books using the isbn
				get : {
					method : 'GET',
					isArray : false
				}
			});
		});
