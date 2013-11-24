# encoding: UTF-8

require 'helper'

class TestFakerJobFr < Test::Unit::TestCase
  def setup
    @tester = Faker::JobFR
  end

  def test_title
    assert @tester.title.match(/(\w+\.? ?){2,3}/)
  end


  def test_prefix
    assert @tester::JOB_PREFIXES.is_a?(Array)
    assert @tester::JOB_ADJECTIVES.is_a?(Array)
    assert @tester::JOB_NOUNS.is_a?(Array)
  end
end


