# frozen_string_literal: true

module FFaker
  module JobVN
    extend ModuleUtils
    extend self

    def title
      fetch_sample(JOB_NOUNS)
    end
  end
end
