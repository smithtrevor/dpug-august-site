node default {

  if $::kernel == 'Linux' {
      
    service { 'httpd':
      ensure => running,
    }

    package { 'httpd':
      ensure => installed,
    }

    service { 'mariadb':
      ensure => running,
    }

    package { 'mariadb':
      ensure => installed,
    }

    package { 'php':
      ensure => installed,
    }

  }

}
