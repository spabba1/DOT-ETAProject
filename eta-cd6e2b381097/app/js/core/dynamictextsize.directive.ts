/// <reference path="./../types.ts" />
'use strict';

export default function dynamicTextSize() {
  return function (scope, element, attrs) {
    // console.dir(name);
    element.bind('keyup', function (types, data, fn) {
      let textLength = element.val().length;
      console.dir(textLength);
      if (textLength < 16) {
        element.css('font-size', '100%');
      } else if (textLength < 18) {
        element.css('font-size', '93%');
      } else if (textLength < 19) {
        element.css('font-size', '85%');
      } else if (textLength < 20) {
        element.css('font-size', '77%');
      } else if (textLength < 22) {
        element.css('font-size', '63%');
      } else if (textLength < 24) {
        element.css('font-size', '54%');
      }
    });
  };
}


