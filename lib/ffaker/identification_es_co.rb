# encoding: utf-8

require 'ffaker/identification_es'
require "date"

module Faker
  module IdentificationESCO
    include IdentificationES

    extend ModuleUtils
    extend self

    BLOOD_TYPE = %w(A B O AB)
    LICENSE_CATEGORY = %w(A B C)

    def drivers_license
      how_many_numbers = 6 + rand(8)
      Faker.numerify("#" * how_many_numbers)
    end

  alias_method :id, :drivers_license

    def driver_license_category
      category = LICENSE_CATEGORY.sample
      # the categories are A1 A2 B1 B2 B3 C1 C2 C3
      num = category == 'A' ? 1 + rand(2) : 1 + rand(3)
      "#{category}#{num}"
    end

    def blood_type #RH
      sign = %w(+ -).sample
      "#{BLOOD_TYPE.sample}#{sign}"
    end

    def expedition_date
      today = Date.today
      today - rand(today.year)
    end

  end
end
