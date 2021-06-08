class Lesson < ApplicationRecord
  # Dependencies
  acts_as_paranoid

  # Relations
  belongs_to :period

  # Validations
  validates :icon, length: { minimum: 5, maximum: 55 }, presence: false
  validates :name, length: { minimum: 5, maximum: 70 }, presence: true
  validates :video_id, length: { minimum: 5, maximum: 70 }, presence: true, on: :update
  validates_presence_of :period
end
