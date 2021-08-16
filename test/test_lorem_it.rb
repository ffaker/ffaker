# frozen_string_literal: true

require_relative 'helper'

class TestLoremIT < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::LoremIT,
    :paragraph, :sentence, :phrase, :paragraphs, :sentences, :phrases, :words, :word
  )

  def test_paragraph
    assert_match(/[ a-z]+/, FFaker::LoremIT.paragraph)
  end

  def test_sentence
    assert_match(/[ a-z]+/, FFaker::LoremIT.sentence)
    assert_nothing_thrown do
      100.times { FFaker::LoremIT.sentence 0 }
    end
  end

  def test_phrase
    assert_match(/[ a-z]+/, FFaker::LoremIT.phrase)
  end

  def test_paragraphs
    assert_match(/[ a-z]+/, FFaker::LoremIT.paragraphs.join(' '))
  end

  def test_sentences
    assert_match(/[ a-z]+/, FFaker::LoremIT.sentences.join(' '))
  end

  def test_phrases
    assert_match(/[ a-z]+/, FFaker::LoremIT.phrases.join(' '))
  end

  def test_words
    assert_match(/[ a-z]+/, FFaker::LoremIT.words.join(' '))
  end

  def test_word
    assert_match(/[a-z]+/, FFaker::LoremIT.word)
  end

  def test_word_collection_uniqueness
    assert_equal(FFaker::LoremIT::WORDS, FFaker::LoremIT::WORDS.uniq)
  end
end
