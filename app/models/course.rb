class Course < ApplicationRecord
  # Dependencies
  acts_as_paranoid

  # Relations
  has_many :periods
  # has_many :lessons, through: :periods
  # has_and_belongs_to_many :users

  # Validations
  validates :name, length: { minimum: 3, maximum: 70 }, presence: true
  validates :description, length: { minimum: 40, maximum: 250 }, presence: false
end
