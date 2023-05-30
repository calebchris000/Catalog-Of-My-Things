require_relative './book'
require 'json'
class BookUI
  def initialize
    @books = []
    @labels = []
    read_from_file
    puts "Welcome to the Book Section\n\n"
  end

  def start
    puts [
      "\n1. List Books",
      '2. List all Labels',
      '3. Create Book',
      '4. Exit App'
    ]
    @selection = gets.chomp.to_i

    select_options(@selection)
  end

  private

  def read_from_file
    @file_handler = FileHandler.new('book/book.json').read_file
    @parsed_data = JSON.parse(@file_handler)
    @books = @parsed_data
  end

  def select_options(option)
    @options = {
      1 => :list_books,
      2 => :list_labels,
      3 => :create_book,
      4 => :exit_app
    }
    execute = @options[option]
    send(execute)
  end

  def list_books
    puts "\n"
    if @books.empty?
      puts "There are no books... yet\n\n"
      start
    end
    @books.each_with_index do |book, idx|
      book.each { |key, value| print "#{idx + 1}. #{key}: #{value} " }
      puts "\n"
    end
    start
  end

  def list_labels
    return unless @labels.empty?

    puts 'There are no labels'
    start
  end

  def create_book
    print 'Publisher Name: '
    @publisher = gets.chomp
    print 'Cover State: '
    @cover_state = gets.chomp
    print 'Publish Date: '
    @publish_date = gets.chomp
    @book = Book.new(@publish_date, @publisher, @cover_state)
    @object = {
      'Publish-date' => @book.publish_date,
      'Publisher' => @book.publisher,
      'Cover-state' => @book.cover_state
    }

    @books << @object

    puts 'Book created successfully' unless @book.nil?
    start
  end

  def exit_app
    @file_handler = FileHandler.new('book/book.json')
    @file_handler.write_to_file(@books) unless @books.empty?
    puts "\nMake sure to visit soon :)\n\n"
    exit!
  end
end

class FileHandler
  def initialize(path)
    @path = path
  end

  def write_to_file(item)
    @item = item
    @generated_json = JSON.generate(@item)
    @file = File.open(@path, 'w')
    @file.write(@generated_json)
    @file.close
  end

  def read_file
    @file = File.read(@path)
    @file
  end
end
bookui = BookUI.new
bookui.start
