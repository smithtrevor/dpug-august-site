node default {

  if $::kernel == 'Linux' {
      
    service { 'httpd':
      ensure  => running,
      require => Package['httpd'],
    }

    package { 'httpd':
      ensure => installed,
    }

    service { 'mariadb':
      ensure => running,
    }

    package { 'mariadb':
      ensure => installed,
      before => Service['mariadb'],
    }

    package { 'php':
      ensure => installed,
    }

    file { '/etc/php.ini':
      ensure  => file,
      require => Package['php'],
    }

    ini_setting { 'php_timezone':
      ensure  => present,
      path    => '/etc/php.ini',
      section => 'Date',
      setting => 'date.timezone',
      value   => 'America/Detroit',
      require => File['/etc/php.ini'],
    }

  }

}
