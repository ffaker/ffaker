require 'test_helper'

class TestBaconIpsum < Minitest::Test

  def test_paragraph
    assert_match /1\+|[ a-z]+/i, FFaker::BaconIpsum.paragraph
  end

  def test_sentence
    assert_match /1\+|[ a-z]+/i, FFaker::BaconIpsum.sentence
  end

  def test_paragraphs
    assert_match /1\+|[ a-z]+/i, FFaker::BaconIpsum.paragraphs.join(" ")
  end

  def test_sentences
    assert_match /1\+|[ a-z]+/i, FFaker::BaconIpsum.sentences.join(" ")
  end

  def test_words
    assert_match /1\+|[ a-z]+/i, FFaker::BaconIpsum.words.join(" ")
  end

  def test_word
    assert_match /1\+|[a-z]+/i, FFaker::BaconIpsum.word
  end
end
