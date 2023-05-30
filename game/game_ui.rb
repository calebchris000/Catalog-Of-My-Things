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
        puts "Publish date: #{item['Publish_date']}, Mutiplayer: #{item['Mutiplayer']}, Last played: #{item['Last_played']}"
        end
    end
    def list_authors
        
        if @games.empty?
        puts 'There is no author.'
        return
        end
        @games.each do |item|
        puts "Fist name: #{item['first_name']}, Last name: #{item['last_name']}"
        end
    end

    def add_game
        puts 'Publish date:'
        publish_date = gets.chomp
        puts 'Mutiplayer [Y/N]:'
        multiplayer = gets.chomp
        puts 'Last Played:'
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
        author = Author.new(first_name, last_name)
        author
        # File.write('game.json', JSON.generate(@author))
        # puts "Author created successfuly!\n\n"
        # puts "Please choose an option by entering a number!\n"
    end

end

def main
    status = true
    m = GameUI.new
    while status
      option = gets.chomp
      case option.to_i
      when 1
        m.list_games
      when 2
        m.list_authors
      when 3
        m.add_game
      else
        status = false
      end
    end
  end

  main