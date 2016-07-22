require 'helper'

class TestCourseMathematiques < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::CoursesFR::Mathematiques, :lesson)

  def setup
    @subject = FFaker::CoursesFR::Mathematiques
  end

  def test_lesson
    assert @subject::LESSONS.include?(@subject.lesson)
  end
end
