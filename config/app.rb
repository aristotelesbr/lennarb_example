# frozen_string_literal: true

require 'lennarb'


class App < Lennarb::Application::Base
  get '/' do |_req, res|
    res.status = 200
    res.html 'Hello, World!'
  end

  post '/' do |req, res|
    res.status = 200
    res.json req.body
  end
end
