class Role < ApplicationRecord
  # Dependencies
  acts_as_paranoid

  # Validations
  validates :name, length: { minimum: 3, maximum: 25 }, presence: true
  validates :title, length: { minimum: 3, maximum: 55 }, presence: false
  validates :description, length: { minimum: 3, maximum: 250 }, presence: false
end
