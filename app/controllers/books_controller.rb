class BooksController < ApplicationController
  before_action :search_books, :set_books, :paginate_books

  def index
  end

  def read
    @books = @books.read
    render 'index'
  end
  
  def to_read
    @books = @books.to_read
    render 'index'
  end

  def not_interested
    @books = @books.not_interested
    render 'index'
  end

  def other
    @books = @books.other
    render 'index'
  end

  def update
    @book = Book.find(params[:id])
    @book.state = params[:state]
    @book.save

    respond_to do |format|
      format.html { redirect_to books_path, notice: "#{@book.title} updated" }
      format.js
    end
  end

  private

  def search_books
    @q = Book.search(params[:q])
  end

  def set_books
    @books = @q.result(distinct: true)
  end

  def paginate_books
    @books = @books.page(params[:page])
  end
end
