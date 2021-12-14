class App < ApplicationRecord
  # Constants
  # TODO change it
  GENERIC_INTRO_ID = 'v9p9trnQIL8'
  GENERIC_INTRO_URL = 'https://www.youtube.com/embed/v9p9trnQIL8'

  # Dependencies
  acts_as_paranoid

  # Relations
  belongs_to :user
  has_many :cross_apps
  has_many :oauth_configs, through: :cross_apps
end
