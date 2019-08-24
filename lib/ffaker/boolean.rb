# frozen_string_literal: true

module FFaker
  module Boolean
    extend ModuleUtils
    extend self

    def maybe
      case rand(0..1)
      when 0 then true
      when 1 then false
      end
    end

    alias random maybe
    alias sample maybe
  end
end
