# encoding: utf-8

require 'helper'

class TestHipsterIpsum < Test::Unit::TestCase
  TEST_REGEX = /\+1|[ a-z]+/i

  def test_paragraph
    assert_match TEST_REGEX, Faker::HipsterIpsum.paragraph
  end

  def test_sentence
    assert_match TEST_REGEX, Faker::HipsterIpsum.sentence
  end

  def test_paragraphs
    assert_match TEST_REGEX, Faker::HipsterIpsum.paragraphs.join(" ")
  end

  def test_sentences
    assert_match TEST_REGEX, Faker::HipsterIpsum.sentences.join(" ")
  end

  def test_words
    assert_match TEST_REGEX, Faker::HipsterIpsum.words.join(" ")
  end

  def test_word
    assert_match TEST_REGEX, Faker::HipsterIpsum.word
  end
end
