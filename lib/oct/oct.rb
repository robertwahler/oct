module Oct

  class FileStat

    def mode(filespec)
      Dir.glob(filespec) do |file|
        stat = File.stat(file)
        puts sprintf("%8o %20b %s", stat.mode & 0b111111111, stat.mode, file)        
      end 
    end
  end

end

