require 'pry'
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
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    @@all << song
    song.name = name
    song
  end

  def self.find_by_name(search_string)
    results = @@all.select { |song| song.name.include?(search_string) }
    results.empty? ? nil : results.first
  end

  def self.find_or_create_by_name(title)
    if !!self.find_by_name(title)
      self.find_by_name(title)
    else
      self.create_by_name(title)
    end
  end

  def self.alphabetical
    @@all.sort { |song_a, song_b| song_a.name <=> song_b.name }
  end

  def self.new_from_filename(file)
    data = file.split(".").first.split(" - ")
    song = self.new_by_name(data[1])
    song.artist_name = (data[0])
    song
  end

  def self.create_from_filename(file)
    data = file.split(".").first.split(" - ")
    song = self.new_by_name(data[1])
    song.artist_name = (data[0])
    @@all << song
    song
  end

  def self.destroy_all
    @@all = []
  end

end
