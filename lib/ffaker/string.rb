# frozen_string_literal: true

module FFaker
  module String
    extend ModuleUtils
    extend self

    BACKSLASH = '\\'
    DASH      = '-'

    LOWERS     = Array('a'..'z').freeze
    UPPERS     = Array('A'..'Z').freeze
    LETTERS    = LOWERS + UPPERS
    NUMBERS    = Array('0'..'9').freeze
    WORD_CHARS = LETTERS + NUMBERS + ['_']
    SPACES     = [' ', "\t"].freeze
    ESCAPEABLE_CHARS = ['\\', '/', '.', '(', ')', '[', ']', '{', '}'].freeze

    def from_regexp(exp)
      result = +''
      @last_token = nil

      # Drop surrounding /'s and split into characters
      tokens = exp.inspect[1...-1].split(//)
      result << process_token(tokens) until tokens.empty?

      result
    end

    private

    def generate_range(tokens)
      result = []
      while tokens.any?
        token = tokens.shift
        if token == DASH && tokens.first && result.last
          result += Array(result.pop..tokens.shift)
        elsif token == BACKSLASH
          result << special(tokens.shift)
        else
          result << token
        end
      end
      result
    end

    def process_token(tokens)
      return '' if tokens.empty?

      token = tokens.shift

      case token
      when '?'
        # TODO: Let ? generate nothing
        '' # We already printed its target
      when '+'
        tokens.unshift(token) if rand(0..1) == 1 # Leave the `+` on to run again
        process_token(@last_token) # Run the last one at least once
      when '*'
        tokens.unshift(token) if rand(0..1) == 1 # Leave the `*` on to run again
        return '' if rand(0..1) == 1 # Or maybe do nothing

        process_token(@last_token) # Else run the last one again
      when '{'
        number = +''
        while (ch = tokens.shift) != '}'
          number << ch
        end
        number = number.to_i - 1
        t = @last_token.dup
        Array.new(number) { process_token(t.dup) }.join
      else
        generate_token token, tokens
      end
    end

    def generate_token(token, tokens)
      case token
      when /\w/
        @last_token = [token]
        token
      when BACKSLASH
        token = tokens.shift
        @last_token = ['\\', token]
        special(token)
      when '['
        set = []
        while (ch = tokens.shift) != ']'
          set << ch
        end
        @last_token = ['['] + set + [']']

        process_token([fetch_sample(generate_range(set))])
      else
        token
      end
    end

    def special(token)
      case token
      when 'w' then fetch_sample(WORD_CHARS)
      when 'd' then fetch_sample(NUMBERS)
      when 's' then fetch_sample(SPACES)
      when *ESCAPEABLE_CHARS then token
      else
        ''
      end
    end
  end
end
