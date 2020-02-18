class Genre 
  
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
    genre = self.new(name) 
    genre.save 
    genre
  end 
  
  def songs 
    @songs
  end 
  
end 