# encoding: utf-8

require 'helper'

class TestModuleUtils < Test::Unit::TestCase
  def test_provides_a_k_method_for_generating_constant_arrays
    obj = Object.new
    obj.extend Faker::ModuleUtils
    result = obj.k ["1","2","3"]

    assert result.frozen?
    result.each {|e| assert e.frozen? }
  end
end
