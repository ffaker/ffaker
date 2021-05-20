# frozen_string_literal: true

require_relative 'helper'

class TestGuid < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::Guid, :guid)

  def test_guid
    assert_match(/[A-F0-9]{8}-[A-F0-9]{4}-[A-F0-9]{4}-[A-F0-9]{4}-[A-F0-9]{12}/,
                 FFaker::Guid.guid)
  end
end
