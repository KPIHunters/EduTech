class OAuthConfig < ApplicationRecord
  # Dependencies
  acts_as_paranoid

  # Relations
  has_many :cross_apps
  has_many :apps, through: :cross_apps
end
