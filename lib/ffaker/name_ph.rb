# encoding: utf-8

require 'ffaker/name'

module FFaker
  # Philippine names based on http://en.wikipedia.org/wiki/Philippine_name
  module NamePH
    include FFaker::Name

    extend ModuleUtils
    extend self

    def last_name
      case rand(0..1)
      when 0 then fetch_sample(AUTOCHTHONOUS_SURNAMES)
      else        fetch_sample(SPANISH_SURNAMES)
      end
    end

    def name
      case rand(0..8)
      when 0 then "#{prefix} #{first_name} #{last_name}"
      else        "#{first_name} #{last_name}"
      end
    end
  end
end
