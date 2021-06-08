class Experience < ApplicationRecord
  # Dependencies
  acts_as_paranoid

  # Relations
  has_many :profiles

  # Validations
  validates :name, length: { minimum: 4, maximum: 80 }, presence: true
end
