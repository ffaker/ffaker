# encoding: utf-8

require 'helper'

class TestFakerTime < Test::Unit::TestCase
  def setup
    @tester = Faker::Time
  end

  def test_date
    date_regex = /^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2} [-|+]\d{4}$/
    assert_match date_regex, @tester.date.to_s
  end

  def test_month
    month_regex = /(January|February|March|April|May|June|July|August|September|October|November|December)/
    assert_match month_regex, @tester.month
  end
end
