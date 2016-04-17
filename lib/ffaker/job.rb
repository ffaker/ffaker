# encoding: utf-8

module FFaker
  module Job
    extend ModuleUtils
    extend self

    def title
      "#{JOB_PREFIX.sample} #{JOB_ADJ.sample} #{JOB_NOUN.sample}"
    end
  end
end
