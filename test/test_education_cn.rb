# encoding: utf-8

require 'helper'

class TestFakerEducationCN < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::EducationCN,
    :degree_short, :degree, :major,
    :location, :school
  )

  def setup
    @tester = FFaker::EducationCN
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

  def test_location
    assert @tester.location.match()
  end

  def test_school
    assert @tester.school.match(/.+ .+( .+)?/)
  end
end
