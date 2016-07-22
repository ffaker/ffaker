# encoding: utf-8

require 'helper'

class TestLoremARAR < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::LoremAR,
    :paragraph, :paragraphs, :sentence, :sentences,
    :phrase, :phrases, :word, :words
  )

  def test_paragraph
    assert_match(/[ a-z]+/, FFaker::LoremAR.paragraph)
  end

  def test_sentence
    assert_match(/[ a-z]+/, FFaker::LoremAR.sentence)
  end

  def test_phrase
    assert_match(/[ a-z]+/, FFaker::LoremAR.phrase)
  end

  def test_paragraphs
    assert_match(/[^a-zA-Z0-9]+/, FFaker::LoremAR.paragraphs.join(' '))
  end

  def test_sentences
    assert_match(/[^a-zA-Z0-9]+/, FFaker::LoremAR.sentences.join(' '))
  end

  def test_phrases
    assert_match(/[^a-zA-Z0-9]+/, FFaker::LoremAR.phrases.join(' '))
  end

  def test_words
    assert_match(/[^a-zA-Z0-9]+/, FFaker::LoremAR.words.join(' '))
  end

  def test_word
    assert_match(/[^a-zA-Z0-9]+/, FFaker::LoremAR.word)
  end
end
