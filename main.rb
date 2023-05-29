require_relative './classes/item'
require_relative './modules/options'
 
class Main
  include Options

  def initialize
    @item = Item.new
  end

    puts "Welcome to Catalog of my things\n\n"
    puts "Please choose an option by entering a number!\n"

  def run
    loop do
      options
    end
  end
end

main = Main.new
main.run