# encoding: UTF-8

require 'helper'

class TestFakerJobJA < Test::Unit::TestCase
  def setup
    @tester = Faker::JobJA
  end

  def test_title
    assert @tester.title.length >= 1
  end

  def test_nouns
    assert @tester::JOB_NOUNS.is_a?(Array)
  end
end
