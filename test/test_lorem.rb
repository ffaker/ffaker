# encoding: utf-8

require 'helper'

class TestLorem < Test::Unit::TestCase
  def test_paragraph
    assert_match /[ a-z]+/, Faker::Lorem.paragraph
  end

  def test_sentence
    assert_match /[ a-z]+/, Faker::Lorem.sentence
    assert_nothing_thrown do
      100.times { Faker::Lorem.sentence 0 }
    end
  end

  def test_phrase
    assert_match /[ a-z]+/, Faker::Lorem.phrase
  end

  def test_paragraphs
    assert_match /[ a-z]+/, Faker::Lorem.paragraphs.join(" ")
  end

  def test_sentences
    assert_match /[ a-z]+/, Faker::Lorem.sentences.join(" ")
  end

  def test_phrases
    assert_match /[ a-z]+/, Faker::Lorem.phrases.join(" ")
  end

  def test_words
    assert_match /[ a-z]+/, Faker::Lorem.words.join(" ")
  end

  def test_word
    assert_match /[a-z]+/, Faker::Lorem.word
  end

  def test_characters
    assert_match /[a-z0-9]+/, Faker::Lorem.characters
    assert Faker::Lorem.characters().length == 255
    assert Faker::Lorem.characters(10).length == 10
    assert Faker::Lorem.characters(-1) == ""
  end
end
