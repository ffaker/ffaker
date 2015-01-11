require "helper"

class TestCourseMathematiques < Test::Unit::TestCase
  def setup
    @subject = FFaker::CoursesFR::Mathematiques
  end

  def test_lesson
    assert @subject::LESSONS.include?(@subject.lesson)
  end
end
