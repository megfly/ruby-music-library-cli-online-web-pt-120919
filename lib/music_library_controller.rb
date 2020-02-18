class MusicLibraryController
  
  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end 
  
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    user_input = gets.chomp
    case user_input
    when "list songs"
      self.list_songs
    when "list artists"
      self.list_artists
    when "list genres"
      self.list_genres
    when "list artist"
      self.list_songs_by_artist
    when "list genre"
      self.list_songs_by_genre
    when "play song"
      self.play_song
    when "exit"
      'exit'
    else
      call
    end
  end
  
  def list_songs
    song = Song.all.sort {|song1, song2| song1.name <=> song2.name}

    song.each.with_index(1) {|song, index| puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end 

  def list_artists
    songs_sorted_by_artist = Artist.all.sort_by do |artist| 
      artist.name
    end
    songs_sorted_by_artist.each.with_index(1) do |a,index|
      puts "#{index}. #{a.name}"
    end
  end

  def list_genres
    songs_sorted_by_genre = Genre.all.sort_by do |g|
      g.name
    end
    songs_sorted_by_genre.each.with_index(1) do |g,index|
      puts "#{index}. #{g.name}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    if artist = Artist.find_by_name(input)
      songs_sorted_by_name = artist.songs.sort_by do |s|
        s.name
      end
      songs_sorted_by_name.each.with_index(1) do |s,index|
        puts "#{index}. #{s.name} - #{s.genre.name}"
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    if genre = Genre.find_by_name(input) 
      songs_sorted_by_name = genre.songs.sort_by do |s|
        s.name
      end
      songs_sorted_by_name.each.with_index(1) do |s,index|
        puts "#{index}. #{s.artist.name} - #{s.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
      input = gets.strip.to_i
      if (1..Song.all.length).include?(input)
        song = Song.all.sort_by {|song| song.name}[input-1]
      end
      puts "Playing #{song.name} by #{song.artist.name}" if song
    end

end 