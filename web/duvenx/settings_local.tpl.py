
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': '/var/www/duvenx/devices/default.sqlite'
    }
}

TEMPLATE_DIRS = (
    # Put strings here, like "/home/html/django_templates" or "C:/www/django/templates".
    # Always use forward slashes, even on Windows.
    '/var/www/duvenx/duvenx/templates'
)

INSTALLED_APPS = (
    'django_extensions',
)

STATIC_DOC_ROOT = '/var/www/duvenx/duvenx/static'

MIDDLEWARE_CLASSES_BEFORE = (
    'firepy.django.middleware.FirePHPMiddleware',
)
MIDDLEWARE_CLASSES_AFTER = tuple()

EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'

