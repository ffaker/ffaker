# encoding: utf-8

require 'helper'

class TestHillbillyIpsum < Test::Unit::TestCase
  def test_paragraph
    assert_match /1\+|[ a-z]+/i, Faker::HillbillyIpsum.paragraph
  end

  def test_sentence
    assert_match /1\+|[ a-z]+/i, Faker::HillbillyIpsum.sentence
  end

  def test_paragraphs
    assert_match /1\+|[ a-z]+/i, Faker::HillbillyIpsum.paragraphs.join(" ")
  end

  def test_sentences
    assert_match /1\+|[ a-z]+/i, Faker::HillbillyIpsum.sentences.join(" ")
  end

  def test_words
    assert_match /1\+|[ a-z]+/i, Faker::HillbillyIpsum.words.join(" ")
  end

  def test_word
    assert_match /1\+|[a-z]+/i, Faker::HillbillyIpsum.word
  end
end
