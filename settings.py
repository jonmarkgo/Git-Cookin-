# Django settings for MindMaze application

from djangoappengine.settings_base import *
from djangoappengine.utils import on_production_server

import os

############
# Edit me! #
############

# your SECRET_KEY should be a unique 50 character string.
SECRET_KEY = 'qWy7VsMGtOA9xt+B4o9sVuQIROXBysJt0xADB+OUbH14567mPi'

# DEBUG = True
DEBUG = not on_production_server

##################
# Don't touch me #
##################
DATABASES = {
    'default': {
        'ENGINE': 'dbindexer',
        'TARGET': 'gae',
    },
    'gae': {
        'ENGINE': 'djangoappengine.db',
    },
}

INSTALLED_APPS = (
    'autoload',
    'mediagenerator',
    'djangoappengine',
    'djangotoolbox',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'app', # app code
    # 'south', # schema migrations
)

MIDDLEWARE_CLASSES = (
    'autoload.middleware.AutoloadMiddleware',
    'mediagenerator.middleware.MediaMiddleware',
    'dbindexer.middleware.DBIndexerMiddleware',
    'app.middleware.SmartAppendSlashMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
)

TEMPLATE_CONTEXT_PROCESSORS = (
    'django.contrib.auth.context_processors.auth',
    'django.core.context_processors.request',
)

AUTHENTICATION_BACKENDS = (
    'django.contrib.auth.backends.ModelBackend',
)

DEV_MEDIA_URL = '/devmedia/'
PRODUCTION_MEDIA_URL = '/media/'

GLOBAL_MEDIA_DIRS = (os.path.join(os.path.dirname(__file__), 'static'),
)

GLOBAL_MEDIA_DIRS = (os.path.join(os.path.dirname(__file__), 'staticdev'),
)

ROOT_MEDIA_FILTERS = {
    'js': 'mediagenerator.filters.yuicompressor.YUICompressor',
    'css': 'mediagenerator.filters.yuicompressor.YUICompressor',
}

YUICOMPRESSOR_PATH = os.path.join(os.path.dirname(os.path.dirname(__file__)),
                                  'tools/yuicompressor.jar')

MEDIA_BUNDLES = (
    ('desktop.css',
     'css/screen.css',
     ),
    ('main.js',
     'js/app.js',
    ),
)

OFFLINE_MANIFEST = {
    'webapp.manifest': {
        'cache': (
            r'mobile\.css',
            r'main\.js',
            r'img/.*',
            ),
        'exclude': (
            r'img/from_game/.*',
            )
        },
    }

ADMIN_MEDIA_PREFIX = '/media/admin/'
MEDIA_ROOT = os.path.join(os.path.dirname(__file__), 'media')
TEMPLATE_DIRS = (os.path.join(os.path.dirname(__file__), 'templates'),)

ROOT_URLCONF = 'urls'
APPEND_SLASH = False
SMART_APPEND_SLASH = True
DBINDEXER_SITECONF = 'dbindexes'

AUTH_PROFILE_MODULE = 'app.UserProfile'

ENABLE_PROFILER = True
SORT_PROFILE_RESULTS_BY = 'cumulative'
ONLY_FORCED_PROFILE = True
