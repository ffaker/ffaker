# encoding: UTF-8

module Faker
  module JobFR
    extend ModuleUtils
    extend self

    JOB_ADJECTIVES = ['', 'general', '', 'adjoint', '', 'associé', '']

    def title
      "#{JOB_PREFIXES.sample} #{JOB_ADJECTIVES.sample} #{JOB_NOUNS.sample}"
    end
  end
end
