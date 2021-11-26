class Role < ApplicationRecord
  # Dependencies
  acts_as_paranoid

  # Validations
  validates :name, length: { minimum: 3, maximum: 25 }, presence: true
  validates :title, length: { minimum: 3, maximum: 55 }, presence: false
  validates :description, length: { minimum: 3, maximum: 250 }, presence: false

  # CONSTANTS
  ADMIN = 1
  PUBLISHER = 2
  BUYER = 3
  AFFILIATE = 4
end
