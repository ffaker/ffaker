# encoding: utf-8

require 'helper'

class TestGuid < Test::Unit::TestCase
  def test_guid
    assert_match /[A-F0-9]{8}-[A-F0-9]{4}-[A-F0-9]{4}-[A-F0-9]{4}-[A-F0-9]{12}/, Faker::Guid.guid
  end
end
