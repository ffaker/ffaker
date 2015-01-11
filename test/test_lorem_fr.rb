# encoding: utf-8

require 'helper'

class TestLoremFR < Test::Unit::TestCase
  def test_paragraph
    assert_match /\A[ -.àâéèêîôùûa-z]+\z/i, Faker::LoremFR.paragraph
  end

  def test_sentence
    assert_match /\A[ -.àâéèêîôùûa-z]+\z/i, Faker::LoremFR.sentence
  end

  def test_phrase
    assert_match /\A[ -.àâéèêîôùûa-z]+\z/i, Faker::LoremFR.phrase
  end

  def test_paragraphsLoremFR
    assert_match /\A[ -.àâéèêîôùûa-z]+\z/i, Faker::LoremFR.paragraphs.join(" ")
  end

  def test_sentences
    assert_match /\A[ -.àâéèêîôùûa-z]+\z/i, Faker::LoremFR.sentences.join(" ")
  end

  def test_phrases
    assert_match /\A[ -.àâéèêîôùûa-z]+\z/i, Faker::LoremFR.phrases.join(" ")
  end

  def test_words
    assert_match /\A[ -àâéèêîôùûa-z]+\z/i, Faker::LoremFR.words.join(" ")
  end

  def test_word
    assert_match /\A[-àâéèêîôùûa-z]+\z/i, Faker::LoremFR.word
  end
end
