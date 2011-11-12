from django.conf.urls.defaults import *
from django.views.generic.simple import direct_to_template

urlpatterns = patterns(
    '',
    url(r'^app/$', 'app.views.home', name='home'),
)
