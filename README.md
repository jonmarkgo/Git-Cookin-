Git Cookin'
================================

Woowee! Welcome to Git Cookin', the rootinest, tootinest, cooking website out there.

Libraries used include:

* [jQuery JavaScript Framework](http://jquery.com/)
* [Mustache JavaScript templating library](http://github.com/janl/mustache.js)
* [djangoappengine](http://www.allbuttonspressed.com/projects/djangoappengine)


Getting started
---------------

1. Download the [Google App Engine Python SDK](http://code.google.com/appengine/downloads.html)

2. Test your app loads the test page
   * run `sh dev_server.sh`
   * open a web browser and navigate to [http://localhost:8000](http://localhost)
   * ensure that you see the success page

3. When ready, deploy the app to GAE
   * `python manage.py deploy`


Useful commands
---------------

Start the development server
`sh dev_server.sh`

Publish your app to GAE
`python manage.py deploy`

Launch a local Python console for interecting with the app and datastore
`python manage.py shell`

Launch a remote Python console for interacting with the app and datastore
`python manage.py remote shell`


Notes and gotchas
-----------------

* GAE will penalize your app if requests take over 1000 ms to complete, so
push as many calls to the frontend as possible.

* This application is packaged with [djangoappengine](http://www.allbuttonspressed.com/projects/djangoappengine)
for creating Django projects that run on GAE. It is worthwhile to read the [overview of using the helper](http://code.google.com/appengine/articles/django-nonrel.html).

* You can access the GAE admin console at [http://localhost/_ah/admin/](http://localhost/_ah/admin/)
