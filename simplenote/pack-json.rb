STDIN.read.split("\0").each { |f| 
 IO.popen([{},"jq","--raw-output","--slurp",".[]|.content"],mode="w+") {|p|
  p.write File.open(f).read
  p.close_write
  puts p.read,"%%" }}
