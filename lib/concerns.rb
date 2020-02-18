module Concerns::Findable

  def self.find_by_name(song)
    self.all.detect { |s| s.name == song }
  end
  
  def self.find_or_create_by_name(song)
    find_by_name(song) || create(song)
  end

end 