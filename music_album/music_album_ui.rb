require_relative 'music_album'
require_relative 'genre'
require_relative 'music_album_store'

class MusicAlbumUI
  def initialize
    @music_album_store = MusicAlbumStore.new
    @music_album = []
    @genre = []
  end

  def list_music_album
    if @music_album.empty?
      puts 'Music Album is empty.'
    else
      @music_album.each_with_index do |album, index|
        spotify = 'Unavailable'
        spotify = 'Available' if album.on_spotify
        puts "#{index}) publish date:- #{album.publish_date} spotify:- #{spotify}"
      end
    end
  end

  def list_genre
    if @genre.empty?
      puts 'Genre is empty.'
    else
      @genre.each_with_index do |genre, index|
        puts "#{index}) genre:- #{genre.name}"
      end
    end
  end

  def create_genre(name)
    genre = Genre.new(name)
    @genre << genre
    genre
  end

  def create_music_album(publish_date, spotify, genre)
    new_music_album = MusicAlbum.new(publish_date, on_spotify: spotify)
    new_music_album.genre = genre
    @music_album << new_music_album
    @music_album_store.store_music_album({
      publish_date: publish_date,
      on_spotify: spotify,
      genre: genre.name
      })
  end

  def add_genre
    puts 'Genre name:-'
    name = gets.chomp
    create_genre(name)
  end

  def add_music_album
    puts 'Publish date (yyyy-mm-dd):-'
    publish_date = gets.chomp
    puts 'Available on spotify (y/n):-'
    spotify = false
    spotify = true unless %w[n N no No].include?(gets.chomp)
    puts 'Select music album genre:-'
    puts '0) Create new genere.'
    @genre.each_with_index do |genre, index|
      puts "#{index + 1}) #{genre.name}"
    end
    option = gets.chomp.to_i
    genre = (option.zero? && add_genre) || @genre[option - 1]
    create_music_album(publish_date, spotify, genre)
    puts 'Music Album Created'
  end
end


