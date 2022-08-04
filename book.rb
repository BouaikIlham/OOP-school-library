require './rental'
class Book
  attr_reader :rentals
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []  
  end

  def add_rentals(person, date)
    Rental.new(date, person, self)
  end
end
