bridgeFile = File.new("bridges","r")
bridgeFile.each_line do |line|
  (a,p)=line.chomp.split(":")
  com="nc -z -w 3 #{a} #{p}"
  $stderr.printf " # %s ...",com
  $stdout.flush
  `#{com}`
  if (0==$?)
	$stderr.puts "up"
	$stdout.puts "Bridge "<<a<<":"<<p
  else
	$stderr.puts "down"
  end
end
