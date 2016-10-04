# encoding: utf-8

module FFaker
  module JobKR
    extend ModuleUtils
    extend self

    def title
      fetch_sample(JOB_NOUNS)
    end
  end
end
