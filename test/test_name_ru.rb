# encoding: utf-8

require 'helper'

class TestFakerNameRU < Test::Unit::TestCase
  include DeterministicHelper

  RU_REGEX = /[А-Я][а-я]+/

  assert_methods_are_deterministic(
    FFaker::NameRU,
    :name, :last_name, :first_name, :patronymic
  )

  def setup
    @tester = FFaker::NameRU
  end

  def test_name
    @words = @tester.name.split
    assert_include [2, 3], @words.size
    assert @words.all? { |word| word.match RU_REGEX }
  end

  def test_name_sex
    @words = @tester.name.split
    assert same_sex?(@words)
  end

  def test_last_name
    assert_match(RU_REGEX, @tester.last_name)
  end

  def test_male_last_name
    assert_include @tester::LAST_NAMES[:male], @tester.last_name(:male)
  end

  def test_first_name
    assert_match(RU_REGEX, @tester.first_name)
  end

  def test_male_first_name
    assert_include @tester::FIRST_NAMES[:male], @tester.first_name(:male)
  end

  def test_patronymic
    assert_match(RU_REGEX, @tester.patronymic)
  end

  def test_male_patronymic
    assert_include @tester::PATRONYMICS[:male], @tester.patronymic(:male)
  end

  def test_with_same_sex
    names = []
    @tester.with_same_sex do
      names << @tester.last_name
      names << @tester.first_name
      names << @tester.patronymic
    end
    assert same_sex?(names)
  end

  def test_with_same_sex_for_male
    names = []
    @tester.with_same_sex(:male) do
      names << @tester.last_name
      names << @tester.first_name
      names << @tester.patronymic
    end
    assert same_sex?(names, :male)
  end

  private

  # checks if every name is of the same sex
  def same_sex?(words, sex = :any)
    (sex == :any ? %i[male female] : [sex]).any? do |s|
      words.all? do |word|
        [@tester::LAST_NAMES, @tester::FIRST_NAMES, @tester::PATRONYMICS].any? do |names|
          names[s].include?(word)
        end
      end
    end
  end
end
