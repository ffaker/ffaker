require "helper"

class TestCoursesMathematiques < Test::Unit::TestCase
  def setup
    @subject = Faker::Courses::Mathematiques
  end

  def test_lesson
    assert @subject::LESSONS.include?(@subject.lesson)
  end

end
