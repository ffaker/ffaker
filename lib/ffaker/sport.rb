module FFaker
  module Sport
    extend ModuleUtils
    extend self

    def name
      fetch_sample(NAMES)
    end
  end
end
