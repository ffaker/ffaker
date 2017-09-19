# encoding: utf-8

module FFaker
  module Vehicle
    extend ModuleUtils
    extend self

    DRIVETRAINS = %w[4WD 4X4 AWD FWD RWD].freeze
    YEARS = [*'1900'..(Date.today.year + 1).to_s].freeze
    COLOR_PREFIXES = k(%w[
                         beautiful bright calm dangerous dark dull fast magnetic magnificent majestic melodic metallic
                         mundane mute mysterious new pleasant pretty resonant royal slate soft tranquil vibrant weak
                       ])
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

    def manufacturer_color(n = 2)
      # Take two prefixes because it's more fun than one
      (fetch_sample(COLOR_PREFIXES, count: n) + [base_color]).join(' ')
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
