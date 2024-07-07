# frozen_string_literal: true

require_relative 'config/app'


# This is the main entry point for the application.
# It is a rack application, and is used to start the server.
run App.run!
