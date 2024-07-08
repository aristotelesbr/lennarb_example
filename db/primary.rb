# frozen_string_literal: true

class Primary
  def self.connection
    @connection ||= Sequel.connect("sqlite://db/primary.db")
  end
end
