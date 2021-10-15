class BooksController < ApplicationController

  def index
    @books = Book.all #モデルから全て取得する為に複数形で宣言
        #10/15 ここで、インスタンス@book　を違和感なく実装すれば解決？それをしない限り一生 no method error()とか突っつかれる、
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params) #インスタンス変数で定義
    if @book.save #if文でsaveメソッドに成功した場合の処理を記述
      redirect_to book_path(@book.id)  #indexに戻りたいならbooks_path showなら、book_path(@インスタンス,id)
    else
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end


  def edit
    @book = Book.find(params[:id]) #findメソッドでインスタンス変数にデータを格納
  end

  def update
    @book = Book.find(params[:id]) #ビューを介さない為ローカル変数で取得
    @book.update(book_params) #updateメソッドで更新
    redirect_to books_path
  end

  def destroy
    book = Book.find(params[:id]) #ビューを介さない為ローカル変数で取得
    book.destroy #destroyメソッドで削除
    redirect_to books_path
  end

  private
  #ストロングパラメーター
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
