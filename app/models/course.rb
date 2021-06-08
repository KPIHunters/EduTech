class Course < ApplicationRecord
  # Dependencies
  acts_as_paranoid

  # Relations
  has_many :periods
  # has_many :lessons, through: :periods

  # Validations
  validates :name, length: { minimum: 3, maximum: 70 }, presence: true
  validates :description, length: { minimum: 40, maximum: 250 }, presence: false
end
