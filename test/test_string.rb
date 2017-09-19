# encoding: utf-8

require 'helper'

class TestString < Test::Unit::TestCase
  include DeterministicHelper

  FS = FFaker::String

  def test_atoms
    assert_equal 'abc', FS.from_regexp(/abc/)
    assert_deterministic { FS.from_regexp(/abc/) }
  end

  def test_digits
    assert_match(/\A\d\d\d\z/, FS.from_regexp(/\d\d\d/))
    assert_deterministic { FS.from_regexp(/\d\d\d/) }
  end

  def test_word_characters
    assert_match(/\A\w\w\w\z/, FS.from_regexp(/\w\w\w/))
    assert_deterministic { FS.from_regexp(/\w\w\w/) }
  end

  def test_word_range_character
    assert_match(/\A[a-z]\z/, FS.from_regexp(/[a-z]/))
    assert_deterministic { FS.from_regexp(/[a-z]/) }
  end

  def test_dash_character
    assert_match(/\A[a-z-]\z/, FS.from_regexp(/[a-z-]/))
    assert_match(/\A[a-]\z/, FS.from_regexp(/[a-]/))
    assert_match(/\A[-]\z/, FS.from_regexp(/[-]/))

    assert_deterministic { FS.from_regexp(/[a-z-]/) }
    assert_deterministic { FS.from_regexp(/[a-]/) }
    assert_deterministic { FS.from_regexp(/[-]/) }
  end

  def test_spaces
    assert_match(/\A\s\s\s\z/, FS.from_regexp(/\s\s\s/))
    assert_deterministic { FS.from_regexp(/\s\s\s/) }
  end

  def test_escaped_characters
    assert_equal '\\/.()[]{}', FS.from_regexp(/\\\/\.\(\)\[\]\{\}/)
    assert_deterministic { FS.from_regexp(%r|\\\/\.\(\)\[\]\{\}|) }
  end

  def test_atom_sets
    assert_include %w[a b c], FS.from_regexp(/[abc]/)
    assert_deterministic { FS.from_regexp(/[abc]/) }
  end

  def test_special_sets
    assert_match(/\A[\w\d]\z/, FS.from_regexp(/[\w\d]/))
    assert_deterministic { FS.from_regexp(/[\w\d]/) }
  end

  def test_atom_question
    assert_match(/\Aa?\z/, FS.from_regexp(/a?/))
    assert_deterministic { FS.from_regexp(/a?/) }
  end

  def test_special_question
    assert_match(/\A\w?\z/, FS.from_regexp(/\w?/))
    assert_deterministic { FS.from_regexp(/\w?/) }
  end

  def test_set_question
    assert_match(/\A[abc]?\z/, FS.from_regexp(/[abc]?/))
    assert_deterministic { FS.from_regexp(/[abc]?/) }
  end

  def test_atom_plus
    assert_match(/\Aa+\z/, FS.from_regexp(/a+/))
    assert_deterministic { FS.from_regexp(/a+/) }
  end

  def test_special_plus
    assert_match(/\A\w+\z/, FS.from_regexp(/\w+/))
    assert_deterministic { FS.from_regexp(/\w+/) }
  end

  def test_set_plus
    assert_match(/\A[abc]+\z/, FS.from_regexp(/[abc]+/))
    assert_deterministic { FS.from_regexp(/[abc]+/) }
  end

  def test_atom_star
    assert_match(/\Aa*\z/, FS.from_regexp(/a*/))
    assert_deterministic { FS.from_regexp(/a*/) }
  end

  def test_special_star
    assert_match(/\A\w*\z/, FS.from_regexp(/\w*/))
    assert_deterministic { FS.from_regexp(/\w*/) }
  end

  def test_set_star
    assert_match(/\A[abc]*\z/, FS.from_regexp(/[abc]*/))
    assert_deterministic { FS.from_regexp(/[abc]*/) }
  end

  def test_braces
    assert_equal 'a' * 13, FS.from_regexp(/a{13}/)
    assert_match(/\A[abc]{13}\z/, FS.from_regexp(/[abc]{13}/))
    assert_match(/\A\w{13}\z/, FS.from_regexp(/\w{13}/))

    assert_deterministic { FS.from_regexp(/a{13}/) }
    assert_deterministic { FS.from_regexp(/[abc]{13}/) }
    assert_deterministic { FS.from_regexp(/\w{13}/) }
  end
end
