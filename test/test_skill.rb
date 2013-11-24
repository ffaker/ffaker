# encoding: utf-8

require 'helper'

class TestSkill < Test::Unit::TestCase

  def test_tech_skill
    assert_match /[a-z]+/i, Faker::Skill.tech_skill
  end

  def test_tech_skills
    tech_skills = Faker::Skill.tech_skills
    assert_instance_of Array, tech_skills
  end

  def test_specialty
    assert_match /[ a-z]+/i, Faker::Skill.specialty
  end

  def test_specialties
    specialties = Faker::Skill.specialties
    assert_instance_of Array, specialties
  end
end
