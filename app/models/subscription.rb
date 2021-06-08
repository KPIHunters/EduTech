class Subscription < ApplicationRecord
  # Dependencies
  acts_as_paranoid

  # Relations
  belongs_to :user
  belongs_to :course

  # Validations
  validates_presence_of :user
  validates_presence_of :course
end
