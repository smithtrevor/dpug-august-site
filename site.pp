node default {

  if $::kernel == 'Linux' {
      
    package { 'httpd':
      ensure => installed,
    }

    package { 'mariadb':
      ensure => installed,
    }

    package { 'php':
      ensure => installed,
    }

  }

}
