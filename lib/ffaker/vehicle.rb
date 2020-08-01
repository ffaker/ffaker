# frozen_string_literal: true

module FFaker
  module Vehicle
    extend ModuleUtils
    extend self

    DRIVETRAINS = %w[4WD 4X4 AWD FWD RWD].freeze
    YEARS = Array('1900'..(::Time.now.year + 1).to_s).freeze
    TRANSMISSIONS_ABBR = %w[AT MT AM CVT].freeze
    CYLINDERS = %w[2 5 6 8].freeze

    def base_color
      FFaker::Color.name
    end

    def drivetrain
      fetch_sample(DRIVETRAINS)
    end

    def make
      fetch_sample(MAKES_LIST)
    end

    def manufacturer_color(count = 2)
      # Take two prefixes because it's more fun than one
      (fetch_sample(COLOR_PREFIXES, count: count) + [base_color]).join(' ')
    end
    alias mfg_color manufacturer_color

    def model
      fetch_sample(MODELS_LIST)
    end

    def trim
      fetch_sample(TRIMS_LIST)
    end

    def vin
      FFaker.bothify('1#???#####?######').upcase
    end

    def year
      fetch_sample(YEARS)
    end

    def transmission
      fetch_sample(TRANSMISSIONS_LIST)
    end

    def transmission_abbr
      fetch_sample(TRANSMISSIONS_ABBR)
    end

    def engine_cylinders
      fetch_sample(CYLINDERS)
    end

    def engine_displacement
      fetch_sample(DISPLACEMENTS_LIST)
    end

    def fuel_type
      fetch_sample(FUEL_TYPES_LIST)
    end

    def interior_upholstery
      fetch_sample(UPHOLSTERY_LIST)
    end
  end
end
