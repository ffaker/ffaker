# encoding: utf-8

require 'helper'

class TestLoremJA < Test::Unit::TestCase
  def setup
    @subject = FFaker::LoremJA
  end

  def test_character
    assert_equal 1, @subject.character.length
    assert_kind_of String, @subject.character
  end

  def test_characters
    assert_equal 20, @subject.characters.length
    assert_kind_of String, @subject.characters
  end

  def test_characters_with_count
    assert_equal 30, @subject.characters(30).length
  end

  def test_word
    assert @subject.word.length >= 1
    assert_kind_of String, @subject.word
  end

  def test_words
    assert_equal 3, @subject.words.length
    assert_kind_of Array, @subject.words
  end

  def test_words_with_count
    assert_equal 10, @subject.words(10).length
  end

  def test_sentence
    assert @subject.sentence.length >= 1
  end

  def test_sentences
    assert_equal 3, @subject.sentences.length
    assert_kind_of Array, @subject.sentences
  end

  def test_sentences_with_count
    assert_equal 10, @subject.sentences(10).length
  end

  def test_paragraph
    assert @subject.paragraph.length >= 1
  end

  def test_paragraphs
    assert_equal 3, @subject.paragraphs.length
    assert_kind_of Array, @subject.paragraphs
  end

  def test_paragraphs_with_count
    assert_equal 10, @subject.paragraphs(10).length
  end

  def test_paragraph_end_with_terminate_character
    assert_match(/。$/, @subject.paragraph)
  end
end
