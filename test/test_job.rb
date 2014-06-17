# encoding: utf-8

require 'helper'

class TestFakerJob < Test::Unit::TestCase
  def setup
    @tester = Faker::Job
  end

  def test_title
    assert @tester.title.match(/(\w+\.? ?){2,3}/)
  end
end

