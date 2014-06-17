# encoding: utf-8

require 'helper'

class TestDizzleIpsum < Test::Unit::TestCase

  def test_paragraph
    assert_match /1\+|[ a-z]+/i, Faker::DizzleIpsum.paragraph
  end

  def test_sentence
    assert_match /1\+|[ a-z]+/i, Faker::DizzleIpsum.sentence
  end

  def test_paragraphs
    assert_match /1\+|[ a-z]+/i, Faker::DizzleIpsum.paragraphs.join(" ")
  end

  def test_sentences
    assert_match /1\+|[ a-z]+/i, Faker::DizzleIpsum.sentences.join(" ")
  end

  def test_words
    assert_match /1\+|[ a-z]+/i, Faker::DizzleIpsum.words.join(" ")
  end

  def test_word
    assert_match /1\+|[a-z]+/i, Faker::DizzleIpsum.word
  end
end
