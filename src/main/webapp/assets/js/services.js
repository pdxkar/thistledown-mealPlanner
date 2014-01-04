'use strict';
/**
 * Retrieves the book json object
 */
angular.module('booksServices', [ 'ngResource' ]).factory('Books',
		function($resource) {
	//goes to the getListOfBooks() method in the BooksController.java class (because it's looking for
	//the endpoint that matches "/data"
			return $resource(__appContext__ + '/data', {}, {
				//gets all the books
				query : {
					method : 'GET',
					isArray : true
				}
			});
		});


