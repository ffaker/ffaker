# frozen_string_literal: true

require_relative 'helper'
require 'date'

class TestFakerTime < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::Time, :date, :datetime, :month, :day_of_week)

  def setup
    @tester = FFaker::Time
  end

  def test_date
    assert_instance_of Date, @tester.date
  end

  def test_day_of_week
    day_of_week_short_regex = /\A(?:Mon|Tue|Wed|Thu|Fri|Sat|Sun)\z/
    day_of_week_long_regex = /\A(?:Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday)\z/
    assert_match(day_of_week_short_regex, @tester.day_of_week)
    assert_match(day_of_week_long_regex, @tester.day_of_week(long: true))
    assert_deterministic { @tester.day_of_week }
  end

  def test_datetime
    assert_instance_of DateTime, @tester.datetime
  end

  def test_datetime_random_days_and_months
    1_000.times do
      @tester.datetime
    end
  end

  def test_datetime_hours_and_minutes
    assert_equal(4, @tester.datetime(hours: 4, minutes: 20).hour)
    assert_equal(20, @tester.datetime(hours: 4, minutes: 20).min)
    assert_deterministic { @tester.datetime(hours: 4, minutes: 20) }
  end

  def test_datetime_year_range_and_year_latest
    current_year = ::DateTime.now.year
    [[0, 0], [1, 1], [2, 4], [8, 6]].each do |year_range, year_latest|
      assert_random_between(
        (current_year - year_range - year_latest)..(current_year - year_latest)
      ) do
        @tester.datetime(year_range: year_range, year_latest: year_latest).year
      end
    end
  end

  def test_month
    month_regex = /\A(?:January|February|March|April|May|June|July|August|September|October|November|December)\z/
    assert_match(month_regex, @tester.month)
  end

  def test_between_for_time
    from = Time.local(2015, 1, 1)
    to   = Time.local(2016, 1, 1)

    assert_random_between(from..to) { @tester.between(from, to) }
  end

  def test_between_for_string
    from = @tester.datetime
    to   = @tester.datetime
    random_date = @tester.between(from, to)
    assert_instance_of Time, random_date
  end

  def test_between_for_date
    from = Date.new(2015, 1, 1)
    to   = Date.new(2016, 1, 1)
    random_date = @tester.between(from, to)
    assert_instance_of Time, random_date
  end

  def test_between_for_datetime
    from = DateTime.new(2015, 1, 1, 12, 12)
    to   = DateTime.new(2016, 1, 1, 12, 12)
    random_date = @tester.between(from, to)
    assert_instance_of Time, random_date
  end

  def test_convert_to_time_string
    time = @tester.send(:convert_to_time, '2012-12-12 12:12')
    assert_instance_of Time, time
  end

  def test_convert_to_time_date
    time = @tester.send(:convert_to_time, Date.new(2015, 1, 1))
    assert_instance_of Time, time
  end

  def test_convert_to_time_datetime
    time = @tester.send(:convert_to_time, DateTime.new(2015, 1, 1, 12, 12))
    assert_instance_of Time, time
  end
end
