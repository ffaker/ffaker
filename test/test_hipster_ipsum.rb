# encoding: utf-8

require 'helper'

class TestHipsterIpsum < Test::Unit::TestCase
  def test_paragraph
    assert_match /1\+|[ a-z]+/i, FFaker::HipsterIpsum.paragraph
  end

  def test_sentence
    assert_match /1\+|[ a-z]+/i, FFaker::HipsterIpsum.sentence
  end

  def test_paragraphs
    assert_match /1\+|[ a-z]+/i, FFaker::HipsterIpsum.paragraphs.join(" ")
  end

  def test_sentences
    assert_match /1\+|[ a-z]+/i, FFaker::HipsterIpsum.sentences.join(" ")
  end

  def test_words
    assert_match /1\+|[ a-z]+/i, FFaker::HipsterIpsum.words.join(" ")
  end

  def test_word
    assert_match /1\+|[a-z]+/i, FFaker::HipsterIpsum.word
  end
end
