def ignore(f)
 #print f+"\0"
end
def uconv(s)
 p=IO.popen({},["uchardet"],mode="w+")
 p.write s
 p.close_write
 charset=p.read.chomp
 return nil if charset == "ascii/unknown"
 begin
  charset="utf8" if charset == "UTF-8"
  return s.encode("utf8",charset)
 rescue Encoding::InvalidByteSequenceError, Encoding::InvalidByteSequenceError => e
  STDERR.puts e
  return nil
 end
end

Dir.chdir "/home/bunmei/zombie-1/sncli"
#set-search-path "."
STDIN.read.split("\0").each { |f| 
 s=File.open(f).read
 if f=uconv(f) and s=uconv(s)
  IO.popen({},[["./sncli","argv0"],"--nosync","create","-"],mode="w").write f+"\n"+s
 else
  ignore f
 end
}
# TODO
# using the backtick boil the null delimeted filenames down
