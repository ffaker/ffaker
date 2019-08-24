# frozen_string_literal: true

module FFaker
  module Job
    extend ModuleUtils
    extend self

    def title
      "#{fetch_sample(JOB_PREFIX)} #{fetch_sample(JOB_ADJ)} #{fetch_sample(JOB_NOUN)}"
    end
  end
end
