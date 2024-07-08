class Primary
  def self.connection
    @connection ||= Sequel.connect("sqlite://db/primary.db")
  end
end

puts Primary.connection

