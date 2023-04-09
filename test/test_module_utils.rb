# frozen_string_literal: true

require_relative 'helper'

class TestModuleUtils < Test::Unit::TestCase
  def test_provides_a_k_method_for_generating_constant_arrays
    obj = Object.new
    obj.extend FFaker::ModuleUtils
    result = obj.k %w[1 2 3]

    assert result.frozen?
    result.each { |e| assert e.frozen? }
  end

  def test_unique
    generator = Object.new
    generator.extend FFaker::ModuleUtils
    # returns [1 1 2 2 1 1 2 2 ..][call_index]
    def generator.test
      index = Thread.current[:test_unique] ||= 0
      Thread.current[:test_unique] = (index > 2 ? 0 : index + 1)
      (index / 2) + 1
    end

    assert_equal(1, generator.unique.test)
    assert_equal(2, generator.unique.test)

    Thread.new do
      assert_equal(1, generator.unique.test)
      assert_equal(2, generator.unique.test)

      assert_raises FFaker::UniqueUtils::RetryLimitExceeded do
        generator.unique.test
      end

      generator.unique.clear
      generator.unique.test
    end.join

    assert_raises FFaker::UniqueUtils::RetryLimitExceeded do
      generator.unique.test
    end

    FFaker::UniqueUtils.clear
    generator.unique.test
  end
end
