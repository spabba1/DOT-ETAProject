export default function totalOutOfPocket() {
  return function(data, key1, key2) {
    if (angular.isUndefined(data) && angular.isUndefined(key1) && angular.isUndefined(key2)) {
      return 0;
    }

    let sum = 0;
    angular.forEach(data, function(v, k) {
      sum = sum + (parseInt(v[key1], 10) * parseInt(v[key2], 10));
    });
    return sum;
  };
}
