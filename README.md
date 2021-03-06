<h2>Hi! ^_^ <img src="http://i.imgur.com/n9tPHNk.jpg" /></h2>

I'm [cha0s](https://github.com/cha0s) and I love real-time interactive web
applications.

## What's Shrub?

Shrub is intended to be a jumping off point for real-time web applications
using AngularJS, NodeJS, Redis, Socket.IO, Bootstrap, the list goes on.

### Features

* Scalable (thanks to [Redis](http://redis.io)) real-time client/server
communication using [socket.io](http://socket.io)

* Clean and intelligent structure for the common AngularJS patterns
(controllers, directives, filters, and services)

* Numerous built-in tasks for [Grunt](http://gruntjs.com), for seamless
integration of CoffeeScript, LESS, minification, and preprocessing to keep the
boilerplate away.

* Browser-side NodeJS-style modules, with a require service provided in
Angular for loading them.

* Foundational directives and services, such as notifications, navigation,
configuration, debugging, and more.

* Robust system for mocking every aspect of your application, including during
E2E tests, which Angular is a bit difficult about, out of the box.

## Get rolling

* Get yourself a clone: `$ git clone git://github.com/cha0s/shrub.git`

* Get in the new directory and then the usual `npm install`, followed by
`$ scripts/good-to-go`. This script will return 0 if the project builds, and
the tests run successfully. In other words, you can easily wire it up in a
pre-commit hook.

* You will need to create a settings file. Copy config/settings-default.json
to config/settings.json

* Spin up the server: `$ npm start` and navigate to http://localhost:4201 (make
sure you've run grunt at least once!)

* Check out how Shrub has generated a lot of Angular boilerplate for
you. Particularly app/js/{controllers,directives,filters,services}.js will
be of interest.

## Enjoy!
