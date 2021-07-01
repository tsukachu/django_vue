import django_heroku

from django_vue.settings.base import *  # noqa

DEBUG = True

django_heroku.settings(locals())
