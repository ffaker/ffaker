# encoding: utf-8

require 'helper'

class TestFakerJob < Test::Unit::TestCase
  def setup
    @tester = FFaker::Job
  end

  def test_title
    assert_match(/\A(\w+\.? ?){2,3}\z/, @tester.title)
  end
end
