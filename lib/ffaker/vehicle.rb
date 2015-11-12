# encoding: utf-8

module FFaker
  module Vehicle
    extend ModuleUtils
    extend self

    DRIVETRAINS = %w(4WD 4X4 AWD FWD RWD)
    YEARS = [*'1900'.."#{Date.today.year+1}"]
    COLOR_PREFIXES = k(%w(
      beautiful bright calm dangerous dark dull fast magnetic magnificent majestic melodic metallic
      mundane mute mysterious new pleasant pretty resonant royal slate soft tranquil vibrant weak
    ))
    TRANSMISSIONS_ABBR = %w(AT MT AM CVT)
    CYLINDERS = %w(2 5 6 8)

    def base_color
      FFaker::Color.name
    end

    def drivetrain
      DRIVETRAINS.sample
    end

    def make
      MAKES_LIST.sample
    end

    def manufacturer_color(n=2)
      # Take two prefixes because it's more fun than one
      (COLOR_PREFIXES.sample(n) + [base_color]).join(' ')
    end
    alias_method :mfg_color, :manufacturer_color

    def model
      MODELS_LIST.sample
    end

    def trim
      TRIMS_LIST.sample
    end

    def vin
      FFaker.bothify('1#???#####?######').upcase
    end

    def year
      YEARS.sample
    end

    def transmission
      TRANSMISSIONS_LIST.sample
    end

    def transmission_abbr
      TRANSMISSIONS_ABBR.sample
    end

    def engine_cylinders
      CYLINDERS.sample
    end

    def engine_displacement
      DISPLACEMENTS_LIST.sample
    end

    def fuel_type
      FUEL_TYPES_LIST.sample
    end

    def interior_upholstery
      UPHOLSTERY_LIST.sample
    end
  end
end
