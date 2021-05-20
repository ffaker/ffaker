# frozen_string_literal: true

require_relative 'helper'

class TestLoremIE < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::LoremIE,
    :paragraph, :paragraphs, :sentence, :sentences,
    :phrase, :phrases, :word, :words, :question
  )

  WORDS_REGEX = /\A[\w\W]+\z/i.freeze # spaces, alphanumeric & perioids, etc.
  WORD_REGEX = /\A[áéíóúa-z]+\z/i.freeze

  def test_paragraph
    assert_match(WORDS_REGEX, FFaker::LoremIE.paragraph)
  end

  def test_question
    assert_match(WORDS_REGEX, FFaker::LoremIE.question)
  end

  def test_sentence
    assert_match(WORDS_REGEX, FFaker::LoremIE.sentence)
  end

  def test_phrase
    assert_match(WORDS_REGEX, FFaker::LoremIE.phrase)
  end

  def test_paragraphs
    assert_match(WORDS_REGEX, FFaker::LoremIE.paragraphs.join(' '))
  end

  def test_sentences
    assert_match(WORDS_REGEX, FFaker::LoremIE.sentences.join(' '))
  end

  def test_phrases
    assert_match(WORDS_REGEX, FFaker::LoremIE.phrases.join(' '))
  end

  def test_words
    assert_match(WORDS_REGEX, FFaker::LoremIE.words.join(' '))
  end

  def test_word
    assert_match(WORD_REGEX, FFaker::LoremIE.word)
  end
end
