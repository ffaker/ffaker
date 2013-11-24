# encoding: utf-8

require 'helper'

class TestLoremARAR < Test::Unit::TestCase
  def test_paragraph
    assert_match /[ a-z]+/, Faker::LoremAR.paragraph
  end

  def test_sentence
    assert_match /[ a-z]+/, Faker::LoremAR.sentence
  end

  def test_phrase
    assert_match /[ a-z]+/, Faker::LoremAR.phrase
  end

  def test_paragraphs
    assert_match /[^a-zA-Z0-9]+/, Faker::LoremAR.paragraphs.join(" ")
  end

  def test_sentences
    assert_match /[^a-zA-Z0-9]+/, Faker::LoremAR.sentences.join(" ")
  end

  def test_phrases
    assert_match /[^a-zA-Z0-9]+/, Faker::LoremAR.phrases.join(" ")
  end

  def test_words
    assert_match /[^a-zA-Z0-9]+/, Faker::LoremAR.words.join(" ")
  end

  def test_word
    assert_match /[^a-zA-Z0-9]+/, Faker::LoremAR.word
  end
end
