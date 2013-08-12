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

  test "to_s" do
  	c = Client.create(name: "Jan",
  										surname: "Kowal",
  										email: "jan@op.pl",
  										phone: "232-322-231")
  	assert_match /Jan Kowal \(\d+\)/, c.to_s 
  end
end
