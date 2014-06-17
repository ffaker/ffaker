require 'helper'

class TestHealthcareIpsum < Test::Unit::TestCase
  def test_paragraph
    assert_match /1\+|[ a-z]+/i, Faker::HealthcareIpsum.paragraph
  end

  def test_sentence
    assert_match /1\+|[ a-z]+/i, Faker::HealthcareIpsum.sentence
  end

  def test_paragraphs
    assert_match /1\+|[ a-z]+/i, Faker::HealthcareIpsum.paragraphs.join(" ")
  end

  def test_sentences
    assert_match /1\+|[ a-z]+/i, Faker::HealthcareIpsum.sentences.join(" ")
  end

  def test_words
    assert_match /1\+|[ a-z]+/i, Faker::HealthcareIpsum.words.join(" ")
  end

  def test_word
    assert_match /1\+|[a-z]+/i, Faker::HealthcareIpsum.word
  end
end
