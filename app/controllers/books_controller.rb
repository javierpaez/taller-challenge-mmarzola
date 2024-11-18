class BooksController < ApplicationController

  # def index
  #   TODO
  # end

  # def show
  #   TODO
  # end

  def create
    @book = Book.new(book_params)
    if @book.save
      render json: { message: "Book successfully created" }, status: 201
    else
      render json: { message: "Something went wrong" }, status: 400
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book&.update(book_params)
      render json: { message: "Book successfully updated" }, status: 202
    else
      render json: { message: "Something went wrong" }, status: 400
    end
  end


  def destroy
    @book = Book.find(params[:id])
    if @book&.destroy
      render json: { message: "Book successfully deleted" }, status: 202
    else
      render json: { message: "Something went wrong" }, status: 400
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :publication_year)
  end
end