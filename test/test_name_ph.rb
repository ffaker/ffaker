require 'helper'

class TestFakerNamePH < Minitest::Test
  def setup
    @tester = FFaker::NamePH
  end

  def test_name
    assert @tester.name.match(/(\w+\.? ?){2,3}/)
  end

  def test_prefix
    assert @tester.prefix.match(/[A-Z][a-z]+\.?/)
  end
end
