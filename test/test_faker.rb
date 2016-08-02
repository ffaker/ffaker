# encoding: utf-8

require 'helper'

class TestFaker < Test::Unit::TestCase
  include DeterministicHelper

  def test_numerify
    assert FFaker.numerify('###').match(/\d{3}/)
    assert_deterministic { FFaker.numerify('###') }
  end

  def test_numerify_with_array
    assert FFaker.numerify(['###', '###']).match(/\d{3}/)
    assert_deterministic { FFaker.numerify(['###', '###']) }
  end

  def test_letterify
    assert FFaker.letterify('???').match(/[a-z]{3}/)
    assert_deterministic { FFaker.letterify('???') }
  end

  def test_letterify_with_array
    assert FFaker.letterify(['???', '???']).match(/[a-z]{3}/)
    assert_deterministic { FFaker.letterify(['???', '???']) }
  end

  def test_bothify
    assert FFaker.bothify('???###').match(/[a-z]{3}\d{3}/)
    assert_deterministic { FFaker.bothify('???###') }
  end

  def test_bothify_with_array
    assert FFaker.bothify(['???###', '???###']).match(/[a-z]{3}\d{3}/)
    assert_deterministic { FFaker.bothify(['???###', '???###']) }
  end
end
