# frozen_string_literal: true

require_relative 'helper'

class TestUUID < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::UUID,
    :uuidv4, :uuidv6, :uuidv7, :uuidv8
  )

  def setup
    @tester = FFaker::UUID
  end

  # @see https://stackoverflow.com/a/38191104
  def test_uuidv4
    raw_uuid = @tester.uuidv4
    uuid = uuid_to_integer(raw_uuid)
    assert_version(uuid, 0b0100)
    assert_variant(uuid, 0b10)
  end

  def test_uuidv6
    raw_uuid = @tester.uuidv6
    uuid = uuid_to_integer(raw_uuid)
    assert_version(uuid, 0b0110)
    assert_variant(uuid, 0b10)
  end

  def test_uuidv7
    raw_uuid = @tester.uuidv7
    uuid = uuid_to_integer(raw_uuid)
    assert_version(uuid, 0b0111)
    assert_variant(uuid, 0b10)
  end

  def test_uuidv8
    raw_uuid = @tester.uuidv8
    uuid = uuid_to_integer(raw_uuid)
    assert_version(uuid, 0b1000)
    assert_variant(uuid, 0b10)
  end

  private

  def assert_version(uuid, version)
    assert_equal(version, (uuid >> 76) & 0b1111)
  end

  def assert_variant(uuid, variant)
    assert_equal(variant, (uuid >> 62) & 0b11)
  end

  def uuid_to_integer(uuid)
    uuid.delete('-').to_i(16)
  end
end
