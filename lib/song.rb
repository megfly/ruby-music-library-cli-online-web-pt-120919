class Song 
  
  #extend Concerns::Findable
  
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
  
 def self.find_by_name(song)
    self.all.detect { |s| s.name == song }
  end
  
   def self.find_or_create_by_name(song)
    find_by_name(song) || create(song)
  end
  
  def self.new_from_filename(filename)
    artist_name, song_name, genre = filename.gsub(".mp3","").split(" - ")
    new(song_name,Artist.find_or_create_by_name(artist_name),Genre.find_or_create_by_name(genre))
  end
  
  def self.create_from_filename(filename)
    new_from_filename(filename).tap {|song| song.save}
  end

end 