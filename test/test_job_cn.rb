# encoding: UTF-8

require 'helper'

class TestFakerJobCN < Minitest::Test
  def setup
    @tester = FFaker::JobCN
  end

  def test_title
    assert @tester.title.length >= 1
  end

  def test_nouns
    assert_kind_of Array, @tester::JOB_NOUNS
  end
end
