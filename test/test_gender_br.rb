# encoding: utf-8

require 'helper'

class TestFakerGenderBR < Test::Unit::TestCase
  def setup
    @tester = FFaker::GenderBR
  end

  def test_random
    gender_regex = /\A(feminino|masculino)\z/
    assert_match(gender_regex, @tester.random)
  end
end
