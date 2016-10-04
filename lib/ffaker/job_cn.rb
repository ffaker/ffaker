# encoding: utf-8

module FFaker
  module JobCN
    extend ModuleUtils
    extend self

    def title
      fetch_sample(JOB_NOUNS)
    end
  end
end
