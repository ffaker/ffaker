require 'helper'

class TestGuid < Minitest::Test
  def test_guid
    assert_match /[A-F0-9]{8}-[A-F0-9]{4}-[A-F0-9]{4}-[A-F0-9]{4}-[A-F0-9]{12}/, FFaker::Guid.guid
  end
end
