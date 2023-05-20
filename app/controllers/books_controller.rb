class BooksController < ApplicationController
  
  def create
    @book = Book.new(book_params)
     @books = Book.all
    if @book.save
      flash[:notice]="Book was successfully created."
      redirect_to book_path(@book.id)
    else
      render:index
    end
    
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy 
    flash[:notice] ="Book was successfully destroyed."
    redirect_to '/books'
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
     @book = Book.find(params[:id])
  end

  def edit
     @book = Book.find(params[:id])
  end 
  
  def update
    @book = Book.find(params[:id])
   if @book.update(book_params)
    flash[:notice] ="Book was successfully updated."
    redirect_to book_path(@book.id)  
     else
      render:edit
    end
  end
  
   private
   
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
