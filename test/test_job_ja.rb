# encoding: UTF-8

require 'helper'

class TestFakerJobJA < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::JobJA, :title)

  def setup
    @tester = FFaker::JobJA
  end

  def test_title
    assert @tester.title.length >= 1
  end

  def test_nouns
    assert_kind_of Array, @tester::JOB_NOUNS
  end
end
