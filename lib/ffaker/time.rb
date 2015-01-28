# encoding: utf-8

module Faker
  module Time
    extend ModuleUtils
    extend self

    MONTHS = %w(January February March April May June July August September October November December)

    def month
      MONTHS.sample
    end

    def date(params={})
      years_back = params[:year_range] || 5
      latest_year  = params [:year_latest] || 0
      year = (rand * (years_back)).ceil + (::Time.now.year - latest_year - years_back)
      month = (rand * 12).ceil
      day = (rand * 31).ceil
      series = [date = ::Time.local(year, month, day)]
      if params[:series]
        params[:series].each do |some_time_after|
          series << series.last + (rand * some_time_after).ceil
        end
        return series
      end
      date.strftime "%Y-%m-%d %T %z"
    end
  end
end
