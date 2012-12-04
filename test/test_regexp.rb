require 'helper'

class TestRegexp < Test::Unit::TestCase
  FR = Faker::Regexp

  def test_atoms
    assert_equal "abc", FR.regexp(/abc/)
  end

  def test_digits
    assert_match /\d\d\d/, FR.regexp(/\d\d\d/)
  end

  def test_word_characters
    assert_match /\w\w\w/, FR.regexp(/\w\w\w/)
  end

  def test_spaces
    assert_match /\s\s\s/, FR.regexp(/\s\s\s/)
  end

  def test_escaped_characters
    assert_equal "\\/.()[]{}", FR.regexp(/\\\/\.\(\)\[\]\{\}/)
  end

  def test_atom_sets
    assert ['a', 'b', 'c'].include?(FR.regexp(/[abc]/))
  end

  def test_special_sets
    assert_match /[\w\d]/, FR.regexp(/[\w\d]/)
  end

  def test_question
    assert_match /a?/, FR.regexp(/a?/)
  end
end
