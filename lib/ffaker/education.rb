# encoding: utf-8

module Faker
  module Education
    extend ModuleUtils
    extend self

    def degree_short
      "#{DEGREE_SHORT_PREFIX.sample} in #{major}"
    end

    def degree
      "#{DEGREE_PREFIX.sample} in #{major}"
    end

    def major
      "#{MAJOR_ADJ.sample} #{MAJOR_NOUN.sample}"
    end

    def school_name
      SCHOOL_PREFIX.sample + SCHOOL_SUFFIX.sample
    end

    def school_generic_name
      case rand(2)
      when 0 then AddressUS::STATE.sample
      when 1 then school_name
      end
    end

    def school
      case rand(5)
      when (0..1)  then "#{school_name} #{SCHOOL_TYPE.sample}"
      when 2 then "#{school_generic_name} #{SCHOOL_ADJ.sample} #{SCHOOL_TYPE.sample}"
      when 3 then "#{SCHOOL_UNI.sample} of #{school_generic_name}"
      when 4 then "#{school_generic_name} #{SCHOOL_TYPE.sample} of #{MAJOR_NOUN.sample}"
      end
    end

    DEGREE_SHORT_PREFIX = k %w(AB BS BSc MA MD DMus DPhil)
    DEGREE_PREFIX = k ['Bachelor of Science', 'Bachelor of Arts', 'Master of Arts', 'Doctor of Medicine', 'Bachelor of Music', 'Doctor of Philosophy']
    MAJOR_ADJ = k(%w(Business Systems Industrial Medical Financial Marketing Political Social) + ['Human Resource'])
    SCHOOL_PREFIX = k %w(Green South North Wind Lake Hill Lark River Red White)
    SCHOOL_ADJ = k %w(International Global Polytechnic National)
    SCHOOL_TYPE = k %w(School University College Institution Academy)
    SCHOOL_UNI  = k %w(University College)
  end
end
