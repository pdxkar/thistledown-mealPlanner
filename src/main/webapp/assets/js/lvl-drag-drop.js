var module = angular.module("lvl.directives.dragdrop", ['lvl.services']);

module.directive('lvlDraggable', ['$rootScope', 'uuid', function($rootScope, uuid) {
	    return {
	        restrict: 'A',
	        link: function(scope, el, attrs, controller) {
	        	angular.element(el).attr("draggable", "true");
	            
	            var id = angular.element(el).attr("id");
	            if (!id) {
	                id = uuid.new()
	                angular.element(el).attr("id", id);
	            }
	            
	            el.bind("dragstart", function(e) {
	                e.dataTransfer.setData('text', id);

	                $rootScope.$emit("LVL-DRAG-START");
	            });
	            
	            el.bind("dragend", function(e) {
	                $rootScope.$emit("LVL-DRAG-END");
	            });
	        }
    	}
	}]);

module.directive('lvlDropTarget', ['$rootScope', 'uuid', function($rootScope, uuid) {
	    return {
	        restrict: 'A',
	        scope: {
	            onDrop: '&'
	        },
	        link: function(scope, el, attrs, controller) {
	            var id = angular.element(el).attr("id");
	            if (!id) {
	                id = uuid.new()
	                angular.element(el).attr("id", id);
	            }
	                       
	            el.bind("dragover", function(e) {
	              if (e.preventDefault) {
	                e.preventDefault(); // Necessary. Allows us to drop.
	              }
	              
	              e.dataTransfer.dropEffect = 'move';  // See the section on the DataTransfer object.
	              return false;
	            });
	            
	            el.bind("dragenter", function(e) {
	              // this / e.target is the current hover target.
	              angular.element(e.target).addClass('lvl-over');
	            });
	            
	            el.bind("dragleave", function(e) {
	              angular.element(e.target).removeClass('lvl-over');  // this / e.target is previous target element.
	            });
	            
	            el.bind("drop", function(e) {
	              if (e.preventDefault) {
	                e.preventDefault(); // Necessary. Allows us to drop.
	              }

	              if (e.stopPropogation) {
	                e.stopPropogation(); // Necessary. Allows us to drop.
	              }
	            	var data = e.dataTransfer.getData("text");
	                var dest = document.getElementById(id);
	                var src = document.getElementById(data);
	                
	                scope.onDrop({dragEl: src, dropEl: dest});
	            });

	            $rootScope.$on("LVL-DRAG-START", function() {
	                var el = document.getElementById(id);
	                angular.element(el).addClass("lvl-target");
	            });
	            
	            $rootScope.$on("LVL-DRAG-END", function() {
	                var el = document.getElementById(id);
	                angular.element(el).removeClass("lvl-target");
	                angular.element(el).removeClass("lvl-over");
	            });
	        }
    	}
	}]);
	
			angular
			.module('ddApp', ['lvl.directives.dragdrop']) // register the directive with your app module
			.controller('ddController', ['$scope' , function($scope){
				$scope.dropped = function(dragEl, dropEl) { // function referenced by the drop target
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
			}]);