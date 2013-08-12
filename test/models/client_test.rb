require 'test_helper'

class ClientTest < ActiveSupport::TestCase

  test "validate" do 
  	c = Client.new
  	assert c.invalid?
  end

  test "name surname presence" do
  	c = Client.new
  	c.valid?
  	assert c.errors[:name].any?
  	assert c.errors[:surname].any?
  	c.name = "Jan"
  	c.surname = "Kowalski"
  	c.valid?
  	assert c.errors[:name].empty?
  	assert c.errors[:surname].empty?
  end
end
