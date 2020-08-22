# frozen_string_literal: true

require 'date'

module FFaker
  module IdentificationESCO
    include IdentificationES

    extend ModuleUtils
    extend self

    BLOOD_TYPE = %w[A B O AB].freeze
    LICENSE_CATEGORY = %w[A B C].freeze

    def drivers_license
      how_many_numbers = rand(6..13)
      FFaker.numerify('#' * how_many_numbers)
    end

    alias id drivers_license

    def driver_license_category
      category = fetch_sample(LICENSE_CATEGORY)
      # the categories are A1 A2 B1 B2 B3 C1 C2 C3
      num = category == 'A' ? rand(1..2) : rand(1..3)
      "#{category}#{num}"
    end

    def blood_type
      sign = fetch_sample(%w[+ -])
      "#{fetch_sample(BLOOD_TYPE)}#{sign}"
    end

    def expedition_date
      today = Date.today
      today - rand(today.year)
    end
  end
end
