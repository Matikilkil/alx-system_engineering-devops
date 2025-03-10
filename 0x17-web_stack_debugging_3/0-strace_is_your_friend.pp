# Puppet manifest to fix Apache 500 error on WordPress

class webfix {
    package { 'php-mysql':
        ensure => installed,
    }

    exec { 'set-permissions':
        command => '/bin/chown -R www-data:www-data /var/www/html/ && /bin/chmod -R 755 /var/www/html/',
        path    => ['/bin', '/usr/bin'],
    }

    file { '/var/www/html/.htaccess':
        ensure  => absent,
    }

    service { 'apache2':
        ensure => running,
        enable => true,
        require => [Package['php-mysql'], Exec['set-permissions']],
    }
}

include webfix
