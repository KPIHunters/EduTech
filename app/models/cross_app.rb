class CrossApp < ApplicationRecord
  belongs_to :app
  belongs_to :course
  belongs_to :oauth_conf
end
