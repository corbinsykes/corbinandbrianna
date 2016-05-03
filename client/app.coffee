angular.module 'app', [
    'angular-meteor',
    'ngMaterial'
]

.controller "Ctrl", ['$scope', ($scope) ->
	_weddingDate = "9/3/2016"

	today = new Date()
	dd = today.getDate()
	mm = today.getMonth() + 1
	yyyy = today.getFullYear()

	if dd < 10
	    dd = '0' + dd

	if mm < 10
	    mm = '0' + mm

	_today = mm + '/' + dd + '/' + yyyy;

	$scope.parseDate = (str) ->
		mdy = str.split('/')
		new Date(mdy[2], mdy[0] - 1, mdy[1])

	$scope.dayDiff = (first, second) -> Math.round (second - first) / (1000 * 60 * 60 * 24)

	console.log _weddingDate
	console.log _today
	$scope.countdown = $scope.dayDiff($scope.parseDate(_today), $scope.parseDate(_weddingDate)) - 1
]

.directive 'header', ($window) ->
	(scope, element, attrs) ->
		_headerHeight = angular.element('header')[0].offsetHeight
		_welcomeHeight = angular.element('.welcome')[0].offsetHeight

		angular.element($window).bind 'scroll', ->
	    	if @pageYOffset >= _welcomeHeight - _headerHeight
	    		console.log "dis gon be white"
	    		scope.isFilled = true
	    	else
	    		scope.isFilled = false
	    	scope.$apply()
	    return