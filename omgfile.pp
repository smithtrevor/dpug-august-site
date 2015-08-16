define omgfile (
  $omg             => 'omg',
){

  unless defined(File['/tmp']) {
    file { '/tmp':
      ensure => directory,
    }
  }

  file { "omgfile::${name}":
    ensure  => file,
    path    => "/tmp/${name}"
    require => File['/tmp'],
  }


}
