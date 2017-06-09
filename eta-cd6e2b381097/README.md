# Electronic Travel Authorization
#### Developed by: Jeremey Hustman

[`Testing (JnuDev1)`](http://jnudev1.dot.state.ak.us/admsvc/eta/)

[`Production (JnuWww1)`](http://web.dot.state.ak.us/admsvc/eta/)

This application is supposed to take over the Excel spreadsheet way of authorizing Travel.

### Development Requirements
[`Node`](https://nodejs.org/en/)
[`Gulp`](http://gulpjs.com/)


### Getting started

You should have Apache and ColdFusion (with the Apache connector) set up for local development.

In /etc/hosts (C:\Windows\System32\drivers\etc\hosts in windows) add
```
127.0.0.1     eta.local
```

Then in Apache, set up a virtual-host to point 'eta.local' to '/your/webroot/this-eta-repo/app' directory
Your virtualhost entry should look something like this
```
<VirtualHost *:80>
        ServerAdmin jeremey.hustman@alaska.gov
        ServerName eta.local
        DocumentRoot "/srv/http/eta/app"
        DirectoryIndex index.html
        ErrorLog "/var/log/httpd/eta.local.error.log"
        CustomLog "/var/log/httpd/eta.local.access.log" common
        Alias /CFIDE "/srv/http/CFIDE"
        <Directory "/srv/http/CFIDE">
                AllowOverride All
                Order allow,deny
                Allow from all
        </Directory>
</VirtualHost>
```


In this repositories directory, type
```
$ npm install
$ npm start
```
Then, after a few seconds, open Chrome and point to http://eta.local:3000 and you're ready to develop!

JavaScript is written in TypeScript, then compiled to JavaScript automatically by gulp.

You can write regular JavaScript in the TypeScript files.  TypeScript makes it so you can start
developing in ES6 before all the browsers catch up!






If you feel the application itself needs to be restarted, to clear sessions and things like that, point to