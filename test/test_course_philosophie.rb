require 'test_helper'

class TestCoursePhilosophie < Minitest::Test
  def setup
    @subject = FFaker::CoursesFR::Philosophie
  end

  def test_lesson
    assert @subject::LESSONS.include?(@subject.lesson)
  end
end
