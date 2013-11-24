# encoding: utf-8

module Faker
  module Company
    extend ModuleUtils
    extend self

    def name
      case rand(3)
      when 0 then "#{Name.last_name} #{suffix}"
      when 1 then "#{Name.last_name}-#{Name.last_name}"
      when 2 then "%s, %s and %s" % [ Name.last_name, Name.last_name, Name.last_name ]
      end
    end

    def suffix
      SUFFIXES.rand
    end

    # Generate a buzzword-laden catch phrase.
    # Wordlist from http://www.1728.com/buzzword.htm
    def catch_phrase
      "#{CATCH_PRE.rand} #{CATCH_MID.rand} #{CATCH_POS.rand}"
    end

    # When a straight answer won't do, BS to the rescue!
    # Wordlist from http://dack.com/web/bullshit.html
    def bs
      "#{BS_PRE.rand} #{BS_MID.rand} #{BS_POS.rand}"
    end

    def position
      case rand(3)
      when 0 then [POSITION_PREFIXES.rand, POSITIONS.rand]
      when 1 then [POSITION_AREAS.rand, POSITIONS.rand]
      when 2 then [POSITION_PREFIXES.rand, POSITION_AREAS.rand, POSITIONS.rand]
      end.join(' ')
    end

    SUFFIXES = k %w(Inc and\ Sons LLC Group)

    POSITION_PREFIXES = k %w[Executive Assistant General Associate]
    POSITIONS = k %w[President Manager Director Secretary Consultant]
  end
end
