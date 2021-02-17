class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @artist = name
        @@all << self
    end


    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        song = filename.split(" - ")
        song_name = song[1]
        new_song = self.new(song_name)
        artist = song[0]
        new_song.artist_name = artist
        new_song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end
end