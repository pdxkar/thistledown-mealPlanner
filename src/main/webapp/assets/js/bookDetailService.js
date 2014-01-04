'use strict';
/**
 * Retrieves the book json object
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
