confdir _DIR_
logdir _DIR_
actionsfile gfw.action   
logfile logfile
listen-address  0.0.0.0:_PORT_
forward 192.168.*.*/ .  
forward 10.*.*.*/ .  
forward 127.*.*.*/ .
forward localhost/ .
  debug   512 # Common Log Format
  debug  2048 # CGI user interface
  debug  4096 # Startup banner and warnings.
  debug  8192 # Non-fatal errors
