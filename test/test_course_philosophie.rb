require "helper"

class TestCoursePhilosophie < Test::Unit::TestCase
  def setup
    @subject = Faker::CoursesFR::Philosophie
  end

  def test_lesson
    assert @subject::LESSONS.include?(@subject.lesson)
  end
end
