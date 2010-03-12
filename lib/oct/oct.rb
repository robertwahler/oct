module Oct

  class FileStat

    def mode(files, options={})
      puts "oct mode files: #{files.inspect}".cyan if options[:verbose]
      files.sort.each do |file|
        stat = File.stat(file)
        printf("%04o ", stat.mode & 07777)        
        if stat.directory?
          puts file.blue
        elsif stat.executable?
          puts file.green
        elsif stat.symlink?
          puts file.cyan
        else
          puts file
        end
      end 
    end

  end
end

