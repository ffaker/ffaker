# encoding: utf-8

require 'helper'

class TestModuleUtils < Minitest::Test
  def test_provides_a_k_method_for_generating_constant_arrays
    obj = Object.new
    obj.extend FFaker::ModuleUtils
    result = obj.k ["1","2","3"]

    assert result.frozen?
    result.each {|e| assert e.frozen? }
  end
end
