class Book < ApplicationRecord
  validates :title, :author, :publication_date, presence: :true
  validate :validate_publication_date

  private

  def validate_publication_date
    unless publication_date.present? && publication_date <= Date.today
      errors.add(:invalid_date, 'Date should be equal or before today')
    end
  end
end
