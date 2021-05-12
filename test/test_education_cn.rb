# frozen_string_literal: true

require_relative 'helper'

class TestFakerEducationCN < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::EducationCN, :degree, :major, :location, :school)

  def setup
    @tester = FFaker::EducationCN
  end

  def test_degree
    assert @tester.degree.match(/[\u4e00-\u9fa5]{4,}/)
  end

  def test_major
    assert @tester.major.match(/[\u4e00-\u9fa5]{2,}/)
  end

  def test_location
    assert @tester.location.match(/[\u4e00-\u9fa5]{2,}/)
  end

  def test_school
    assert @tester.school.match(/[\u4e00-\u9fa5]{4,}/)
  end
end
