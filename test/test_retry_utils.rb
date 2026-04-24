# frozen_string_literal: true

require_relative 'helper'

class TestRetryUtils < Test::Unit::TestCase
  def test_returns_value_matching_condition
    retry_object = FFaker::RetryUtils.new(FFaker::Name, ->(str) { str.size > 2 }, 10_000)
    result = retry_object.first_name
    assert_operator result.size, :>, 2
  end

  def test_raises_error_when_retries_exceeded
    stubbed_generator = Object.new
    def stubbed_generator.test
      1
    end

    retry_object = FFaker::RetryUtils.new(stubbed_generator, ->(v) { v != 1 }, 3)

    assert_raises FFaker::RetryUtils::RetryLimitExceeded do
      retry_object.test
    end
  end

  def test_retry_until_method_on_module
    result = FFaker::Name.retry_until { |str| str.size > 2 }.first_name
    assert_operator result.size, :>, 2
  end

  def test_retry_until_raises_without_block
    assert_raises ArgumentError do
      FFaker::Name.retry_until
    end
  end

  def test_retry_until_accepts_limit_keyword
    result = FFaker::Name.retry_until(limit: 10_000) { |str| str.size > 2 }.first_name
    assert_operator result.size, :>, 2
  end

  def test_respond_to_delegates_to_generator
    retry_object = FFaker::RetryUtils.new(FFaker::Name, ->(_) { true }, 10_000)
    assert retry_object.respond_to?(:first_name)
    assert_false retry_object.respond_to?(:nonexistent_method)
  end
end
