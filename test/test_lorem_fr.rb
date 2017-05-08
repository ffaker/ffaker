# encoding: utf-8

require 'helper'

class TestLoremFR < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::LoremFR,
    :paragraph, :paragraphs, :sentence, :sentences,
    :phrase, :phrases, :word, :words
  )
  REGEX = /\A[ -.ÀÂÉÈÊÎÔÚÛàâéèêîôùûa-z]+\z/i

  def test_paragraph
    assert_match(/\A[ -.àâéèêîôùûa-z]+\z/i, FFaker::LoremFR.paragraph)
  end

  def test_sentence
    assert_match(/\A[ -.àâéèêîôùûa-z]+\z/i, FFaker::LoremFR.sentence)
  end

  def test_phrase
    assert_match(/\A[ -.àâéèêîôùûa-z]+\z/i, FFaker::LoremFR.phrase)
  end

  def test_paragraphsLoremFR
    assert_match(REGEX, FFaker::LoremFR.paragraphs.join(' '))
  end

  def test_sentences
    assert_match(/\A[ -.àâéèêîôùûa-z]+\z/i, FFaker::LoremFR.sentences.join(' '))
  end

  def test_phrases
    assert_match(/\A[ -.àâéèêîôùûa-z]+\z/i, FFaker::LoremFR.phrases.join(' '))
  end

  def test_words
    assert_match(/\A[ -àâéèêîôùûa-z]+\z/i, FFaker::LoremFR.words.join(' '))
  end

  def test_word
    assert_match(/\A[-àâéèêîôùûa-z]+\z/i, FFaker::LoremFR.word)
  end
end
