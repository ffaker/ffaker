# frozen_string_literal: true

require_relative 'helper'

class TestLoremCN < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::LoremCN,
    :paragraph, :paragraphs, :sentence, :sentences, :word, :words
  )

  def test_paragraph
    assert_greater_than_or_equal_to FFaker::LoremCN.paragraph.length, 3 * 4 * 2
  end

  def test_sentence
    assert_greater_than_or_equal_to FFaker::LoremCN.sentence.length, 4 * 2
  end

  def test_paragraphs
    assert_greater_than_or_equal_to FFaker::LoremCN.paragraphs.length, 2
  end

  def test_paragraphs_is_not_a_string_representation_of_an_array
    assert !/[\[\]]+/.match([FFaker::LoremCN.paragraphs].flatten.join(' '))
  end

  def test_paragraphs_is_an_array
    assert FFaker::LoremCN.paragraphs.class == Array
  end

  def test_sentences
    assert_greater_than_or_equal_to FFaker::LoremCN.sentences.length, 2
  end

  def test_sentences_is_an_array
    assert FFaker::LoremCN.sentences.class == Array
  end

  def test_sentences_via_to_s_produces_string_terminated_with_period
    string = FFaker::LoremCN.sentences.to_s
    assert string.class == String
    assert string =~ /。$/
  end

  def test_words
    assert_greater_than_or_equal_to FFaker::LoremCN.words.length, 2
  end

  def test_word
    assert_greater_than_or_equal_to FFaker::LoremCN.word.length, 1
  end
end
