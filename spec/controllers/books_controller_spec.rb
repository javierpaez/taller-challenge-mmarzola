require "rails_helper"

RSpec.describe BooksController, type: :controller do

  let(:params) do
    {
      book: {
        title: 'Book title',
        author: 'Book author',
        publication_year: '1999'
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

    context 'when publication year is missing' do
      before { params[:book][:publication_year] = nil }

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
end
