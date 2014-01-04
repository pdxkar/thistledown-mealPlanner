'use strict';
/**
 * Controller for loading all the books
 */
myApp.controller('BookListCtrl', [ '$scope', 'Books', 
         function($scope, Books) {
			// Controller magic
			$scope.books = Books.query();
			
} ]);

/**
 * Experimental Controller for the calorie program
 * 
 */
myApp.controller('ComponentListCtrl', [ '$scope', 'Components', 
         function($scope, Components) {
				$scope.components = Components.query();
} ]);





	
	
//**************Important stuff stops here******************
	
	/**
	 * Controller for loading a single book using book isbn
	 */
myApp.controller('BookDetailCtrlISBN', [ '$scope', '$routeParams', 'BookDetail', 
	      function($scope, $routeParams, BookDetail) {
				$scope.bookDetail = BookDetail.get({
					isbn13 : $routeParams.isbn13
				});
} ]);
	
	/**
	 * Controller for loading tags
	 */
	myApp.controller('BookTagsCtrl', [ '$scope', '$routeParams', 'BooksTags',
			function($scope, $routeParams, BooksTags) {
				$scope.bookTag = BooksTags.query();
			} ]);


/**
 * This is a copy of what the Controller for loading all the books looked like before I removed 99% of everything
 */
//myApp.controller('BookListCtrl', [ '$scope', 'Books', function($scope, Books) {
	// Controller magic
//	$scope.books = Books.query();
/*	$scope.orderByTitle = 'name';
	$scope.direction = false;
	$scope.sort = function(column) {
		console.log('run this');
		if ($scope.orderByTitle === column) {
			$scope.direction = !$scope.direction;
		} else {
			$scope.orderByTitle = column;
			$scope.direction = false;
		}
	};
	$('#titleSorter').click(function(){
		if($('#sorterForTitle').hasClass('glyphicon glyphicon-sort-by-alphabet-alt')){
			$('#sorterForTitle').removeClass('glyphicon glyphicon-sort-by-alphabet-alt').addClass('glyphicon glyphicon-sort-by-alphabet');
		} else if($('#sorterForTitle').hasClass('glyphicon glyphicon-sort-by-alphabet')){
			$('#sorterForTitle').removeClass('glyphicon glyphicon-sort-by-alphabet').addClass('glyphicon glyphicon-sort-by-alphabet-alt');
		}
	});
$('#publisherSorter').click(function(){
		if($('#sorterForPublisher').hasClass('glyphicon glyphicon-sort-by-alphabet')){
			$('#sorterForPublisher').removeClass('glyphicon glyphicon-sort-by-alphabet').addClass('glyphicon glyphicon-sort-by-alphabet-alt');
		} else if($('#sorterForPublisher').hasClass('glyphicon glyphicon-sort-by-alphabet-alt')){
			$('#sorterForPublisher').removeClass('glyphicon glyphicon-sort-by-alphabet-alt').addClass('glyphicon glyphicon-sort-by-alphabet');
		}
	});*/
	
//} ]);
