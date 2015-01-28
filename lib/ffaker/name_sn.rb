# encoding: utf-8

module Faker
  # Author PapePathe<pathe.sene@gmail.com> github.com/PapePathe
  # The names & first names in this module were found at this url:
  # http://www.senegalaisement.com/senegal/noms_et_prenoms.html
  module NameSN
    extend ModuleUtils
    extend self

    PREFIX_FEMALE = %w(adja adjaratou mame ndeye)
    PREFIX_MALE = %w(pape eladji mame serigne)

    def last_name
      LAST_NAMES.sample
    end

    def first_name_male
      FIRST_NAMES_MALE.sample
    end

    def first_name_female
      FIRST_NAMES_FEMALE.sample
    end

    def prefix_male
      PREFIX_MALE.sample
    end

    def prefix_female
      PREFIX_FEMALE.sample
    end

    def name_male
      case rand(10)
        when 7 then "#{prefix_male} #{first_name_male} #{last_name}"
        when 5 then "#{prefix_male} #{first_name_male} #{last_name}"
        when 3 then "#{first_name_male} #{last_name}"
        when 0 then "#{first_name_male} #{last_name}"
        else        "#{first_name_male} #{last_name}"
      end
    end

    def name_female
      case rand(10)
        when 7 then "#{prefix_female} #{first_name_female} #{last_name}"
        when 5 then "#{prefix_female} #{first_name_female} #{last_name}"
        when 3 then "#{first_name_female} #{last_name}"
        when 0 then "#{first_name_female} #{last_name}"
        else        "#{first_name_female} #{last_name}"
      end
    end

    def name_sn
      case rand(10)
        when 7 then "#{prefix_female} #{first_name_female} #{last_name}"
        when 5 then "#{prefix_male} #{first_name_male} #{last_name}"
        when 3 then "#{first_name_male} #{last_name}"
        when 3 then "#{first_name_female} #{last_name}"
        when 0 then "#{first_name_male} #{last_name}"
        else        "#{first_name_female} #{last_name}"
      end
    end
  end
end
