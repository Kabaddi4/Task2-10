class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params) #ビューへ経由する必要がない為、ローカル変数で定義。
    book.save #ローカル変数をsaveメソッドで保存
    redirect_to '/books'
  end


  def update

  end

  def destroy

  end
  private
  #ストロングパラメーター
  def book_params
    params.permit(:title, :body)
  end
end
