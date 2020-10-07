# frozen_string_literal: true

module FFaker
  module FoodPL
    extend ModuleUtils
    extend self

    def food
      case rand(0..1)
      when 0 then processed
      when 1 then unprocessed
      end
    end

    def processed
      case rand(0..2)
      when 0 then fermented
      when 1 then diary
      when 2 then preserves
      end
    end

    def unprocessed
      case rand(0..4)
      when 0 then vegetable
      when 1 then fruit
      when 2 then herb
      when 3 then spice
      when 4 then meat
      end
    end

    def vegetable
      fetch_sample(VEGETABLES)
    end

    def fruit
      fetch_sample(FRUITS)
    end

    def herb
      fetch_sample(HERBS)
    end

    def spice
      fetch_sample(SPICES)
    end

    def meat
      fetch_sample(MEATS)
    end

    def fermented
      fetch_sample(FERMENTED)
    end

    def diary
      fetch_sample(DIARY)
    end

    def preserves
      fetch_sample(PRESERVES)
    end
  end
end
