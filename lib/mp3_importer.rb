class MP3Importer

    attr_accessor :path

    def initialize(filepath)
        @path = filepath
    end

    def files
        Dir.children(@path).each{|file| File.file?(file)}
    end 

    def import
        self.files.each {|filename| Song.new_by_filename(filename)}
    end
end