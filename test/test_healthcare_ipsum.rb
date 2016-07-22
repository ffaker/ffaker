require 'helper'

class TestHealthcareIpsum < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::HealthcareIpsum,
    :paragraph, :paragraphs, :sentence, :sentences, :word, :words
  )

  def test_paragraph
    assert_match(/1\+|[ a-z]+/i, FFaker::HealthcareIpsum.paragraph)
  end

  def test_sentence
    assert_match(/1\+|[ a-z]+/i, FFaker::HealthcareIpsum.sentence)
  end

  def test_paragraphs
    assert_match(/1\+|[ a-z]+/i, FFaker::HealthcareIpsum.paragraphs.join(' '))
  end

  def test_sentences
    assert_match(/1\+|[ a-z]+/i, FFaker::HealthcareIpsum.sentences.join(' '))
  end

  def test_words
    assert_match(/1\+|[ a-z]+/i, FFaker::HealthcareIpsum.words.join(' '))
  end

  def test_word
    assert_match(/1\+|[a-z]+/i, FFaker::HealthcareIpsum.word)
  end
end
