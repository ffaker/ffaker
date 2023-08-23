# frozen_string_literal: true

module FFaker
  module SSN
    extend ModuleUtils
    extend self

    # The Social Security number is a nine-digit number in the format
    # "AAA-GG-SSSS". More info here:
    #
    # http://en.wikipedia.org/wiki/Social_Security_number
    #
    def ssn
      first_group  = fetch_sample([*1..665, *667..899])
      second_group = rand(1..99)
      third_group  = rand(1..9999)

      format(
        '%<first_group>.3d-%<second_group>.2d-%<third_group>.4d',
        first_group: first_group, second_group: second_group, third_group: third_group
      )
    end
  end
end
