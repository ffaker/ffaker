require 'helper'

class TestCoursePhilosophie < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::CoursesFR::Philosophie, :lesson)

  def setup
    @subject = FFaker::CoursesFR::Philosophie
  end

  def test_lesson
    assert @subject::LESSONS.include?(@subject.lesson)
  end
end
