from djangoappengine.utils import on_production_server

## Configuration variables

# Edit these
APP_ID = 'app_id'
APP_SECRET = 'app_secret'
APP_HOSTNAME = 'your-app.appspot.com'

STATIC_CONTENT_VERSION = 1

DEBUG = not on_production_server
