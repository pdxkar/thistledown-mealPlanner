'use strict';
/**
 * Retrieves the book json object
 * 
 * !!If this is commented out, then the guts of the components page doesn't load components either (the page itself will load though)
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
			console.log(__appContext__);
		});

/**
 * dragAndDrop experiment - it doesn't seem to matter if this is here or not. 
 * The functionality (when clicked on from the file manager) still works (even though
 * in the original code it is on the index.html page).
 */
//angular
//.module('ddApp', ['lvl.directives.dragdrop']) // register the directive with your app module
//.controller('ddController', ['$scope' , function($scope){ // function referenced by the drop target
//	$scope.dropped = function(dragEl, dropEl) {
//		//this is application logic, for the demo we just want to color the grid squares
//		//the directive provides a native dom object, wrap with jqlite
//		var drop = angular.element(dropEl);
//		var drag = angular.element(dragEl);
//	
//		//clear the previously applied color, if it exists
//		var bgClass = drop.attr('data-color');
//		if (bgClass) {
//			drop.removeClass(bgClass);
//		}
//
//		//add the dragged color
//		bgClass = drag.attr("data-color");
//		drop.addClass(bgClass);
//		drop.attr('data-color', bgClass);
//
//		//if element has been dragged from the grid, clear dragged color
//		if (drag.attr("x-lvl-drop-target")) {
//			drag.removeClass(bgClass);
//		}
//	}
//}]);
