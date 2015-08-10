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

  }

}
