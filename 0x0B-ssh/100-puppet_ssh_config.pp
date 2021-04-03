# Setup a SSH client configuration file to connect to a server with RSA key.

include stdlib

file_line { 'Declare identity file':
  path    => '/etc/ssh/ssh_config',
  line    => '    IdentityFile ~/.ssh/holberton',
  replace => true
}

file_line { 'Turn off passwd auth':
  path    => '/etc/ssh/ssh_config',
  line    => '    PasswordAuthentication no',
  replace => true
}
