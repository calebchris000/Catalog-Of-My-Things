require 'json'

require_relative 'game'
require_relative 'author'

class GameUI
  def initialize
    @game_file = 'game/game.json'
    @games = JSON.parse(File.read(@game_file)) || []
  end

  def list_games
    if @games.empty?
      puts 'There is no game.'
      puts "Please choose an option by entering a number!\n"
      return
    end
    @games.each do |item|
      puts "Publish date:#{item['Publish_date']}, Mutiplayer:#{item['Mutiplayer']}, Last played:#{item['Last_played']}"
    end
  end

  def list_authors
    if @games.empty?
      puts 'There is no author.'
      return
    end
    @games.each do |item|
      puts "Fist name: #{item['author']['first_name']}, Last name: #{item['author']['last_name']}"
    end
  end

  def add_game
    puts 'Publish date [YYYY-MM-DD]:'
    publish_date = gets.chomp
    puts 'Mutiplayer [Y/N]:'
    multiplayer = gets.chomp
    puts 'Last Played [YYYY-MM-DD]:'
    last_played_at = gets.chomp
    puts 'Author:'
    author = add_author
    game = Game.new(publish_date, multiplayer, last_played_at: last_played_at)
    game.author = author
    @games << game.to_h

    File.write(@game_file, JSON.generate(@games))
    @games = JSON.parse(File.read(@game_file))
    puts "Game created successfuly!\n\n"
    puts "Please choose an option by entering a number!\n"
  end

  def add_author
    puts 'First name:'
    first_name = gets.chomp
    puts 'Last name:'
    last_name = gets.chomp
    Author.new(first_name, last_name)
  end
end
