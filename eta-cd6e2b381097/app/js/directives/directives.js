/*global eta, angular*/
'use strict';

eta.directive('customSort', function () {
    return {
        restrict: 'A',
        transclude: true,
        scope: {
            order: '=',
            sort: '='
        },
        template:
                '<a ng-click="sortBy(order)" style="color: #555;">' +
                '    <span ng-transclude></span>' +
                '    <i ng-class="selectedCls(order)"></i>' +
                '</a>',
        link: function (scope) {

            // change sorting order
            scope.sortBy = function (newSortingOrder) {
                var sort = scope.sort;

                if (sort.sortingOrder === newSortingOrder) {
                    sort.reverse = !sort.reverse;
                }

                sort.sortingOrder = newSortingOrder;
            };

            scope.selectedCls = function (column) {
                if (column === scope.sort.sortingOrder) {
                    return ('icon-chevron-' + ((scope.sort.reverse) ? 'down' : 'up'));
                }

                return 'icon-sort';
            };
        }// end link
    };
});

eta.directive('yesDelete', function () {
    return {
        require: 'ngModel',
        link: function (scope, element, attrs, formController) {

            formController.$validators.yesDelete = function (modelValue) {


                if (angular.lowercase(modelValue) === 'delete') {
                    // can do delete
                    return true;
                }

                return false;
            };
        }
    };
});

/*
eta.directive('showErrors', function () {
	return {
		restrict: 'A',
		require: '^form',
		link: function (scope, el, attrs, CreateTaFormCtrl) {
			// find the text box element, which has the 'name' attribute
			var inputEl = el[0].querySelector('[name]');
			// convert the native text box element to an angular element
			var inputNgEl = angular.element(inputEl);
			// get the name on the text box so we know the property to check on
			// the form controller
			var inputName = inputNgEl.attr('name');
			// only apply the has-error class after the user leaves the text
			// box
			inputNgEl.bind('blur', function () {
				el.toggleClass('has-error',
						CreateTaFormCtrl[inputName].$invalid);
			});

			scope.$on('show-errors-check-validity', function () {
				el.toggleClass('has-error',
						CreateTaFormCtrl[inputName].$invalid);
			});

			scope.$on('show-errors-reset', function() {
				$timeout(function () {
					el.removeClass('has-error');
				}, 0, false);
			});


		}
	};
});
*/

