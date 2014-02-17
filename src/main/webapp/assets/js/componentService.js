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
			});console.log(__appContext__);
		});

/*angular.module('ddApp', ['lvl.directives.dragdrop'])
myApp.controller('ddController', ['$scope' , function($scope){ // function referenced by the drop target
	$scope.dropped = function(dragEl, dropEl) {
		//this is application logic, for the demo we just want to color the grid squares
		//the directive provides a native dom object, wrap with jqlite
		var drop = angular.element(dropEl);
		var drag = angular.element(dragEl);
	
		//clear the previously applied color, if it exists
		var bgClass = drop.attr('data-color');
		if (bgClass) {
			drop.removeClass(bgClass);
		}

		//add the dragged color
		bgClass = drag.attr("data-color");
		drop.addClass(bgClass);
		drop.attr('data-color', bgClass);

		//if element has been dragged from the grid, clear dragged color
		if (drag.attr("x-lvl-drop-target")) {
			drag.removeClass(bgClass);
		}
	}
}]);*/
