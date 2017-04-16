# encoding: utf-8

require 'helper'

class PirateIpsum < Test::Unit::TestCase
  def test_paragraph
    assert_match /[ a-z]+/, Faker::PirateIpsum.paragraph
  end

  def test_sentence
    assert_match /[ a-z]+/, Faker::PirateIpsum.sentence
    assert_nothing_thrown do
      100.times { Faker::PirateIpsum.sentence 0 }
    end
  end

  def test_phrase
    assert_match /[ a-z]+/, Faker::PirateIpsum.phrase
  end

  def test_paragraphs
    assert_match /[ a-z]+/, Faker::PirateIpsum.paragraphs.join(" ")
  end

  def test_sentences
    assert_match /[ a-z]+/, Faker::PirateIpsum.sentences.join(" ")
  end

  def test_phrases
    assert_match /[ a-z]+/, Faker::PirateIpsum.phrases.join(" ")
  end

  def test_words
    assert_match /[ a-z]+/, Faker::PirateIpsum.words.join(" ")
  end

  def test_word
    assert_match /[a-z]+/, Faker::PirateIpsum.word
  end

  def test_characters
    assert_match /[a-z0-9]+/, Faker::PirateIpsum.characters
    assert Faker::PirateIpsum.characters().length == 255
    assert Faker::PirateIpsum.characters(10).length == 10
    assert Faker::PirateIpsum.characters(-1) == ""
  end
end

