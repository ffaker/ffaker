require 'helper'

class TestCheesyLingo < Test::Unit::TestCase
  include DeterministicHelper

  TEST_REGEX = /\+1|[a-z]+/i

  assert_methods_are_deterministic(
    FFaker::CheesyLingo,
    :title, :word, :words, :sentence, :paragraph
  )

  def setup
    @tester = FFaker::CheesyLingo
  end

  def test_title
    assert_match(TEST_REGEX, @tester.title)
  end

  def test_word
    assert_match(TEST_REGEX, @tester.word)
  end

  def test_words
    assert_match(TEST_REGEX, @tester.words(3).join(' '))
  end

  def test_sentence
    assert_match(TEST_REGEX, @tester.sentence)
    assert_match(/1\+|[ a-zA-Z]+./, @tester.sentence)
  end

  def test_paragraph # without passing count
    assert_match(/\+|[a-zA-Z]*./, @tester.paragraph(1))
  end

  def test_paragraph_with_arg
    assert_match(/\+1|[a-zA-Z]+./, @tester.paragraph(3))
  end
end
