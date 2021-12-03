class App < ApplicationRecord
  # Constants
  GENERIC_INTRO = 'https://www.youtube.com/embed/v9p9trnQIL8'

  # Dependencies
  acts_as_paranoid

  # Relations
  belongs_to :user
  has_many :cross_apps
  has_many :oauth_configs, through: :cross_apps
end
