import random
import re
import urlparse
import logging

from django.core.urlresolvers import reverse
from django.contrib.auth.models import User
from django.db import models

from app import config

from djangotoolbox.fields import ListField

logger = logging.getLogger(__name__)

## Django Models
class UserProfile(models.Model):
    user = models.ForeignKey(User, unique=True)
    url = models.URLField("Website", blank=True)
    company = models.CharField(max_length=50, blank=True)
