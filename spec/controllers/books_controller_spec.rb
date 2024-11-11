require "rails_helper"

RSpec.describe BooksController, type: :controller do

  let(:params) {
    {
      title: 'Book title',
      author: 'Book author',
      publication_year: '1999'
    }
  }

  describe '#create' do
    context 'when parameters are correct' do
      it 'creates a book' do
        post :create, params: params
        expect(response).to have_http_status(:created)
      end
    end

    context 'when title is missing' do
      it 'creates do not create a book' do
        post :create, params: params.delete(:title)
        expect(response).to have_http_status(:created)
      end
    end

    context 'when author is missing' do
      it 'creates do not create a book' do
        post :create, params: params.delete(:author)
        expect(response).to have_http_status(:created)
      end
    end

    context 'when publication year is missing' do
      it 'creates do not create a book' do
        post :create, params: params.delete(:publication_year)
        expect(response).to have_http_status(:created)
      end
    end
  end

  describe '#create' do
    it 'expect to create  book' do
      post :create, params: {}
      expect(response.body)
    end
  end

  describe '#create' do
  end

  describe '#create' do
  end

  describe '#delete' do
    it 'expect to delete the book' do
      post :delete, params: {}
      expect(response.body)
    end
  end
end
