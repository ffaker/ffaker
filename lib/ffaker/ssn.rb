# encoding: utf-8

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
      first_group  = [rand(1..665), rand(667..899)].sample
      second_group = rand(1..99)
      third_group  = rand(1..9999)

      group_numbers = [first_group, second_group, third_group]
      result = '%.3d-%.2d-%.4d' % group_numbers

      result
    end
  end
end
