class Book < ApplicationRecord
  validates :title, :author, :publication_year, presence: :true
end
