# encoding: utf-8

require 'helper'

class BoganIpsum < Test::Unit::TestCase
  def test_paragraph
    assert_match /[ a-z]+/, Faker::BoganIpsum.paragraph
  end

  def test_sentence
    assert_match /[ a-z]+/, Faker::BoganIpsum.sentence
    assert_nothing_thrown do
      100.times { Faker::BoganIpsum.sentence 0 }
    end
  end

  def test_phrase
    assert_match /[ a-z]+/, Faker::BoganIpsum.phrase
  end

  def test_paragraphs
    assert_match /[ a-z]+/, Faker::BoganIpsum.paragraphs.join(" ")
  end

  def test_sentences
    assert_match /[ a-z]+/, Faker::BoganIpsum.sentences.join(" ")
  end

  def test_phrases
    assert_match /[ a-z]+/, Faker::BoganIpsum.phrases.join(" ")
  end

  def test_words
    assert_match /[ a-z]+/, Faker::BoganIpsum.words.join(" ")
  end

  def test_word
    assert_match /[a-z]+/, Faker::BoganIpsum.word
  end

  def test_characters
    assert_match /[a-z0-9]+/, Faker::BoganIpsum.characters
    assert Faker::BoganIpsum.characters().length == 255
    assert Faker::BoganIpsum.characters(10).length == 10
    assert Faker::BoganIpsum.characters(-1) == ""
  end
end

