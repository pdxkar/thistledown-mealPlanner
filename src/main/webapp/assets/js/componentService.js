/**
 * For the Experimental calorie counter program
 */
/**
 * Defines "Component" as what is returned by /data/components
 * Retrieves the component json object
 * 
 * Weird, but if the below is commented out, botht the guts of the components page AND
 *  the guts of the books page won't load 
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