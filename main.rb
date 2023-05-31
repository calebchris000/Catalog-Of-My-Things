require_relative 'app'
require_relative 'modules/options'
 
class Main
  include Options
  def initialize
    @app = App.new
  end

  def greeting
    puts "\nPlease choose an option by entering a number! \n"
    options
  end
    
  def run
    status = true
    puts "Welcome to Catalog of my things :)\n\n"
    while status do
      greeting
      option = gets.chomp
      if  option_methods.key?(option)
        @app.send(option_methods[option])
      elsif option.to_i == 0
        status = false
        puts "\nMake sure to visit soon :)\n"
      else
        puts "Invalid option"
      end
    end
  end
end

main = Main.new
main.run