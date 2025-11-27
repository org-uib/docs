import os
os.environ['DJANGO_SETTINGS_MODULE'] = 'mysite.settings'
import sys
sys.path.insert(0, "/var/www/applications/glass/mypy/lib/python2.6/site-packages")
sys.path.insert(0, "/var/www/applications/glass/")
import django.core.handlers.wsgi
application = django.core.handlers.wsgi.WSGIHandler()
