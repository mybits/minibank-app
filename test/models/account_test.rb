require 'test_helper'

class AccountTest < ActiveSupport::TestCase
	def setup
		@client = Client.create!(name: "Jan",
  													surname: "Kowal",
  													email: "jan@op.pl",
  													phone: "232-322-231")
  end

  test "init" do
  	a = @client.accounts.new
  end

  test "number" do
  	a = @client.accounts.create!
  	assert a.number.present?
  	assert a.number > 1
  end

  test "balance is zero" do
  	a = @client.accounts.create!
  	assert_equal 0, a.balance
	end

	test "balance validator" do
  	a = @client.accounts.create!
 		a.balance = "ala"
  	assert a.invalid?
	end

	test "balance validator" do
	  a = @client.accounts.create!
	  a.balance = "ala"
	  assert a.invalid?
	  assert a.errors[:balance].any?    
	  a.balance = 1000                 
	  assert a.valid?
	  assert a.errors[:balance].empty?
	end


end
