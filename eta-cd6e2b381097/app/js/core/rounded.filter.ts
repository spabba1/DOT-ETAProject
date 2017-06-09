/// <reference path="./../types.ts" />
/**
 * Rounds number to nth digit because Angular isnt doing it properly.
 * http://stackoverflow.com/questions/20445843/rounding-a-number-in-input-but-keep-full-decimal-value-in-model
 */
export default function rounded() {

    return function(val, to) {
        return val.toFixed(to || 0);
    };
};
