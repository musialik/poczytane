class BooksController < ApplicationController
  def index
    # @books = Book.page params[:page]
    @q = Book.search(params[:q])
    @books = @q.result(distinct: true)
    @books = @books.page(params[:page])
  end
end
