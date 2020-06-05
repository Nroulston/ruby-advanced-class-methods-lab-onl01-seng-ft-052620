

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = new
    all << song
    song
  end

  def self.new_by_name(song)
    song_name = new
    song_name.name = song
    song_name
  end

  def self.create_by_name(song)
    song_name = new_by_name(song)
    song_name.save
    song_name
  end

  def self.find_by_name(song)
    all.find { |i| i.name == song }
  end

  def self.find_or_create_by_name(song)
    if name = find_by_name(song)
      name
    else
      create_by_name(song)
    end
  end

  def self.alphabetical
    @@all.sort_by! {|song| song.name}
  end
  
  def self.new_from_filename(song)
    artist_name , song_name =  song.split(" - ")
    new_song = self.new_by_name(song_name.gsub(".mp3", ""))
    new_song.artist_name = artist_name
    new_song
  end
  
  def self.create_from_filename(song)
    artist_name , song_name =  song.split(" - ")
    new_song = self.create_by_name(song_name.gsub(".mp3", ""))
    new_song.artist_name = artist_name
    new_song

  end

  def self.destroy_all
    @@all.clear
  end
end
