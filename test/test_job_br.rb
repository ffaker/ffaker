# encoding: UTF-8

require 'helper'

class TestFakerJobBR < Test::Unit::TestCase
  def setup
    @tester = FFaker::JobBR
  end

  def test_title
    assert_includes @tester::JOB_NOUNS, @tester.title
  end
end
