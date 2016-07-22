# encoding: utf-8

require 'helper'

class TestFakerEducation < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::Education,
    :degree_short, :degree, :major,
    :school_name, :school_generic_name, :school
  )

  def setup
    @tester = FFaker::Education
  end

  def test_degree_short
    assert @tester.degree_short.match(/.+ in .+/)
  end

  def test_degree
    assert @tester.degree.match(/.+ in .+/)
  end

  def test_major
    assert @tester.major.match(/.+ .+/)
  end

  def test_school_name
    assert @tester.school_name.match(/.+/)
  end

  def test_school_generic_name
    assert @tester.school_generic_name.match(/.+/)
  end

  def test_school
    assert @tester.school.match(/.+ .+( .+)?/)
  end
end
