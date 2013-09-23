# Library creates initializes shelves and book array.
class Library

  def initialize()
    @shelves = []
      end

  def add_shelf(shelf)
    @shelves << shelf
  end

  def get_shelves
    @shelves
  end

  def display_all_books    
    if $all_books.empty?
      puts "There is no books in the library"
    else
      puts $all_books
    end
  end

end

class Shelf < Library
  attr_accessor :add_book_to_shelf, :remove_book_from_shelf

  def initialize(shelf_number)
    @num = shelf_number
    @books = []
    $shelf_count += 1
  end

  def get_books
    puts "Books contained on shelf [" + self.get_shelf_number.to_s + "]: " + $all_books.to_s + ""
    @books.each { |a| puts a }
  end

  def get_shelf_number
    @num
  end

  def add_book_to_shelf(book)
    @books << book
  end

  def remove_book_from_shelf()
   @books.pop()
  end
end

class Book < Shelf
  attr_accessor :get_book_title, :get_book_count

  def initialize(title)
    @book_title = title
    $all_books = []
    $all_books << title
    
  end

  def get_book_title
    @book_title
  end

  def enshelf(shelf)
    shelf.add_book_to_shelf(self) 
  end

  def unshelf(shelf)
    shelf.remove_book_from_shelf() 
  end
  $book_count = 0
  $shelf_count = 0
end


$lib = Library.new() # Creating library
s1 = Shelf.new(1) # Create shelf 1
b1 = Book.new("The Ruby Chronicles") # Create new book
s1.get_books
$lib.display_all_books




