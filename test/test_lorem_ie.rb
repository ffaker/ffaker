# frozen_string_literal: true
# encoding: utf-8

require 'helper'

class TestLoremIE < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::LoremIE,
    :paragraph, :paragraphs, :sentence, :sentences,
    :phrase, :phrases, :word, :words, :question
  )
  REGEX = /\A[ -.ÁÉÍÓÚáéíóúa-z]+\z/i

  def test_paragraph
    assert_match(/\A[ -.áéíóúa-z]+\z/i, FFaker::LoremIE.paragraph)
  end

  def test_question
    assert_match(/\A[ -.áéíóúa-z]+\z/i, FFaker::LoremIE.question)
  end

  def test_sentence
    assert_match(/\A[ -.áéíóúa-z]+\z/i, FFaker::LoremIE.sentence)
  end

  def test_phrase
    assert_match(/\A[ -.áéíóúa-z]+\z/i, FFaker::LoremIE.phrase)
  end

  def test_paragraphs
    assert_match(REGEX, FFaker::LoremIE.paragraphs.join(' '))
  end

  def test_sentences
    assert_match(/\A[ -.áéíóúa-z]+\z/i, FFaker::LoremIE.sentences.join(' '))
  end

  def test_phrases
    assert_match(/\A[ -.áéíóúa-z]+\z/i, FFaker::LoremIE.phrases.join(' '))
  end

  def test_words
    assert_match(/\A[ -áéíóúa-z]+\z/i, FFaker::LoremIE.words.join(' '))
  end

  def test_word
    assert_match(/\A[-áéíóúa-z]+\z/i, FFaker::LoremIE.word)
  end
end
