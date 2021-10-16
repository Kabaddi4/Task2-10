class BooksController < ApplicationController

  def index
    @books = Book.all #モデルから全て取得する為に複数形で宣言
    @book = Book.new #10/16 newアクションも兼用する事ができた。。。
  end

  def create
    @book = Book.new(book_params) #インスタンス変数で定義
    if @book.save #if文でsaveメソッドに成功した場合の処理を記述
      flash[:notice] = "successfully"
      redirect_to books_path  #indexに戻りたいならbooks_path showなら、book_path(@インスタンス,id)
    else
      @books = Book.all #indexを呼び出す為、必要はないが定義していないと nil class になる。
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
    @book = Book.find(params[:id]) #インスタンス変数でモデルの情報を取得
    if @book.update(book_params) #updateメソッドで更新
      flash[:alert] = "successfully"
      redirect_to books_path
    else
      render :edit
    end
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
