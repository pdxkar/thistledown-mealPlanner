'use strict';


angular.module('booksTagsServices', [ 'ngResource' ]).factory('BooksTags',
		function($resource) {
			return $resource(__appContext__ + '/data/tags', {}, {
				query : {
					method : 'GET',
					isArray : true
				}
			});
		});

