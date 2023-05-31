require_relative 'book/book_ui'
require_relative 'music_album/music_album_ui'
require_relative 'game/game_ui'

class App
  def initialize
    @book = BookUI.new
    @music = MusicAlbumUI.new
    @game = GameUI.new
  end

  def list_books
    @book.list_books
  end
  def list_labels
    @book.list_labels
  end
  def list_music_albums
    @music.list_music_album
  end
  def list_genres
    @music.list_genre
  end
  def list_games
    @game.list_games
  end
  def list_authors
    @game.list_authors
  end
  def add_book
    @book.create_book
  end
  def add_music_album
    @music.add_music_album
  end
  def add_game
    @game.add_game
  end
end