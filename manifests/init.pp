# Class: clamd
#
# This module manages clamd
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class clamd {

    package { "clamd":
        ensure => "latest"
    }

    service { "clamd":
        enable     => true,
        hasrestart => true,
        hasstatus  => true,
        require    => Package["clamd"];
     }

     file { "/etc/freshclam.conf":
        ensure  => "present",
        require => Package["clamd"],
        source  => [
          "puppet:///modules/clamav/$hostname/freshclam.conf",
          "puppet:///modules/clamav/default/freshclam.conf"
          ];
    }
}
