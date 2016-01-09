# encoding: utf-8

module FFaker
  module String
    extend ModuleUtils
    extend self

    BACKSLASH = '\\'
    DASH      = '-'

    LOWERS     = [*'a'..'z']
    UPPERS     = [*'A'..'Z']
    LETTERS    = LOWERS + UPPERS
    NUMBERS    = [*'0'..'9']
    WORD_CHARS = LETTERS + NUMBERS + ['_']
    SPACES     = [' ', "\t"]
    ESCAPEABLE_CHARS = '\\', '/', '.', '(', ')', '[', ']', '{', '}'

    def from_regexp(exp)
      result = ''
      @last_token = nil

      # Drop surrounding /'s and split into characters
      tokens = exp.inspect[1...-1].split(//)
      until tokens.empty?
        result << process_token(tokens)
      end

      result
    end

    private

    def generate_range(tokens)
      result = []
      while tokens.any?
        token = tokens.shift
        if token == DASH && tokens.first && result.last
          result += [*result.pop..tokens.shift]
        elsif token == BACKSLASH
          result << special(tokens.shift)
        else
          result << token
        end
      end
      result
    end

    def process_token(tokens)
      return "" if tokens.empty?

      token = tokens.shift

      case token
      when "?" then
        # TODO: Let ? generate nothing
        "" # We already printed its target
      when "+" then
        tokens.unshift(token) if rand(2) == 1 # Leave the `+` on to run again
        process_token(@last_token) # Run the last one at least once
      when "*" then
        tokens.unshift(token) if rand(2) == 1 # Leave the `*` on to run again
        return "" if rand(2) == 1 # Or maybe do nothing
        process_token(@last_token) # Else run the last one again
      when "{" then
        number = ""
        while (ch = tokens.shift) != "}"
          number << ch
        end
        number = number.to_i - 1
        t = @last_token.dup
        number.times.map { process_token(t.dup) }.join
      else
        generate_token token, tokens
      end
    end

    def generate_token(token, tokens)
      case token
      when /\w/ then
        @last_token = [token]
        token
      when BACKSLASH then
        token = tokens.shift
        @last_token = ['\\', token]
        special(token)
      when '[' then
        set = []
        while (ch = tokens.shift) != ']'
          set << ch
        end
        @last_token = ['['] + set + [']']

        process_token([generate_range(set).sample])
      else
        token
      end
    end

    def special(token)
      case token
      when 'w' then WORD_CHARS.sample
      when 'd' then NUMBERS.sample
      when 's' then SPACES.sample
      when *ESCAPEABLE_CHARS then token
      else
        ''
      end
    end
  end
end
