# Library creates initializes shelves and book array.

# Use object-oriented Ruby to model a public library (w/ three classes: Library, Shelf, & Book).
# The library should be aware of a number of shelves. Each shelf should know what books it contains.
# Make the book object have "enshelf" and "unshelf" methods that control what shelf the book is sitting on.
# The library should have a method to report all books it contains.
# Note: this should *not* be a Rails app - just a single file with three classes (plus commands at the bottom showing it works) is all that is needed.

class Library
  attr_reader :shelves

  def initialize()
    @shelves = []
  end

  def add_shelf(shelf)
    @shelves << shelf
  end

  def display_all_books
    if all_books.empty?
      puts "There is no books in the library"
    else
      puts all_book_titles
    end
  end

  private

  def all_book_titles
    all_books.collect(&:title)
  end

  def all_books
    @shelves.collect(&:books).flatten
  end
end

class Shelf
  attr_reader :books

  def initialize
    @books = []
  end

  def add_book_to_shelf(book)
    @books << book
  end

  def remove_book_from_shelf()
    @books.pop()
  end
end

class Book < Shelf
  attr_accessor :title

  def initialize(title)
    @title = title
  end

  def get_book_title
    @title
  end

  def enshelf(shelf)
    shelf.add_book_to_shelf(self)
      
  end

  def unshelf(shelf)
    shelf.remove_book_from_shelf()
  end
end

library   = Library.new() # Creating library
shelf     = Shelf.new
book_1    = Book.new("The Ruby Chronicles") # Create new book
book_1.enshelf(shelf)
shelf.books
library.add_shelf shelf
library.display_all_books
