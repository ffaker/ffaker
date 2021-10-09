# frozen_string_literal: true

module FFaker
  module Company
    extend ModuleUtils
    extend self

    SUFFIXES = %w[Inc and\ Sons LLC Group].freeze
    POSITION_PREFIXES = %w[Executive Assistant General Associate].freeze
    POSITIONS = %w[President Manager Director Secretary Consultant].freeze

    def name
      case rand(0..2)
      when 0 then "#{Name.last_name} #{suffix}"
      when 1 then "#{Name.last_name}-#{Name.last_name}"
      when 2 then format('%s, %s and %s', Name.last_name, Name.last_name, Name.last_name)
      end
    end

    def suffix
      fetch_sample(SUFFIXES)
    end

    # Generate a buzzword-laden catch phrase.
    # Wordlist from http://www.1728.com/buzzword.htm
    def catch_phrase
      "#{fetch_sample(CATCH_PRE)} #{fetch_sample(CATCH_MID)} #{fetch_sample(CATCH_POS)}"
    end

    # When a straight answer won't do, BS to the rescue!
    # Wordlist from http://dack.com/web/bullshit.html
    def bs
      "#{fetch_sample(BS_PRE)} #{fetch_sample(BS_MID)} #{fetch_sample(BS_POS)}"
    end

    def position
      case rand(0..2)
      when 0 then [fetch_sample(POSITION_PREFIXES), fetch_sample(POSITIONS)]
      when 1 then [fetch_sample(POSITION_AREAS), fetch_sample(POSITIONS)]
      when 2 then [fetch_sample(POSITION_PREFIXES), fetch_sample(POSITION_AREAS), fetch_sample(POSITIONS)]
      end.join(' ')
    end
  end
end
