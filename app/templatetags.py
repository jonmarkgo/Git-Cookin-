#
# Templatetags for this app, they are loaded by default in main.py
#
from google.appengine.ext.webapp import template as gae_template
register = gae_template.create_template_register()

from django import template
from django.utils.safestring import mark_safe
from django.utils import simplejson

from app import config

@register.filter
def json(val):
    """
    Safely converts a python value into javascript
    """
    return mark_safe(simplejson.dumps(val))

@register.tag
def static_version(parser, token):
    return StaticVersionNode()

class StaticVersionNode(template.Node):
    def render(self, context):
        return '?v=%s' % config.STATIC_CONTENT_VERSION

def _static_version(v=None):
    return '' if v is None else '?v=%s' % v
