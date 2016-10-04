# encoding: utf-8

require 'helper'

class TestNato < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::NatoAlphabet,
    :code, :alphabetic_code, :numeric_code, :callsign
  )

  def setup
    @tester = FFaker::NatoAlphabet
  end

  def test_code
    assert FFaker::NatoAlphabet::CODES.include?(@tester.code)
  end

  def test_letter_code
    assert FFaker::NatoAlphabet::ALPHABET_CODES.include?(@tester.alphabetic_code)
  end

  def test_numerify_code
    assert FFaker::NatoAlphabet::NUMERIC_CODES.include?(@tester.numeric_code)
  end

  def test_callsign
    assert_match(/[A-Z]+-[A-Z]+-[A-Z]+/, @tester.callsign)
  end

  def test_codify
    assert_match(/[A-Z]+-[A-Z]+-[A-Z]+/, @tester.codify('?-?-?'))
    assert_match(/[A-Z]+-[A-Z]+-[A-Z]+/, @tester.codify('?-#-?'))
    assert_match(FFaker::NatoAlphabet::STOP_CODE, @tester.codify('.'))

    assert_deterministic { @tester.codify('?-?-?') }
    assert_deterministic { @tester.codify('?-#-?') }
    assert_deterministic { @tester.codify('.') }
  end
end
