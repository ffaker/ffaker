require 'helper'

class TestFakerNameJA < Minitest::Test
  def setup
    @tester = FFaker::NameJA
  end

  def test_name
    assert FFaker::NameJA.name.length >= 2
  end
end
