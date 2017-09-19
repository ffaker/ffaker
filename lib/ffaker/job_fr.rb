# encoding: UTF-8

module FFaker
  module JobFR
    extend ModuleUtils
    extend self

    JOB_ADJECTIVES = %w[general adjoint associé].freeze

    def title
      if rand(0..1).zero?
        "#{fetch_sample(JOB_PREFIXES)} #{fetch_sample(JOB_ADJECTIVES)} #{fetch_sample(JOB_NOUNS)}"
      else
        "#{fetch_sample(JOB_PREFIXES)} #{fetch_sample(JOB_NOUNS)}"
      end
    end
  end
end
