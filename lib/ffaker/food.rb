# frozen_string_literal: true

module FFaker
  module Food
    extend ModuleUtils
    extend self

    def ingredient
      send(%w[vegetable fruit meat herb_or_spice][rand 4])
    end

    def vegetable
      fetch_sample(VEGETABLE)
    end

    def fruit
      fetch_sample(FRUIT)
    end

    def meat
      fetch_sample(MEAT)
    end

    def herb_or_spice
      fetch_sample(HERB_SPICE)
    end
  end
end
