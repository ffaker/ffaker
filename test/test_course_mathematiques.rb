require "helper"

class TestCourseMathematiques < Test::Unit::TestCase
  def setup
    @subject = Faker::CoursesFR::Mathematiques
  end

  def test_lesson
    assert @subject::LESSONS.include?(@subject.lesson)
  end
end
