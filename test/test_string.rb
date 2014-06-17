# encoding: utf-8

require 'helper'

class TestString < Test::Unit::TestCase
  FS = Faker::String

  def test_atoms
    assert_equal "abc", FS.from_regexp(/abc/)
  end

  def test_digits
    assert_match /\d\d\d/, FS.from_regexp(/\d\d\d/)
  end

  def test_word_characters
    assert_match /\w\w\w/, FS.from_regexp(/\w\w\w/)
  end

  def test_spaces
    assert_match /\s\s\s/, FS.from_regexp(/\s\s\s/)
  end

  def test_escaped_characters
    assert_equal "\\/.()[]{}", FS.from_regexp(/\\\/\.\(\)\[\]\{\}/)
  end

  def test_atom_sets
    assert ['a', 'b', 'c'].include?(FS.from_regexp(/[abc]/))
  end

  def test_special_sets
    assert_match /[\w\d]/, FS.from_regexp(/[\w\d]/)
  end

  def test_atom_question
    assert_match /a?/, FS.from_regexp(/a?/)
  end

  def test_special_question
    assert_match /^\w?$/, FS.from_regexp(/\w?/)
  end

  def test_set_question
    assert_match /^[abc]?$/, FS.from_regexp(/[abc]?/)
  end

  def test_atom_plus
    assert_match /a+/, FS.from_regexp(/a+/)
  end

  def test_special_plus
    assert_match /\w+/, FS.from_regexp(/\w+/)
  end

  def test_set_plus
    assert_match /^[abc]+$/, FS.from_regexp(/[abc]+/)
  end

  def test_atom_star
    assert_match /a*/, FS.from_regexp(/a*/)
  end

  def test_special_star
    assert_match /\w*/, FS.from_regexp(/\w*/)
  end

  def test_set_star
    assert_match /^[abc]*$/, FS.from_regexp(/[abc]*/)
  end
end
