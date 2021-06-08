class TermsController < ApplicationController
  layout 'blank'

  def index
  end

  def policy
  end

  def login_not_required
    true
  end
end