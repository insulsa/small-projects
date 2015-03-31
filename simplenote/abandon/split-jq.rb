STDIN.read.split("\n%%\n").each { |s|
 puts ">"+s }
STDIN.each(sep="%%") { |s|
 IO.popen("jq --slurp --raw-input {modifydate:0,tags,createdate:0,syncdate:0}",mode="w+") { |p|
  p.puts s
  p.close_write }

STDIN.read.split("\0").each { |f| 
 Dir.chdir "/home/bunmei/zombie-1/sncli"
 set-search-path "."
 IO.popen({},[["sncli","argv0"],"--nosync
 puts f
 File.open(f).each_line { |line|
  print "%" if /^%%/ =~ line
  puts line }
 puts "%%" }
