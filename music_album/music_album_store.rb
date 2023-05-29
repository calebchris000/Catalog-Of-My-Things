require 'json'

class MusicAlbumStore
  def initialize
    @music_album_file = "music_album/music_album.json"
  end

  def file_read(filename)
    file = File.read(filename)
    JSON.parse(file)
  end

  def file_write(filename, data)
    puts data
    File.write(filename, JSON.generate(data))
  end

  def store_music_album(music_album)
    #music_album = {publish_date, on_spotify, genre}
    music_albums = []
    music_albums = file_read(@music_album_file) if File.exist?(@music_album_file)
    music_albums << music_album
    file_write(@music_album_file, music_albums)
  end

 
end