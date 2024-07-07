# frozen_string_literal: true

require 'lennarb'

# Application class
#
class App < Lennarb::Application::Base
  get '/' do |_req, res|
    res.status = 200
    res.html('Hello, World!')
  end
end
