class Artist 
  
  attr_accessor :name
  
  @@all = []
  
  
  def initialize (name)
    @name = name
    @songs =[]
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
  
  def self.create (name)
    #initializes, saves and returns the artist
    artist = self.new(name) 
    artist.save #saves
    artist #returns
  end 
  
  def songs 
    @songs
  end 
  
  def add_song(song)
    song.artist = self unless song.artist  #songs belong to an artist unless the song already has an artist..
    songs << song unless songs.include?(song) #adds song to collection unless the collection already includes that song
  end 
  
  def genres 
    self.songs
  end 
  
end 