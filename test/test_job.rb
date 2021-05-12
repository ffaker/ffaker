# frozen_string_literal: true

require_relative 'helper'

class TestFakerJob < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::Job, :title)

  def setup
    @tester = FFaker::Job
  end

  def test_title
    assert_match(/\A(\w+\.? ?){2,3}\z/, @tester.title)
  end
end
