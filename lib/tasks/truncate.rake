require 'colorize'

# All production tasks & tasks which can't be on the Prod
namespace :db do
  desc 'Recreate the DB structure & populate it'
  task :truncate => :environment do
    puts 'Truncating tables'.colorize(:yellow)
    tables = %w( periods lessons )
    tables.each { |t| ActiveRecord::Base.connection.execute("TRUNCATE #{t} RESTART IDENTITY CASCADE") }
    puts 'Truncated tables'.colorize(:light_blue)
  end
end