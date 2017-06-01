# encoding: utf-8

module FFaker
  module Animals
    extend ModuleUtils
    extend self

    def animal
      fetch_sample(ANIMALS)
    end
    
  end
end
