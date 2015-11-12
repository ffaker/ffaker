# encoding: UTF-8

module FFaker
  module JobFR
    extend ModuleUtils
    extend self

    JOB_ADJECTIVES = %w(general adjoint associé)

    def title
      if rand(2).zero?
        "#{JOB_PREFIXES.sample} #{JOB_ADJECTIVES.sample} #{JOB_NOUNS.sample}"
      else
        "#{JOB_PREFIXES.sample} #{JOB_NOUNS.sample}"
      end
    end
  end
end
