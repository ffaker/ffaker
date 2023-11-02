# frozen_string_literal: true

require_relative 'helper'

class TestGuid < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::Guid, :guid)

  def test_guid
    assert_match(/\A[0-9A-F]{8}-[0-9A-F]{4}-4[0-9A-F]{3}-[89AB][0-9A-F]{3}-[0-9A-F]{12}\z/,
                 FFaker::Guid.guid)
  end
end
