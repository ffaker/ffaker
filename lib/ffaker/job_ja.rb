# encoding: utf-8

module Faker
  module JobJA
    extend ModuleUtils
    extend self

    def title
      JOB_NOUNS.sample
    end
  end
end
