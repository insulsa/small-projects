Dir.chdir "/home/bunmei/zombie-1/sncli"
#set-search-path "."
STDIN.read.split("\0").each { |f| 
 charset=`uchardet #{f}`.chomp
 if charset != "ascii/unknown"
 `iconv --from-code #{charset} #{f}|./sncli --nosync -t #{f} create -`
 else
  puts f
  next
 end
 #s=File.open(f).read
 #s.encode!("utf8",charset)
 #IO.popen({},[["./sncli","argv0"],"--nosync","create","-"],mode="w").write 
}
# TODO
# using the backtick boil the null delimeted filenames down
