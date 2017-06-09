/// <reference path="./../types.ts" />
/**
 * Replaces zero with a blank space.  Needed because NaN if input is empty.
 */
export default function chkEmpty() {

  return function(input) {
    if (angular.isString(input) &&
        !(angular.equals(input, null) ||
          angular.equals(input, ''))) {
      return input;
    } else {
      return '';
    };

  };
}
