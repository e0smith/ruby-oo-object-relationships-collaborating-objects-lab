require "pry"

class Artist
    attr_accessor :name, :songs
    
    @@all = [] 
    
    
    def initialize(name)
        @name = name
        @songs = []
        @@all << self
    end

    def add_song(song)
        song.artist = self
    end
    
    def songs
        Song.all.select {|song| song.artist == self}
    end
    
    def self.all
        @@all
    end

    def self.find_or_create_by_name(name)
        search = self.all.find {|artist| artist.name == name}
        if search
            return search
        else 
            new_artist = self.new(name)
            new_artist
        end
    end

    def print_songs
        self.songs.each {|song| puts song.name}
    end
end

