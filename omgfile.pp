define omgfile (
  $omg             => 'omg',
){

  file { '/tmp':
    ensure => directory,
  }

  file { "omgfile":
    ensure  => file,
    path    => "/tmp/${name}"
    require => File['/tmp'],
  }


}
