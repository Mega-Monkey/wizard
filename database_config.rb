require 'active_record'

options = {
  adapter: 'postgresql',
  database: 'wizard'
}

ActiveRecord::Base.establish_connection( ENV['DATABASE_URL'] || options)