# encoding: utf-8

require 'date'

module FFaker
  module Time
    extend ModuleUtils
    extend self

    MONTHS = %w[January February March April May June July August September October November December].freeze
    DAYS_OF_WEEK = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday].freeze

    def month
      fetch_sample(MONTHS)
    end

    def day_of_week(options = {})
      fetch_sample(DAYS_OF_WEEK)[0..(options[:long] ? 10 : 2)]
    end

    def date(params = {})
      years_back = params[:year_range] || 5
      latest_year = params [:year_latest] || 0
      year = (rand * years_back).ceil + (::Time.now.year - latest_year - years_back)
      month = (rand * 12).ceil
      day = (rand * 31).ceil
      hours = params[:hours] || 0
      minutes = params[:minutes] || 0
      series = [date = ::Time.local(year, month, day, hours, minutes)]
      if params[:series]
        params[:series].each do |some_time_after|
          series << series.last + (rand * some_time_after).ceil
        end
        return series
      end
      date.strftime '%Y-%m-%d %T %z'
    end

    def datetime(params = {})
      hours = params[:hours] || (rand * 12).ceil
      minutes = params[:minutes] || (rand * 59).ceil
      date(params.merge(hours: hours, minutes: minutes))
    end

    def between(from, to)
      from_value = convert_to_time(from)
      to_value = convert_to_time(to)
      ::Time.at(from_value + rand * (to_value.to_f - from_value.to_f))
    end

    private

    def convert_to_time(value)
      case value.class.name
      when 'String'
        DateTime.parse(value).to_time
      when 'Date', 'DateTime', 'ActiveSupport::TimeWithZone'
        value.to_time
      when 'Time'
        value
      else
        raise "FFaker cannot convert #{value.class} '#{value}' to Time"
      end
    end
  end
end
