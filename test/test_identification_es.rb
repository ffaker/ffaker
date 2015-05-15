require 'helper'

class TestFakerIdentificationES < Minitest::Test
  def setup
    @tester = FFaker::IdentificationES
  end

  def test_gender
    assert_match /(Hombre|Mujer)/, @tester.gender
  end
end
