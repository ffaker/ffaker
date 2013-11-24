# encoding: UTF-8

module Faker
  module JobFR
    extend ModuleUtils
    extend self

    JOB_ADJECTIVES = k ['', 'general', '', 'adjoint', '', 'associé', '']

    def title
      "#{JOB_PREFIXES.rand} #{JOB_ADJECTIVES.rand} #{JOB_NOUNS.rand}"
    end
  end
end
