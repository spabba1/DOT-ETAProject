/// <reference path="./../types.ts" />
export default function sumTotals() {
  return function(data, key) {
    if (angular.isUndefined(data) && angular.isUndefined(key)) {
      return 0;
    }
    let sum = 0;

    angular.forEach(data, function(v, k) {
      sum = sum + Math.round(v[key] * 100) / 100;
    });

    if (isNaN(sum)) {
      sum = 0;
    }
    return sum;
  };
}

