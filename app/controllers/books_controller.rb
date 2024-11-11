class BooksController < ApplicationController

  before_action :validate_book_params, only: :create

  # def index
  #   @ = .all
  # end

  # def show
  #   @ = Book.find()
  # end

  def create
    @book = Book.new(title: params[:title], author: params[:author], publication_year: params[:publication_year])
    if @book.save
      flash[:success] = "Book successfully created"
      redirect_to @book, status: 201
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  # def def update
  #   @book = Book.find(params[:id])
  #     if @book.update_attributes(params[:book])
  #       flash[:success] = "Book was successfully updated"
  #       redirect_to @book
  #     else
  #       flash[:error] = "Something went wrong"
  #       render 'edit'
  #     end
  # end


  # def destroy
  #   @book = Book.find(params[:id])
  #   if @book.destroy
  #     flash[:success] = 'Book was successfully deleted.'
  #     redirect_to books_url
  #   else
  #     flash[:error] = 'Something went wrong'
  #     redirect_to books_url
  #   end
  # end

  private

  def validate_book_params
    params.require([:title, :author, :publication_year])
  end
end