/**
 * For the Experimental calorie counter program
 */
/**
 * Defines "Component" as what is returned by /data/components
 * Retrieves the component json object
 */
angular.module('componentServices', [ 'ngResource' ]).factory('Components',
		function($resource) {
			return $resource(__appContext__ + '/data/components', {}, {
				//gets all the components
				query : {
					method : 'GET',
					isArray : true
				}
			});
		});