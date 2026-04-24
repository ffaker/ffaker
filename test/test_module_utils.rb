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

  def test_luhn_check
    obj = Object.new
    obj.extend FFaker::ModuleUtils
    assert obj.luhn_check('97248708') == '6'
    assert obj.luhn_check('1789372997') == '4'
    assert obj.luhn_check('8899982700037') == '1'
    assert obj.luhn_check('1234567820001') == '0'
  end

  # Regression test for https://github.com/ffaker/ffaker/issues/550
  #
  # When Rails/Zeitwerk bypasses Ruby's built-in autoload mechanism,
  # const_missing is called directly on the FFaker module with the name of a
  # sub-module (e.g. :UUID, :AWS, :SSN). The sub-module names are all-uppercase
  # so they pass the /[a-z]/ guard and fall into the data-file loading branch,
  # which tries to open a non-existent path and raises Errno::ENOENT.
  # const_missing should call super for unknown constants so that Ruby raises
  # the standard NameError instead.
  def test_const_missing_raises_name_error_for_unknown_all_caps_constants
    assert_raises(NameError) { FFaker.const_missing(:UNKNOWN_CONSTANT) }
  end

  def test_const_missing_does_not_raise_enoent_for_submodule_names
    # UUID, AWS, SSN, HTML are registered sub-modules via autoload.
    # Simulating Zeitwerk calling const_missing before autoload fires must not
    # result in Errno::ENOENT.
    %i[UUID AWS SSN HTML].each do |name|
      assert_raises(NameError) { FFaker.const_missing(name) }
    end
  end
end
