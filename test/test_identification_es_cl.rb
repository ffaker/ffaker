require 'test_helper'

class TestFakerIdentificationESCL < Minitest::Test
  def setup
    @tester = FFaker::IdentificationESCL
  end

  def test_rut
    assert_match /\b\d{7,8}\-[k|0-9]/i, @tester.rut
  end
end
