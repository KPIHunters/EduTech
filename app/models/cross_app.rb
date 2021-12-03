class CrossApp < ApplicationRecord
  # Dependencies
  acts_as_paranoid

  # Relations
  belongs_to :app
  belongs_to :course
  belongs_to :oauth_conf
end
