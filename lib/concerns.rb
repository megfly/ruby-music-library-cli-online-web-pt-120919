module Concerns::Findable

  def find_by_name(name)
     all.find do |song_detect|
       song_detect.name == name
     end
  end
  
  def self.find_or_create_by_name(song)
    find_by_name(song) || create(song)
  end

end 