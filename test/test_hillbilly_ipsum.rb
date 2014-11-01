# encoding: utf-8

require 'helper'

class HillbillyIpsum < Test::Unit::TestCase
  def test_paragraph
    assert_match /[ a-z]+/, Faker::HillbillyIpsum.paragraph
  end

  def test_sentence
    assert_match /[ a-z]+/, Faker::HillbillyIpsum.sentence
    assert_nothing_thrown do
      100.times { Faker::HillbillyIpsum.sentence 0 }
    end
  end

  def test_phrase
    assert_match /[ a-z]+/, Faker::HillbillyIpsum.phrase
  end

  def test_paragraphs
    assert_match /[ a-z]+/, Faker::HillbillyIpsum.paragraphs.join(" ")
  end

  def test_sentences
    assert_match /[ a-z]+/, Faker::HillbillyIpsum.sentences.join(" ")
  end

  def test_phrases
    assert_match /[ a-z]+/, Faker::HillbillyIpsum.phrases.join(" ")
  end

  def test_words
    assert_match /[ a-z]+/, Faker::HillbillyIpsum.words.join(" ")
  end

  def test_word
    assert_match /[a-z]+/, Faker::HillbillyIpsum.word
  end

  def test_characters
    assert_match /[a-z0-9]+/, Faker::HillbillyIpsum.characters
    assert Faker::HillbillyIpsum.characters().length == 255
    assert Faker::HillbillyIpsum.characters(10).length == 10
    assert Faker::HillbillyIpsum.characters(-1) == ""
  end
end
