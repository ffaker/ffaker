require 'helper'

class TestFakerNameTH < Minitest::Test
  def setup
    @tester = FFaker::NameTH
  end

  def test_last_name
    assert_includes @tester::LAST_NAMES, @tester.last_name
  end

  def test_first_name
    assert_includes @tester::FIRST_NAMES, @tester.first_name
  end

  def test_nick_name
    assert_includes @tester::NICK_NAMES, @tester.nick_name
  end

  def test_name
    first_name, last_name = @tester.name.split(' ')
    assert_includes @tester::FIRST_NAMES, first_name
    assert_includes @tester::LAST_NAMES, last_name
  end
end
