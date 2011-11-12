import logging
import random
import re
import datetime
import simplejson as json

from external.BeautifulSoup import BeautifulSoup as bs
from google.appengine.api import memcache as mc, urlfetch
from google.appengine.runtime import DeadlineExceededError

from django.core.urlresolvers import reverse
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.http import Http404, HttpResponseRedirect, HttpResponse

from djangoappengine.utils import on_production_server

from shortcuts import render_response, json_response

from app import config

# load the app/templatetags file for all views
from django.template.loader import add_to_builtins
add_to_builtins('app.templatetags')

def _logger(): return logging.getLogger(__name__)

## Views

def landing(request):
    return render_response('app/home_desktop.html', {}, request)

def home(request):
    args = {'js_cfg':
                {'is_authenticated': request.user.is_authenticated(),
                 'username': request.user.username if request.user else None},
            }
    return render_response('app/home.html', args, request)

def json_false():
    return json_response({'ok': False})
