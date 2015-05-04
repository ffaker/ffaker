# encoding: UTF-8

require 'helper'

class TestFakerJobCN < Test::Unit::TestCase
  def setup
    @tester = FFaker::JobCN
  end

  def test_title
    assert @tester.title.length >= 1
  end

  def test_nouns
    assert @tester::JOB_NOUNS.is_a?(Array)
  end
end
