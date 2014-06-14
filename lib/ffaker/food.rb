module Faker
  module Food
    extend ModuleUtils
    extend self

    def ingredient
      self.send( %w(vegetable fruit meat herb_or_spice)[rand 4] )
    end

    def vegetable
      VEGETABLE.rand
    end

    def fruit
      FRUIT.rand
    end

    def meat
      MEAT.rand
    end

    def herb_or_spice
      HERB_SPICE.rand
    end

  end
end