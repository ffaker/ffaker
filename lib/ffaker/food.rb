module Faker
  module Food
    extend ModuleUtils
    extend self

    def ingredient
      self.send( %w(vegetable fruit meat herb_or_spice)[rand 4] )
    end

    def vegetable
      VEGETABLE.sample
    end

    def fruit
      FRUIT.sample
    end

    def meat
      MEAT.sample
    end

    def herb_or_spice
      HERB_SPICE.sample
    end

  end
end
