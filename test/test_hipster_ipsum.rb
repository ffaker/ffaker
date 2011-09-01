require 'helper'

class TestHipsterIpsum < Test::Unit::TestCase

  def test_paragraph
    assert_match /[ a-z]+/, Faker::HipsterIpsum.paragraph
  end

  def test_sentence
    assert_match /[ a-z]+/, Faker::HipsterIpsum.sentence
  end

  def test_paragraphs
    assert_match /[ a-z]+/, Faker::HipsterIpsum.paragraphs.join(" ")
  end

  def test_sentences
    assert_match /[ a-z]+/, Faker::HipsterIpsum.sentences.join(" ")
  end

  def test_words
    assert_match /[ a-z]+/, Faker::HipsterIpsum.words.join(" ")
  end

  def test_word
    assert_match /[a-z]+/, Faker::HipsterIpsum.word
  end

end
