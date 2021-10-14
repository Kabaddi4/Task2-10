class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params) #インスタンス変数で定義
    if @book.save #if文でsaveメソッドに成功した場合の処理を記述
      redirect_to book_path
    else
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end


  def edit
    @book = Book.find(params[:id]) #findメソッドでインスタンス変数にデータを格納
  end

  def update
    book = Book.find(params[:id]) #ビューを介さない為ローカル変数で取得
    book.update(book_params) #updateメソッドで更新
    redirect_to books_path(book.id)

  end

  def destroy
    book = Book.find(params[:id]) #ビューを介さない為ローカル変数で取得
    book.destroy #destroyメソッドで削除
    redirect_to books_path

  end
  private
  #ストロングパラメーター
  def book_params
    params.permit(:title, :body)
  end
end
