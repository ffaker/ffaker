# encoding: utf-8

module FFaker
  module Job
    extend ModuleUtils
    extend self

    def title
      "#{JOB_PREFIX.rand} #{JOB_ADJ.rand} #{JOB_NOUN.rand}"
    end
  end
end
