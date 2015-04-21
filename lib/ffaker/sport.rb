module FFaker
  module Sport
    extend ModuleUtils
    extend self

    def name
      NAMES.sample
    end
  end
end
