# encoding: utf-8

module FFaker
  module Animal
    extend ModuleUtils
    extend self

    # @deprecated US animals name. Moved into {AnimalUS}
    def common_name
      warn '[common_name] is deprecated. For animal names in english please use the AnimalsUS module'
      fetch_sample(COMMON_NAMES)
    end
  end
end
