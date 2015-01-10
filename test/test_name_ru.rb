# encoding: utf-8

require 'helper'

class TestFakerNameRu < Test::Unit::TestCase
  def setup
    @tester = Faker::NameRU
  end

  def test_name
    @words = @tester.name.split
    assert [2,3].include?(@words.size)
    assert @words.each { |word| word.match /[А-Я][а-я]+/ }
  end

  def test_name_sex
    @words = @tester.name.split
    assert same_sex?(@words)
  end

  def test_last_name
    assert @tester.last_name.match(/[А-Я][а-я]+/)
  end

  def test_male_last_name
    assert Faker::NameRU::LAST_NAMES[:male].include?(@tester.last_name(:male))
  end

  def test_first_name
    assert @tester.first_name.match(/[А-Я][а-я]+/)
  end

  def test_male_first_name
    assert Faker::NameRU::FIRST_NAMES[:male].include?(@tester.first_name(:male))
  end

  def test_patronymic
    assert @tester.patronymic.match(/[А-Я][а-я]+/)
  end

  def test_male_patronymic
    assert Faker::NameRU::PATRONYMICS[:male].include?(@tester.patronymic(:male))
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

  # checks if every name is of the same sex
  def same_sex?(words, sex = :any)
    (sex == :any ? [:male, :female] : [sex]).any? do |sex|
      words.all? do |word|
        [Faker::NameRU::LAST_NAMES, Faker::NameRU::FIRST_NAMES, Faker::NameRU::PATRONYMICS].any? do |names|
          names[sex].include?(word)
        end
      end
    end
  end
end
