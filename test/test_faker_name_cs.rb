# encoding: utf-8

require 'helper'

class TestFakerNameCS < Test::Unit::TestCase
  def setup
    @tester = Faker::NameCS
  end

  def test_name
    @words = @tester.name.split
    assert [2,3,4].include?(@words.size) # just name, or prefix, or prefix+suffix
  end

  def test_name_sex
    @words = @tester.name.split
    @words = @words[1..2] if @words.size > 2
    assert same_sex?(@words)
  end

  def test_male_last_name
    assert Faker::NameCS::LAST_NAMES[:male].include?(@tester.last_name(:male))
  end

  def test_male_first_name
    assert Faker::NameCS::FIRST_NAMES[:male].include?(@tester.first_name(:male))
  end

  def test_prefix
    assert Faker::NameCS::PREFIXES.include?(@tester.prefix)
  end

  def test_suffix
    assert Faker::NameCS::SUFFIXES.include?(@tester.suffix)
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

  # checks if every name is of the same sex
  def same_sex?(words, sex = :any)
    (sex == :any ? [:male, :female] : [sex]).any? do |sex|
      words.all? do |word|
        [Faker::NameCS::LAST_NAMES, Faker::NameCS::FIRST_NAMES].any? do |names|
          names[sex].include?(word)
        end
      end
    end
  end
end
