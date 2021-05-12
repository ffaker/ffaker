# frozen_string_literal: true

require_relative 'helper'

class TestUniqueUtils < Test::Unit::TestCase
  def test_generates_unique_values
    unique_object = FFaker::UniqueUtils.new(FFaker::Name, 10_000)

    result = [unique_object.name, unique_object.name]
    assert_operator(result[0], :!=, result[1])
  end

  def test_returns_error_when_retries_exceeded
    stubbed_generator = Object.new
    def stubbed_generator.test
      1
    end

    unique_object = FFaker::UniqueUtils.new(stubbed_generator, 3)

    unique_object.test

    assert_raises FFaker::UniqueUtils::RetryLimitExceeded do
      unique_object.test
    end
  end

  def test_clears_unique_values
    stubbed_generator = Object.new
    def stubbed_generator.test
      1
    end

    unique_object = FFaker::UniqueUtils.new(stubbed_generator, 3)

    assert_equal(1, unique_object.test)

    assert_raises FFaker::UniqueUtils::RetryLimitExceeded do
      unique_object.test
    end

    FFaker::UniqueUtils.clear

    assert_equal(1, unique_object.test)

    assert_raises FFaker::UniqueUtils::RetryLimitExceeded do
      unique_object.test
    end

    unique_object.clear

    assert_equal(1, unique_object.test)
  end
end
