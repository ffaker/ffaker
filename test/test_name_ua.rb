require 'test_helper'

class TestNameUA < Minitest::Test
  def setup
    @tester = FFaker::NameUA

    @single_word_name_regexp    = /\A[а-яА-ЯіїєґІЇЄҐ’\-]+\z/
    @multiple_words_name_regexp = /\A[а-яА-ЯіїєґІЇЄҐ’\-\s]+\z/
  end

  def test_first_name_male
    assert_includes @tester::FIRST_NAMES_MALE, (@tester.first_name_male)
    assert_match @single_word_name_regexp, @tester.first_name_male
  end

  def test_first_name_female
    assert_includes @tester::FIRST_NAMES_FEMALE, (@tester.first_name_female)
    assert_match @single_word_name_regexp, @tester.first_name_female
  end

  def test_middle_name_male
    assert_includes @tester::MIDDLE_NAMES_MALE, (@tester.middle_name_male)
    assert_match @single_word_name_regexp, @tester.middle_name_male
  end

  def test_middle_name_female
    assert_includes @tester::MIDDLE_NAMES_FEMALE, (@tester.middle_name_female)
    assert_match @single_word_name_regexp, @tester.middle_name_female
  end

  def test_last_name_male
    assert_includes @tester::LAST_NAMES_MALE, (@tester.last_name_male)
    assert_match @single_word_name_regexp, @tester.last_name_male
  end

  def test_last_name_female
    assert_includes @tester::LAST_NAMES_FEMALE, (@tester.last_name_female)
    assert_match @single_word_name_regexp, @tester.last_name_female
  end

  def test_first_name
    assert_includes @tester::FIRST_NAMES, (@tester.first_name)
    assert_match @single_word_name_regexp, @tester.first_name
  end

  def test_last_name
    assert_includes @tester::LAST_NAMES, (@tester.last_name)
    assert_match @single_word_name_regexp, @tester.last_name
  end

  def test_name
    8.times do
      assert_match @multiple_words_name_regexp, @tester.name
      assert_includes [1, 2, 3], @tester.name.split(' ').count
    end
  end
end
