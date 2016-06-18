ENV["RACK_ENV"] ||= "development"

require "sinatra/base"
require "sinatra/flash"

require_relative "data_mapper_setup"

require_relative "server"
require_relative "controllers/users"
require_relative "controllers/sessions"

class Chitter < Sinatra::Base
  run! if app_file == $0
end
