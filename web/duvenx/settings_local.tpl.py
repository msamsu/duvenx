from .settings import *

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': 'local_project_root/web/devices/default.sqlite'
    }
}

TEMPLATE_DIRS = (
    # Put strings here, like "/home/html/django_templates" or "C:/www/django/templates".
    # Always use forward slashes, even on Windows.
    'local_project_root/web/duvenx/templates'
)

INSTALLED_APPS += (
    'django_extensions',
)

STATIC_DOC_ROOT = 'local_project_root/web/duvenx/static'

MIDDLEWARE_CLASSES = (
    'firepy.django.middleware.FirePHPMiddleware',
) + MIDDLEWARE_CLASSES

EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'

