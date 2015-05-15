require 'helper'

class TestFakerJobJA < Minitest::Test
  def setup
    @tester = FFaker::JobJA
  end

  def test_title
    assert @tester.title.length >= 1
  end

  def test_nouns
    assert @tester::JOB_NOUNS.is_a?(Array)
  end
end
