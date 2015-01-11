# encoding: utf-8

require 'helper'

class TestLoremFR < Test::Unit::TestCase
  def test_paragraph
    assert_match /[ a-z]+/, FFaker::LoremFR.paragraph
  end

  def test_sentence
    assert_match /[ a-z]+/, FFaker::LoremFR.sentence
  end

  def test_phrase
    assert_match /[ a-z]+/, FFaker::LoremFR.phrase
  end

  def test_paragraphsLoremFR
    assert_match /[ a-z]+/, FFaker::LoremFR.paragraphs.join(" ")
  end

  def test_sentences
    assert_match /[ a-z]+/, FFaker::LoremFR.sentences.join(" ")
  end

  def test_phrases
    assert_match /[ a-z]+/, FFaker::LoremFR.phrases.join(" ")
  end

  def test_words
    assert_match /[ a-z]+/, FFaker::LoremFR.words.join(" ")
  end

  def test_word
    assert_match /[a-z]+/, FFaker::LoremFR.word
  end
end
