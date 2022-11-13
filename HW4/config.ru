require 'rack'
require './program'

use Rack::Reloader, 0
use Rack::Auth::Basic { |username, password| username == 'serdytyi' && password == '1234567809' }

run Program.new