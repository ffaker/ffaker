require 'helper'

class TestFakerJobKR < Minitest::Test
  def setup
    @tester = FFaker::JobKR
  end

  def test_title
    assert @tester.title.length >= 1
  end

  def test_nouns
    assert_kind_of Array, @tester::JOB_NOUNS
  end
end
