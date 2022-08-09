require_relative 'input'
require 'json'

class SaveData < Input
  def initialize
    super()
    load_data
  end

  def load_data
    if File.empty?('books.json')
      puts 'List is empty'
    else
        books = JSON.parse(File.read('books.json'))
        books.each do |book|
            @books.push(Book.new['Title'], book['Author'])
        end
    end

    File.write('books.json', JSON.generate(books))
end
