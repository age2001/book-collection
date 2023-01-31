class BooksController < ApplicationController
  def index
    @books = Book.order(:position)
  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def new
    @count = Book.count()
    @book = Book.new(position: @count + 1)
  end
  
  def create
    @task = Book.new(task_params)
    if @book.save
      redirect_to books_path
    else
      # the 'new' action A is not being called here
      # assign any instance variables needed
      # @count = Task.count 
      render('new')
    end
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
  
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render('edit')
    end
  end
  
  def delete
    @book = Book.find(params[:id])
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
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
