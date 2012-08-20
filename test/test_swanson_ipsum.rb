require 'helper'

class TestSwansonIpsum < Test::Unit::TestCase
  def test_paragraph
    assert_match /1\+|[ a-z]+/i, Faker::SwansonIpsum.paragraph
  end

  def test_sentence
    assert_match /1\+|[ a-z]+/i, Faker::SwansonIpsum.sentence
  end

  def test_paragraphs
    assert_match /1\+|[ a-z]+/i, Faker::SwansonIpsum.paragraphs.join(" ")
  end

  def test_sentences
    assert_match /1\+|[ a-z]+/i, Faker::SwansonIpsum.sentences.join(" ")
  end

  def test_words
    assert_match /1\+|[ a-z]+/i, Faker::SwansonIpsum.words.join(" ")
  end

  def test_word
    assert_match /1\+|[a-z]+/i, Faker::SwansonIpsum.word
  end
end
