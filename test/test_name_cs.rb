require 'helper'

class TestFakerNameCS < Minitest::Test
  def setup
    @tester = FFaker::NameCS
  end

  def test_name
    @words = @tester.name.split
    assert_includes([2, 3, 4], @words.size) # just name, or prefix, or prefix+suffix
  end

  def test_name_sex
    @words = @tester.name.split
    @words = @words[1..2] if @words.size > 2
    assert same_sex?(@words)
  end

  def test_male_last_name
    assert_includes(@tester::LAST_NAMES[:male], @tester.last_name(:male))
  end

  def test_male_first_name
    assert_includes(@tester::FIRST_NAMES[:male], @tester.first_name(:male))
  end

  def test_prefix
    assert_includes(@tester::PREFIXES, @tester.prefix)
  end

  def test_suffix
    assert_includes(@tester::SUFFIXES, @tester.suffix)
  end

  def test_with_same_sex
    names = []
    @tester.with_same_sex do
      names << @tester.last_name
      names << @tester.first_name
    end
    assert same_sex?(names)
  end

  def test_with_same_sex_for_male
    names = []
    @tester.with_same_sex(:male) do
      names << @tester.last_name
      names << @tester.first_name
    end
    assert same_sex?(names, :male)
  end

  private

  # checks if every name is of the same sex
  def same_sex?(words, sex = :any)
    (sex == :any ? [:male, :female] : [sex]).any? do |sex|
      words.all? do |word|
        [@tester::LAST_NAMES, @tester::FIRST_NAMES].any? do |names|
          names[sex].include?(word)
        end
      end
    end
  end
end
