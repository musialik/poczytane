class BooksController < ApplicationController
  def index
    @books = Book.limit(8)
  end
end
