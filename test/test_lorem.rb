# frozen_string_literal: true

require_relative 'helper'

class TestLorem < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::Lorem,
    :paragraph, :sentence, :phrase, :paragraphs, :sentences, :phrases, :words, :word, :characters
  )

  def test_paragraph
    assert_match(/[ a-z]+/, FFaker::Lorem.paragraph)
  end

  def test_sentence
    assert_match(/[ a-z]+/, FFaker::Lorem.sentence)
    assert_nothing_thrown do
      100.times { FFaker::Lorem.sentence 0 }
    end
  end

  def test_phrase
    assert_match(/[ a-z]+/, FFaker::Lorem.phrase)
  end

  def test_paragraphs
    assert_match(/[ a-z]+/, FFaker::Lorem.paragraphs.join(' '))
  end

  def test_sentences
    assert_match(/[ a-z]+/, FFaker::Lorem.sentences.join(' '))
  end

  def test_phrases
    assert_match(/[ a-z]+/, FFaker::Lorem.phrases.join(' '))
  end

  def test_words
    assert_match(/[ a-z]+/, FFaker::Lorem.words.join(' '))
  end

  def test_word
    assert_match(/[a-z]+/, FFaker::Lorem.word)
  end

  def test_characters
    assert_match(/[a-z0-9]+/, FFaker::Lorem.characters)
    assert FFaker::Lorem.characters.length == 255
    assert FFaker::Lorem.characters(10).length == 10
    assert FFaker::Lorem.characters(-1) == ''
  end

  def test_word_collection_uniqueness
    assert_equal(FFaker::Lorem::WORDS, FFaker::Lorem::WORDS.uniq)
  end
end
