module Faker
  module Education
    extend ModuleUtils
    extend self

    def degree_short
      "#{DEGREE_SHORT_PREFIX.rand} in #{major}"
    end

    def degree
      "#{DEGREE_PREFIX.rand} in #{major}"
    end

    def major
      "#{MAJOR_ADJ.rand} #{MAJOR_NOUN.rand}"
    end

    def school_name
      SCHOOL_PREFIX.rand + SCHOOL_SUFFIX.rand
    end

    def school_generic_name
      case rand(2)
      when 0 then Address::STATE.rand
      when 1 then school_name
      end
    end

    def school
      case rand(5)
      when (0..1)  then "#{school_name} #{SCHOOL_TYPE.rand}"
      when 2 then "#{school_generic_name} #{SCHOOL_ADJ.rand} #{SCHOOL_TYPE.rand}"
      when 3 then "#{SCHOOL_UNI.rand} of #{school_generic_name}"
      when 4 then "#{school_generic_name} #{SCHOOL_TYPE.rand} of #{MAJOR_NOUN.rand}"
      end
    end

    DEGREE_SHORT_PREFIX = k %w(AB BS BSc MA MD DMus DPhil)
    DEGREE_PREFIX = k ['Bachelor of Science', 'Bachelor of Arts', 'Master of Arts', 'Doctor of Medicine', 'Bachelor of Music', 'Doctor of Philosophy']
    MAJOR_ADJ = k(%w(Business Systems Industrial Medical Financial Marketing Political Social) + ['Human Resource'])
    MAJOR_NOUN = k %w(Science Arts Administration Engineering Management Production Economics Architecture Accountancy Education Development Philosophy Studies)

    SCHOOL_PREFIX = k %w(Green South North Wind Lake Hill Lark River Red White)
    SCHOOL_SUFFIX = k %w(wood dale ridge ville point field shire shore crest spur well side coast)
    SCHOOL_ADJ = k %w(International Global Polytechnic National)
    SCHOOL_TYPE = k %w(School University College Institution Academy)
    SCHOOL_UNI  = k %w(University College)
  end
end
