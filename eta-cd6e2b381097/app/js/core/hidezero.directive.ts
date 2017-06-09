/// <reference path="./../types.ts" />

export default function hideZero() {
    return function(scope, element) {
        element.on('input', function() {
            if (this.value === "0") {
                this.value = "";
            }
        })
   }
};