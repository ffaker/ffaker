# encoding: utf-8

module Faker
  module Vehicle
    extend ModuleUtils
    extend self

    DRIVETRAINS = %w(4WD 4X4 AWD FWD RWD)
    YEARS = [*'1900'.."#{Date.today.year+1}"]
    COLOR_PREFIXES = k(%w(
      beautiful bright calm dangerous dark dull fast magnetic magnificent majestic melodic metallic
      mundane mute mysterious new pleasant pretty resonant royal slate soft tranquil vibrant weak
    ))

    def base_color
      Faker::Color.name
    end

    def drivetrain
      DRIVETRAINS.sample
    end

    def make
      MAKES_LIST.sample
    end

    def manufacturer_color(n=2)
      # Take two prefixes because it's more fun than one
      [COLOR_PREFIXES.random_pick(n), self.base_color].flatten.join(' ')
    end
    alias_method :mfg_color, :manufacturer_color

    def model
      MODELS_LIST.sample
    end

    def trim
      TRIMS_LIST.sample
    end

    def vin
      Faker.bothify('1#???#####?######').upcase
    end

    def year
      YEARS.sample
    end
  end
end
