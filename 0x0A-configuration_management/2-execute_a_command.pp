# Kills the killmenow process.

exec { 'killmenow':
  command => 'pkill -f killmenow',
  path => '/usr/local/bin/:/usr/bin:/bin/',
}
