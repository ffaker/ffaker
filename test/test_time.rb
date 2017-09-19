# encoding: utf-8

require 'helper'

class TestFakerTime < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::Time, :date, :datetime, :month, :day_of_week)

  def setup
    @tester = FFaker::Time
  end

  def test_date
    date_regex = /\A\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2} [-|+]\d{4}\z/
    assert_match(date_regex, @tester.date)
  end

  def test_day_of_week
    day_of_week_short_regex = /\A(?:Mon|Tue|Wed|Thu|Fri|Sat|Sun)\z/
    day_of_week_long_regex = /\A(?:Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday)\z/
    assert_match(day_of_week_short_regex, @tester.day_of_week)
    assert_match(day_of_week_long_regex, @tester.day_of_week(long: true))
    assert_deterministic { @tester.day_of_week }
  end

  def test_date_hours_and_minutes
    assert_match('04:20:00', @tester.date(hours: 4, minutes: 20))
    assert_deterministic { @tester.date(hours: 4, minutes: 20) }
  end

  def test_datetime
    date_regex = /\A\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2} [-|+]\d{4}\z/
    assert_match(date_regex, @tester.datetime)
  end

  def test_datetime_hours_and_minutes
    assert_match('04:20:00', @tester.datetime(hours: 4, minutes: 20))
    assert_deterministic { @tester.datetime(hours: 4, minutes: 20) }
  end

  def test_month
    month_regex = /\A(?:January|February|March|April|May|June|July|August|September|October|November|December)\z/
    assert_match(month_regex, @tester.month)
  end

  def test_between
    from = Time.local(2015, 1, 1)
    to   = Time.local(2016, 1, 1)

    100.times do
      random_date = @tester.between(from, to)
      assert random_date >= from, "Expected >= \"#{from}\", but got #{random_date}"
      assert random_date <= to, "Expected <= \"#{to}\", but got #{random_date}"
      assert_deterministic { @tester.between(from, to) }
    end
  end
end
