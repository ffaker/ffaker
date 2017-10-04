# encoding: utf-8

module FFaker
  module UniversityJa
    extend ModuleUtils
    extend self

    def name
      fetch_sample(UniversityJa)
    end
  end
end
