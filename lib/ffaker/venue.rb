# encoding: utf-8

module FFaker
  module Venue
    extend ModuleUtils
    extend self

    def name
      fetch_sample(VENUE_LIST)
    end
  end
end
