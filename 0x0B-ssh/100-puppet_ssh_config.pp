# Setup a SSH client configuration file to connect to a server with RSA key.

file_line { 'Turn off passwd auth':
  path    => '/etc/ssh/ssh_config',
  match   => '.+PasswordAuthentication.+'
  line    => '    PasswordAuthentication no',
}

file_line { 'Declare identity file':
  path    => '/etc/ssh/ssh_config',
  line    => '    IdentityFile ~/.ssh/holberton',
  replace => true
}
