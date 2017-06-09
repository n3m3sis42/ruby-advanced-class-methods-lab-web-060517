require "pry"

class Song

  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    self.new.save
    self.all.last
  end

  def self.new_by_name(name)
    (song = self.new).name = name
    song
  end

  def self.create_by_name(name)
    (song = self.create).name = name
    song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def save
    self.class.all << self
  end

  def self.new_from_filename(filename)
    name = filename.slice(/[\w\s]*(?=[\.])/).strip
    artist_name = filename.slice(/[\w\s]*(?=[\-])/).strip
    (song = new_by_name(name)).artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    (song = self.new_from_filename(filename)).save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
