class Period < ApplicationRecord
  # Dependencies
  acts_as_paranoid

  # Relations
  belongs_to :course
  has_many :lessons

  # Validations
  validates :name, length: { minimum: 5, maximum: 70 }, presence: true
  validates :icon, length: { minimum: 5, maximum: 55 }, presence: false
  validates_presence_of :course
end
