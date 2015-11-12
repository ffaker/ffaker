require 'test_helper'

class TestFakerIdentificationKr < Minitest::Test
  def setup
    @tester = FFaker::IdentificationKr
  end

  def test_rrn
    assert_match(/\A\d{6}-\d{7}\z/, @tester.rrn)
  end
end
