# encoding: utf-8

require 'helper'

class TestFakerGenderKR < Test::Unit::TestCase
  def setup
    @tester = Faker::GenderKR
  end

  def test_random
    gender_regex = /\A[남녀]\z/
    assert_match gender_regex, @tester.random
  end

  def test_sample
    gender_regex = /\A[남녀]\z/
    assert_match gender_regex, @tester.sample
  end

  def test_maybe
    gender_regex = /\A[남녀]\z/
    assert_match gender_regex, @tester.maybe
  end
end
