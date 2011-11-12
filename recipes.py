from google.appengine.ext import webapp
from google.appengine.ext.webapp import util

import os
from google.appengine.ext.webapp import template

class RecipesHandler(webapp.RequestHandler):
    def get(self):
		template_values = {
		            'recipes': ["recipe 1","recipe 2"],
		        }
		path = os.path.join(os.path.dirname(__file__), 'templates/recipes.html')
		self.response.out.write(template.render(path, template_values))