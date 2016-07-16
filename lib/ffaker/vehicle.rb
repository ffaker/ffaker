# encoding: utf-8

module FFaker
  module Vehicle
    extend ModuleUtils
    extend self

    DRIVETRAINS = %w(4WD 4X4 AWD FWD RWD).freeze
    YEARS = [*'1900'..(Date.today.year + 1).to_s].freeze
    COLOR_PREFIXES = k(%w(
                         beautiful bright calm dangerous dark dull fast magnetic magnificent majestic melodic metallic
                         mundane mute mysterious new pleasant pretty resonant royal slate soft tranquil vibrant weak
                       ))
    TRANSMISSIONS_ABBR = %w(AT MT AM CVT).freeze
    CYLINDERS = %w(2 5 6 8).freeze

    def base_color
      FFaker::Color.name
    end

    def drivetrain
      fetch(DRIVETRAINS)
    end

    def make
      fetch(MAKES_LIST)
    end

    def manufacturer_color(n = 2)
      # Take two prefixes because it's more fun than one
      (fetch(COLOR_PREFIXES, count: n) + [base_color]).join(' ')
    end
    alias mfg_color manufacturer_color

    def model
      fetch(MODELS_LIST)
    end

    def trim
      fetch(TRIMS_LIST)
    end

    def vin
      FFaker.bothify('1#???#####?######').upcase
    end

    def year
      fetch(YEARS)
    end

    def transmission
      fetch(TRANSMISSIONS_LIST)
    end

    def transmission_abbr
      fetch(TRANSMISSIONS_ABBR)
    end

    def engine_cylinders
      fetch(CYLINDERS)
    end

    def engine_displacement
      fetch(DISPLACEMENTS_LIST)
    end

    def fuel_type
      fetch(FUEL_TYPES_LIST)
    end

    def interior_upholstery
      fetch(UPHOLSTERY_LIST)
    end
  end
end
