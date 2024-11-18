require "rails_helper"

RSpec.describe BooksController, type: :controller do

  let(:params) do
    {
      book: {
        title: 'Book title',
        author: 'Book author',
        publication_date: Time.new
      }
    }
  end

  describe '#create' do
    context 'when parameters are correct' do
      it 'creates a book' do
        post :create, params: params
        expect(response).to have_http_status(:created)
      end
    end

    context 'when title is missing' do
      before { params[:book][:title] = nil }

      it 'creates do not create a book' do
        post :create, params: params
        expect(response).to have_http_status(:bad_request)
      end
    end

    context 'when author is missing' do
      before { params[:book][:author] = nil }

      it 'creates do not create a book' do
        post :create, params: params
        expect(response).to have_http_status(:bad_request)
      end
    end

    context 'when publication date is missing' do
      before { params[:book][:publication_date] = nil }

      it 'creates do not create a book' do
        post :create, params: params
        expect(response).to have_http_status(:bad_request)
      end
    end

    context 'when publication date is in the future' do
      before { params[:book][:publication_date] = Date.tomorrow.end_of_day }

      it 'creates do not create a book' do
        post :create, params: params
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe '#update' do
    before { Book.create(params[:book]) }

    it 'expect to update the book' do
      put :update, params: { id: 1, book: {title: 'New title'} }
      expect(response).to have_http_status(:accepted)
    end
  end

  describe '#destroy' do
    before { Book.create(params[:book]) }

    it 'expect to destroy the book' do
      post :destroy, params: { id: 1 }
      expect(response).to have_http_status(:accepted)
    end
  end

  describe '#index' do
    let(:book_older) do
      {
        title: 'Book Older',
        author: 'Book author',
        publication_date: Date.yesterday
      }
    end
    let(:book_higher_rating) do
      {
        title: 'Book Higher Rating',
        author: 'Book author',
        publication_date: Time.new,
        rating: 1
      }
    end

    before do
      Book.create(params[:book])
      Book.create(book_older)
      Book.create(book_higher_rating)
    end

    it 'should list books by higher rating and sonnest publication date' do
      get :index
      response_body = JSON.parse(response.body)
      expect(response_body['books'].first['rating']).to eql(book_higher_rating[:rating])
      expect(response_body['books'].third['title']).to eql(book_older[:title])
    end
  end

  describe '#show' do
    context 'when book exists' do
      before { Book.create(params[:book]) }

      it 'return book details' do
        get :show, params: { id: 1 }
        expect(JSON.parse(response.body)['book']['title']).to eql(params[:book][:title])
      end
    end
  end
end
