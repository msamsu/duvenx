duvenx
======

Django, uWSGI, Virtual environment, NGINX Hello world! template package

Requires
--------

### On local machine

Locally you will need to install:

```bash
apt-get install python-virtualenv
```

### On production

Requires nginx and uwsgi packages from here
https://github.com/lemr/services

Everything else is in .deb package control so it will ask you to install some dependencies if you miss them on the package instalation.


Local use
---------

To start your new development project derived from this template do:

```bash
cd to/devel/dir
git clone https://github.com/lemr/duvenx.git
./duvenx/deploy.sh project_name
```

This will prepare new project called project_name, it also creates its local git repo.

To install virtual environment then edit and execute:

```bash
cd project_name
./installvenv.sh
```

Now you will be able to use local development tools

* manage_local.sh
* syncdb.sh
* testserver.sh

manage_local.sh is proxy to django manage.py with using local settings.
Check these files out.


Use on production
-----------------

To deploy your project on production do:

```bash
cd /tmp/
git clone your.repo/project_name
cd project_name
cd web
make pkginst && make pkgclean
```

Use "make pkginst" in case you want to also install, otherwise "make pkgbuild" to just get the .deb package

### Notes

* This takes care of virtual environment in postinst.
* This can be also automatized by postcommit hook. See project_name/linux/git/hooks/post-receive
* Installs all to /var/www/project_name
* Creates and starts init scripts
* Configuration can be found in /var/www/project_name/conf
