/*global jasmine, describe, beforeEach, inject, expect, it*/
'use strict';

var mock, eDocsService;
beforeEach(module('eta'));
beforeEach(function () {
    mock = {alert: jasmine.createSpy()};

    module(function($provide) {
        $provide.value('$window', mock);
    });

    inject(function($injector) {
        eDocsService = $injector.get('eDocsService');
    });
});


it ('should return my credentials', function () {
    eDocsService.sendPdfToeDocs().then(function (response) {
        expect(response).toBe('Something');
    }, function (response) {
        console.error(response);
    });
});



    /*it ('should do something', function () {
        httpBackend.whenPOST('http://jnuedocs-ucm.dot.state.ak.us/jnu-dot-edocs/idcplg').respond({
            data: {
                children: [
                    {
                        data: {
                            subreddit: "golang"
                        }
                    },
                    {
                        data: {
                            subreddit: "javascript"
                        }
                    },
                    {
                        data: {
                            subreddit: "golang"
                        }
                    },
                    {
                        data: {
                            subreddit: "javascript"
                        }
                    }
                ]
            }
        });
        EDocsService.getdIDFromeName('testName').then(function (response) {
            expect(response).toEqual(['golang', 'javascript']);
        });
        httpBackend.flush();
    });*/


