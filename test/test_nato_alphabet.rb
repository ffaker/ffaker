# encoding: utf-8

require 'helper'

class TestNato < Test::Unit::TestCase
  def setup
    @tester = Faker::NatoAlphabet
  end

  def test_code
    assert Faker::NatoAlphabet::CODES.include?(@tester.code)
  end

  def test_letter_code
    assert Faker::NatoAlphabet::ALPHABET_CODES.include?(@tester.alphabetic_code)
  end

  def test_numerify_code
    assert Faker::NatoAlphabet::NUMERIC_CODES.include?(@tester.numeric_code)
  end

  def test_callsign
    assert_match /[A-Z]+-[A-Z]+-[A-Z]+/, @tester.callsign
  end

  def test_codify
    assert_match /[A-Z]+-[A-Z]+-[A-Z]+/, @tester.codify("?-?-?")
    assert_match /[A-Z]+-[A-Z]+-[A-Z]+/, @tester.codify("?-#-?")
    assert_match Faker::NatoAlphabet::STOP_CODE, @tester.codify(".")
  end
end
