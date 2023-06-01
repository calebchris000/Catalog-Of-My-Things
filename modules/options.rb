module Options
  def options
    puts '1 - List all books'
    puts '2 - List all labels (e.g. Gift, New)'
    puts '3 - List all music albums'
    puts '4 - List all genres (e.g Comedy, Thriller)'
    puts '5 - List of games'
    puts '6 - List all authors (e.g. Stephen King)'
    puts '7 - Add a book'
    puts '8 - Add a music album'
    puts '9 - Add a game'
    puts '0 - Exit'
  end

  def option_methods
    {
      '1' => 'list_books',
      '2' => 'list_labels',
      '3' => 'list_music_albums',
      '4' => 'list_genres',
      '5' => 'list_games',
      '6' => 'list_authors',
      '7' => 'add_book',
      '8' => 'add_music_album',
      '9' => 'add_game'
    }
  end
end
