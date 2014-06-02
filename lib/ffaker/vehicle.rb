# encoding: utf-8

module Faker
  module Vehicle
    extend ModuleUtils
    extend self

    def base_color
      Faker::Color.name
    end

    def drivetrain
      DRIVETRAINS.rand
    end

    def make
      MAKES_LIST.rand
    end

    def manufacturer_color(n=2)
      # Take two prefixes because it's more fun than one
      [COLOR_PREFIXES.random_pick(n), self.base_color].flatten.join(' ')
    end
    alias_method :mfg_color, :manufacturer_color

    def model
      MODELS_LIST.rand
    end

    def trim
      TRIMS_LIST.rand
    end

    def vin
      Faker.bothify('1#???#####?######').upcase
    end

    def year
      YEARS.rand
    end

    DRIVETRAINS = k(%w(4WD 4X4 AWD FWD RWD))
    YEARS = k('1900'.."#{Date.today.year+1}")
    COLOR_PREFIXES = k(%w(
      beautiful bright calm dangerous dark dull fast magnetic magnificent majestic melodic metallic
      mundane mute mysterious new pleasant pretty resonant royal slate soft tranquil vibrant weak
    ))

  end
end
