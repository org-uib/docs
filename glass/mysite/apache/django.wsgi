import os
import sys

sys.path.append('c:/python25/django/mysite')
sys.path.append('c:/python25/django')
os.environ['DJANGO_SETTINGS_MODULE'] = 'settings'

import django.core.handlers.wsgi
application = django.core.handlers.wsgi.WSGIHandler()
