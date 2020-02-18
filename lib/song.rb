class Song 
  
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize (name, artist = nil, genre = nil)
    @name = name 
    self.artist = artist if artist
    self.genre = genre if genre #song belongs to genre if it has a genre
  end 
  
  def self.all 
    @@all
  end 
  
  def self.destroy_all 
    @@all.clear
  end 
  
  def save 
    @@all << self
  end 
  
  def self.create(name)
    #initializes, saves and returns the song 
    song = self.new(name) 
    song.save 
    song 
  end 
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self) #song belongs to artist 
  end 
  
  def genre=(genre)
    @genre = genre #defining variable 
     #does not add the song to the genres collection if it already exits
    
    genre.songs << self unless genre.songs.include?(self)
  end 
  
  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end 
    end
  end 
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  

end 