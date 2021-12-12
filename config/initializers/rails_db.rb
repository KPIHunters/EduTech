unless Rails.env.production?
  RailsDb.setup do |config|
    # RailsDB
    config.verify_access_proc = proc { |controller| controller.current_user.admin? }
  end
end