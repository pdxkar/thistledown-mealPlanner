var myApp = angular.module('booksbenchproject', [ 'booksServices', 'booksTagsServices', 'bookDetailServices', 'componentServices'], 
		function ($routeProvider, $locationProvider, $httpProvider) {

    var interceptor = ['$rootScope', '$q', function (scope, $q) {

        function success(response) {
            return response;
        }

        function error(response) {
            var status = response.status;

            if (status == 404) {
                window.location = "/books";
                alert('Book or Page Was not Found. Press Ok to redirect back to the browsing page');
                return;
            }
            // otherwise
            return $q.reject(response);

        }

        return function (promise) {
            return promise.then(success, error);
        }

    }];
    $httpProvider.responseInterceptors.push(interceptor);
});


