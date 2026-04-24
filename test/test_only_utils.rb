# frozen_string_literal: true

require_relative 'helper'

class TestOnlyUtils < Test::Unit::TestCase
  def test_returns_value_matching_condition
    only_object = FFaker::OnlyUtils.new(FFaker::Name, ->(str) { str.size > 2 }, 10_000)
    result = only_object.first_name
    assert_operator result.size, :>, 2
  end

  def test_raises_error_when_retries_exceeded
    stubbed_generator = Object.new
    def stubbed_generator.test
      1
    end

    only_object = FFaker::OnlyUtils.new(stubbed_generator, ->(v) { v != 1 }, 3)

    assert_raises FFaker::OnlyUtils::RetryLimitExceeded do
      only_object.test
    end
  end

  def test_only_method_on_module
    result = FFaker::Name.only { |str| str.size > 2 }.first_name
    assert_operator result.size, :>, 2
  end

  def test_only_raises_without_block
    assert_raises ArgumentError do
      FFaker::Name.only
    end
  end

  def test_respond_to_delegates_to_generator
    only_object = FFaker::OnlyUtils.new(FFaker::Name, ->(_) { true }, 10_000)
    assert only_object.respond_to?(:first_name)
    assert_false only_object.respond_to?(:nonexistent_method)
  end
end
