# encoding: utf-8

module Faker
  module Company
    extend ModuleUtils
    extend self

    SUFFIXES = %w(Inc and\ Sons LLC Group)
    POSITION_PREFIXES = %w[Executive Assistant General Associate]
    POSITIONS = %w[President Manager Director Secretary Consultant]

    def name
      case rand(3)
      when 0 then "#{Name.last_name} #{suffix}"
      when 1 then "#{Name.last_name}-#{Name.last_name}"
      when 2 then "%s, %s and %s" % [ Name.last_name, Name.last_name, Name.last_name ]
      end
    end

    def suffix
      SUFFIXES.sample
    end

    # Generate a buzzword-laden catch phrase.
    # Wordlist from http://www.1728.com/buzzword.htm
    def catch_phrase
      "#{CATCH_PRE.sample} #{CATCH_MID.sample} #{CATCH_POS.sample}"
    end

    # When a straight answer won't do, BS to the rescue!
    # Wordlist from http://dack.com/web/bullshit.html
    def bs
      "#{BS_PRE.sample} #{BS_MID.sample} #{BS_POS.sample}"
    end

    def position
      case rand(3)
      when 0 then [POSITION_PREFIXES.sample, POSITIONS.sample]
      when 1 then [POSITION_AREAS.sample, POSITIONS.sample]
      when 2 then [POSITION_PREFIXES.sample, POSITION_AREAS.sample, POSITIONS.sample]
      end.join(' ')
    end

  end
end
