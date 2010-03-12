module Oct

  class FileStat

    def mode(filespec)
      Dir.glob(filespec) do |file|
        stat = File.stat(file)
        printf("%o %18b ", stat.mode & 0b111111111, stat.mode)        
        if stat.directory?
          puts file.blue
        else
          puts file
        end
      end 
    end
  end

end

