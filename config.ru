load '.\lib\my_app.rb'
load '.\lib\time_logger_middleware.rb'
load '.\lib\my_auth_middleware.rb'

require 'pry'
require 'pry-byebug'

use TimeLoggarMidleware
use MyAuthMiddleware

run MyApp.new