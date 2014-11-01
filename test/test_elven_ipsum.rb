# encoding: utf-8

require 'helper'

class ElvenIpsum < Test::Unit::TestCase
  def test_paragraph
    assert_match /[ a-z]+/, Faker::ElvenIpsum.paragraph
  end

  def test_sentence
    assert_match /[ a-z]+/, Faker::ElvenIpsum.sentence
    assert_nothing_thrown do
      100.times { Faker::ElvenIpsum.sentence 0 }
    end
  end

  def test_phrase
    assert_match /[ a-z]+/, Faker::ElvenIpsum.phrase
  end

  def test_paragraphs
    assert_match /[ a-z]+/, Faker::ElvenIpsum.paragraphs.join(" ")
  end

  def test_sentences
    assert_match /[ a-z]+/, Faker::ElvenIpsum.sentences.join(" ")
  end

  def test_phrases
    assert_match /[ a-z]+/, Faker::ElvenIpsum.phrases.join(" ")
  end

  def test_words
    assert_match /[ a-z]+/, Faker::ElvenIpsum.words.join(" ")
  end

  def test_word
    assert_match /[a-z]+/, Faker::ElvenIpsum.word
  end

  def test_characters
    assert_match /[a-z0-9]+/, Faker::ElvenIpsum.characters
    assert Faker::ElvenIpsum.characters().length == 255
    assert Faker::ElvenIpsum.characters(10).length == 10
    assert Faker::ElvenIpsum.characters(-1) == ""
  end
end


