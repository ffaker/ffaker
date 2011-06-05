# encoding: utf-8
require 'helper'

class TestLoremCN < Test::Unit::TestCase
   
  def test_paragraph
    assert Faker::LoremCN.paragraph.length >= 3*4*2
  end

  def test_sentence
    assert Faker::LoremCN.sentence.length >= 4*2
  end

  def test_paragraphs
    assert Faker::LoremCN.paragraphs.length >= 2
  end
  def test_paragraphs_is_not_a_string_representation_of_an_array
    assert_not_match /[\[\]]+/, [Faker::LoremCN.paragraphs].flatten.join(' ')
  end
  def test_paragraphs_is_an_array
    assert Faker::LoremCN.paragraphs.class == Array
  end

  def test_sentences
    assert Faker::LoremCN.sentences.length >= 2
  end
    
  def test_words
    assert Faker::LoremCN.words.length >= 2
  end

  def test_word
    assert Faker::LoremCN.word.length >= 2
  end
end
