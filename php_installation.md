# Brew PHP Installation

http://mxcl.github.com/homebrew/

http://braumeister.org/

## Prerequisite
Xcode, Command Line Tools (Xcode can install Command Line Tools)
Log into Mac as yourself and launch Terminal

## Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"




## Add Taps
```
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/php
```




## Install Utils
```
brew install apr apr-util coreutils bzip2
brew install diffutils automake libtool imap-uw openldap openssl
brew install less nano git rsync wget
brew install htop-osx bash-completion
brew install freetype gmp jpeg libpng gd graphviz zlib curl libxml2 unixodbc freetds
brew install --with-default-names grep
brew install --with-default-names gnu-sed
brew link --overwrite autoconf
```


## Install Memcached
```
brew install memcached
```

To have launchd start memcached at login:
```
ln -sfv /usr/local/opt/memcached/*.plist ~/Library/LaunchAgents
```
Then to load memcached now:
```
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.memcached.plist
```
Or, if you don't want/need launchctl, you can just run:
```
/usr/local/opt/memcached/bin/memcached &
```


## Install AMQP
```
brew install rabbitmq
```
Management Plugin enabled by default at http://localhost:15672




## Install PostgreSQL
```
brew install postgresql
```

# Create/Upgrade a Database

If this is your first install, create a database with:
```
initdb /usr/local/var/postgres -E utf8
```

To migrate existing data from a previous major version (pre-9.2) of PostgreSQL, see:
http://www.postgresql.org/docs/9.4/static/upgrading.html


### Loading Extensions

By default, Homebrew builds all available Contrib extensions. To see a list of all
available extensions, from the psql command line, run:
```
SELECT * FROM pg_available_extensions;
```


To load any of the extension names, navigate to the desired database and run:
```
CREATE EXTENSION [extension name];
```


For instance, to load the tablefunc extension in the current database, run:
```
CREATE EXTENSION tablefunc;
```

For more information on the CREATE EXTENSION command, see:
http://www.postgresql.org/docs/9.4/static/sql-createextension.html
For more information on extensions, see:
http://www.postgresql.org/docs/9.4/static/contrib.html


### Other

Some machines may require provisioning of shared memory:
http://www.postgresql.org/docs/9.4/static/kernel-resources.html#SYSVIPC

To install postgresql (and ossp-uuid) in 32-bit mode:
```
brew install postgresql --32-bit
```

If you want to install the postgres gem, including ARCHFLAGS is recommended:
```
env ARCHFLAGS="-arch x86_64" gem install pg
```

To install gems without sudo, see the Homebrew wiki.

To have launchd start postgresql at login:
```
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
```
Then to load postgresql now:
```
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
```
Or, if you don't want/need launchctl, you can just run:
```
pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
```


#### Create Admin Pack extension
```
psql postgres -c 'CREATE EXTENSION "adminpack";'
```


#### Create Admin User
```
createuser -P -s -e pgadmin
```


Setup Backup directory
```
mkdir ~/databases
```


Create database
```
createdb $DATABASE
```


Restore backup
```
pg_restore -v -i -F c -d $DATABASE ~/databases/$DATABASE.pgc
vacuumdb -v -z $DATABASE
```

## Install MySQL
```
brew install mysql
```


Set up databases to run AS YOUR USER ACCOUNT with:
```
unset TMPDIR
mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp
```

To set up base tables in another folder, or use a different user to run
mysqld, view the help for mysql_install_db:
```
mysql_install_db --help
```

and view the MySQL documentation:
* http://dev.mysql.com/doc/refman/5.5/en/mysql-install-db.html
* http://dev.mysql.com/doc/refman/5.5/en/default-privileges.html


To run as, for instance, user "mysql", you may need to `sudo`:
```
sudo mysql_install_db ...options…
```

A "/etc/my.cnf" from another install may interfere with a Homebrew-built
server starting up correctly.


To connect:
```
mysql -u root
```

To have launchd start mysql at login:
```
ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents
```
Then to load mysql now:
```
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
```

Or, if you don't want/need launchctl, you can just run:
```
mysql.server start
```

To start mysqld at boot time you have to copy
support-files/mysql.server to the right place for your system

PLEASE REMEMBER TO SET A PASSWORD FOR THE MySQL root USER !
To do so, start the server, then issue the following commands:

```
/usr/local/opt/mysql/bin/mysqladmin -u root password 'new-password'
/usr/local/opt/mysql/bin/mysqladmin -u root -h localhost password 'new-password'
```




Alternatively you can run:
```
/usr/local/opt/mysql/bin/mysql_secure_installation
```


which will also give you the option of removing the test
databases and anonymous user created by default. This is
strongly recommended for production servers.

See the manual for more instructions.

You can start the MySQL daemon with:
```
cd /usr/local/opt/mysql ; /usr/local/opt/mysql/bin/mysqld_safe &
```

You can test the MySQL daemon with mysql-test-run.pl
```
cd /usr/local/opt/mysql/mysql-test ; perl mysql-test-run.pl
```

## Install Nginx
```
brew install nginx
```

## Behat
```
brew install behat
```

## Install PHP 56
```
brew options php56
```
- Uninstall first
```
brew uninstall php56
brew cleanup
xcode-select --install
```

### Install PHP Switcher
```
brew install brew-php-switcher
```


## Install PHP71
```
brew install php71 --with-fpm --with-mysql --with-postgresql --with-mssql --with-imap --with-homebrew-openssl --without-snmp --without-apache --with-homebrew-curl
brew install php71-http php71-mailparse php71-intl
brew install php71-mcrypt php71-memcache php71-memcached
brew install php71-mongo php71-oauth php71-couchbase
brew install php71-uuid php71-solr php71-redis
brew install php71-igbinary php71-imagick php55-amqp
brew install php71-xdebug
brew install --HEAD homebrew/php/php71-memcached
brew install php71-redis
brew install --HEAD homebrew/php/php71-yaml
brew install php71-mustache
brew install --HEAD homebrew/php/php71-igbinary
```
## Install PHP72
```
brew install php72 --with-postgresql --with-mssql --with-imap --with-homebrew-curl
```
## Install PHP56
```
brew install php56 --with-fpm --with-mysql --with-postgresql --with-mssql --with-imap --with-homebrew-openssl --without-snmp --without-apache --with-homebrew-curl
brew install php56-http php56-mailparse php56-intl
brew install php56-mcrypt php56-memcache php56-memcached
brew install php56-mongo php56-oauth php56-couchbase
brew install php56-uuid php56-solr php56-redis
brew install php56-igbinary php56-imagick php56-amqp
brew install php56-xdebug
```

### Check PHP and link new PHP
```
which php
```

It should return /usr/local/bin/php. If it returns /usr/bin/php, it is still pointing to the PHP provided by the OS.
```
brew unlink php71 && brew link php71;
```


### Fix PEAR
```
chmod -R ug+w `brew --prefix php71`/lib/php
pear config-set php_ini /usr/local/etc/php/7.1/php.ini
PATH="$(brew --prefix josegonzalez/php/php71)/bin:$PATH"
```


```
pear config-set auto_discover 1
pear update-channels; pear upgrade
```


## Install PHPUnit
```
brew install phpunit
/usr/local/bin/phpunit && phpunit --version
```

## Install Xdebug
```
brew install php71-xdebug
```

Edit /usr/local/etc/php/7.1/conf.d/ext-xdebug.ini
Add:
```
zend_extension="/usr/local/Cellar/php71-xdebug/2.2.7/xdebug.so"
xdebug.remote_enable=1
xdebug.remote_port=9000
xdebug.remote_handler="dbgp"
xdebug.remote_host="localhost"
```

## Install Composer
```
brew install composer
```

## Set Timezone
Edit /usr/local/etc/php/7.1/php.ini
```
vim /usr/local/etc/php/7.1/php.ini
date.timezone = UTC
```

## Install php utils
```
vim /usr/local/etc/php/7.1/php.ini
phar.readonly = Off
```

```
brew install php-cs-fixer php-code-sniffer phpmd
brew install phpdocumentor
```

## Install DNS Masq
```
brew install dnsmasq
```

### configure dnsmasq
```
mkdir -p /usr/local/etc/dnsmasq.d
cp /usr/local/opt/dnsmasq/dnsmasq.conf.example /usr/local/etc/dnsmasq.conf
echo "conf-dir=/usr/local/etc/dnsmasq.d" >> /usr/local/etc/dnsmasq.conf
```

wild cards *.v.com, so v.com, site.v.com, etc. point to 127.0.0.1

```
echo "address=/v.com/192.168.50.11" > /usr/local/etc/dnsmasq.d/010-v.com.conf
echo "address=/l.com/127.0.0.1" > /usr/local/etc/dnsmasq.d/010-l.com.conf
```


# tell OS X to use dnsmasq to resolve *.mbp domains
```
sudo mkdir -p /etc/resolver
sudo tee /etc/resolver/v.com >/dev/null <<EOF
nameserver 127.0.0.1
EOF
```

```
sudo tee /etc/resolver/l.com >/dev/null <<EOF
nameserver 127.0.0.1
EOF
```

### start dnsmasq
```
sudo cp -fv /usr/local/opt/dnsmasq/*.plist /Library/LaunchDaemons
sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
```


### clear OS X's DNS cache
```
sudo killall -HUP mDNSResponder #mavricks yosemite 10.10.4
sudo discoveryutil udnsflushcaches #yosemite 10.10.3
```
