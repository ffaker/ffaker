# frozen_string_literal: true
# encoding: utf-8

require 'helper'

class TestFakerNameAR < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::NameAR,
    :first_name_male, :first_name_female, :last_name,
    :name_male, :name_female
  )

  def setup
    @tester = FFaker::NameAR
  end

  def test_first_name_male
    assert_include(@tester::FIRST_NAMES_MALE, @tester.first_name_male)
  end

  def test_first_name_female
    assert_include(@tester::FIRST_NAMES_FEMALE, @tester.first_name_female)
  end

  def test_last_name
    assert_include(@tester::LAST_NAMES, @tester.last_name)
  end

  def test_name_male
    first_name, last_name = @tester.name_male.split(/\s+/, 2)
    assert_include(@tester::FIRST_NAMES_MALE, first_name)
    assert_include(@tester::LAST_NAMES, last_name)
  end

  def test_name_female
    first_name, last_name = @tester.name_female.split(/\s+/, 2)
    assert_include(@tester::FIRST_NAMES_FEMALE, first_name)
    assert_include(@tester::LAST_NAMES, last_name)
  end
end
