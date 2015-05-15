# encoding: utf-8

require 'helper'

class TestFakerJob < Minitest::Test
  def setup
    @tester = FFaker::Job
  end

  def test_title
    assert @tester.title.match(/(\w+\.? ?){2,3}/)
  end
end

