class BooksController < ApplicationController
  def index
    @books = Book.order(:title)
  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def new
    # @count = Book.count()
    @book = Book.new()
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path, notice: "New book has been added to the collection!"
    else
      # the 'new' action A is not being called here
      # assign any instance variables needed
      render('new')
    end
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book), notice: "Book has been edited!"
    else
      render('edit')
    end
  end
  
  def delete
    @book = Book.find(params[:id])
  end

  # function for destroying a book from collection
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: "Book has been deleted from the collection!"
  end
  
  private
  
  def book_params
    params.required(:book).permit(
      :title,
      :author,
      :price,
      :published
    )
    end
end
