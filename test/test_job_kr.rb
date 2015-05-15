require 'helper'

class TestFakerJobKR < Minitest::Test
  def setup
    @tester = FFaker::JobKR
  end

  def test_title
    assert @tester.title.length >= 1
  end

  def test_nouns
    assert @tester::JOB_NOUNS.is_a?(Array)
  end
end
