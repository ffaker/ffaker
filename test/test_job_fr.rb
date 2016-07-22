# encoding: UTF-8

require 'helper'

class TestFakerJobFr < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::JobFR, :title)

  def setup
    @tester = FFaker::JobFR
  end

  def test_title
    assert_match(/\A([a-zàâçéèêëîïôûùüÿñæœ]+\.? ?){2,}\z/, @tester.title)
  end

  def test_prefix
    assert_kind_of Array, @tester::JOB_PREFIXES
    assert_kind_of Array, @tester::JOB_ADJECTIVES
    assert_kind_of Array, @tester::JOB_NOUNS
  end
end
