require_relative 'app'

class Input < App
  def initialize
    super()
    @app = App.new
  end

  def main
    books = []
    people = []
    rentals = []
    @selection = selection(books, people, rentals)
  end

  def main_menu
    puts 'Welcome to School library App!'
    puts 'Please choose an option by entering a number:
  1 - List all books
  2 - List all people
  3 - Create a person
  4 - Create a book
  5 - Create a rental
  6 - List all rentals for a given person id
  7 - Exit'
  end

  def selection(books, people, rentals)
    loop do
      main_menu
      selection = gets.chomp.to_i
      case selection
      when 1
        list_all_books(books)
      when 2
        list_all_people(people)
      when 3
        create_person(people)
      when 4
        create_book(books)
      when 5
        create_rental(books, people, rentals)
      when 6
        list_all_rentals_by_id(rentals)
      else puts 'Thank you for using this app'
           exit
      end
    end
  end
end
