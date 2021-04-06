# Script that setup a nginx web server on our server + redirection.

package { 'nginx':
  ensure   => installed,
  provider => 'apt'
}

# Index page
file { '/var/www/html/index.nginx-debian.html':
  content => 'Holberton School'
}

# Redirect to fabulous Rick Astley page
file_line { 'Rick Astley showtime':
  path => '/etc/nginx/sites-enabled/default',
  after => 'listen [::]:80 default_server;',
  line => '        rewrite ^/redirect_me https://www.youtube.com/watch?v=dQw4w9WgXcQ permanent;'
}

# 404 Page not Found
file { '/var/www/html/404.html':
  source => 'https://pastebin.com/raw/szLjiB9Q'
}

file_line { 'Rick Astley showtime':
  path => '/etc/nginx/sites-enabled/default',
  after => 'dQw4w9WgXcQ permanent;',
  line => '        error_page 404 /404.html;'
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx']
}
