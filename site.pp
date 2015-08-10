node default {

  if $::kernel == 'Linux' {

    $listen_address = '*'
    $listen_port = '80'

    Ini_setting <| tag == 'php.ini' |> {
      notify => Service['httpd'],
    }
      
    service { 'httpd':
      ensure  => running,
      require => Package['httpd'],
    }

    package { 'httpd':
      ensure => installed,
    }

    file { '/etc/httpd/conf/ports/conf':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => inline_template('Listen <%= @listen_address %>:<%= @listen_port %>'),
      require => Package['httpd'],
      notify  => Service['httpd'],
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
      tag     => 'php.ini',
    }

  }

}
