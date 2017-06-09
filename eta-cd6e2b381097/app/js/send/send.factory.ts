/// <reference path="./../types.ts" />
SendFactory.$inject = [
    '$http',
    '$log',
    '$location',
    'ngToast'
];

function SendFactory(
    $http,
    $log,
    $location,
    ngToast
) {

  const SendFactory: any = {};

  const b64ToUint6 = function (nChr) {
  return (nChr > 64 && nChr < 91) ? nChr - 65
    : (nChr > 96 && nChr < 123) ? nChr - 71
    : (nChr > 47 && nChr < 58) ? nChr + 4
    : nChr === 43 ? 62
    : nChr === 47 ? 63
    : 0;
  };

  SendFactory.createPdf = function(taid) {
    return $http({
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      method: 'POST',
      params: {
        convertToBase64: true,
        createUrl: false,
        method: 'create',
        returnFormat: 'json',
        taid: taid
      },
      url: 'model/services/pdfcreate.cfc'
    }).then(function (response) {
      $log.info('createPdf success');
      console.dir(response);
      return response;
    }, function (response) {
      $log.error('createPdf error');
      console.dir(response);
      return response;
    });
  };

  SendFactory.base64ToUint8Array = function(base64) {
    const raw = atob(base64);
    const uint8Array = new Uint8Array(new ArrayBuffer(raw.length));
    let i = 0;
    for (i; i < raw.length; i += 1) {
      uint8Array[i] = raw.charCodeAt(i);
    }
    return uint8Array;
  };

  /*jshint bitwise: false*/
  SendFactory.base64DecToArr = function (sBase64, nBlocksSize) {
    let sB64Enc = sBase64.replace(/[^A-Za-z0-9\+\/]/g, ''),
    nInLen = sB64Enc.length,
    nOutLen = nBlocksSize ? Math.ceil((nInLen * 3 + 1 >> 2) / nBlocksSize) * nBlocksSize : nInLen * 3 + 1 >> 2,
    taBytes = new Uint8Array(nOutLen),
    nMod3,
    nMod4,
    nUint24 = 0,
    nOutIdx = 0,
    nInIdx = 0;

    for (nMod3, nMod4, nUint24, nOutIdx, nInIdx; nInIdx < nInLen; nInIdx += 1) {
      nMod4 = nInIdx & 3;
      nUint24 |= b64ToUint6(sB64Enc.charCodeAt(nInIdx)) << 6 * (3 - nMod4);
      if (nMod4 === 3 || nInLen - nInIdx === 1) {
        for (nMod3 = 0; nMod3 < 3 && nOutIdx < nOutLen; nMod3 += 1, nOutIdx += 1) {
          taBytes[nOutIdx] = nUint24 >>> (16 >>> nMod3 & 24) & 255;
        }
        nUint24 = 0;

      }
    }
    return taBytes;
  };
  /*jshint bitwise: true*/

  SendFactory.sendToEdocs = function (taid, approver, authdata) {
    return $http({
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
      method: 'POST',
      params: {
        approver: approver,
        authdata: authdata,
        method: 'sendToEdocs',
        returnFormat: 'json',
        taid: taid
      },
      url: 'model/services/send.cfc'
    }).then(function (response) {
      $log.info('factory-sendToEdocs success: ' + response);
      ngToast.create({
        className: response.data.STATUS,
        content: response.data.MESSAGE
      });

      $location.path('/');
      return response;
    }, function (response) {
      $log.error('factory-sendToEdocs error: ' + response);
      if (response.status > 200) {
        ngToast.create({
          className: 'warning',
          content: response.statusText
        });
        /*console.dir(response);*/
      } else {
        ngToast.create({
          className: response.data.STATUS,
          content: response.data.DETAIL
        });
      }
      return response;
    });
  };
  return SendFactory;
}

export default SendFactory;

