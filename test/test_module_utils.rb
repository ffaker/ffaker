require 'helper'

class TestModuleUtils < Test::Unit::TestCase
  it "provides a k method for generating constant arrays" do
    obj = Object.new
    obj.extend Faker::ModuleUtils
    result = obj.k ["1","2","3"]

    assert result.frozen?
    result.each {|e| assert e.frozen? }
  end
end
