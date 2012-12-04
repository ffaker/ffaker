module Faker
  module Regexp
    extend ModuleUtils
    extend self

    BACKSLASH = '\\'

    LOWERS     = k(('a'..'z').to_a)
    UPPERS     = k(('A'..'Z').to_a)
    LETTERS    = k(LOWERS + UPPERS)
    NUMBERS    = k(('0'..'9').to_a)
    WORD_CHARS = k(LETTERS + NUMBERS + ['_'])
    SPACES     = k([" ", "\t"])
    ESCAPEABLE_CHARS = '\\', '/', '.', '(', ')', '[', ']', '{', '}'

    def regexp(exp)
      result = ''

      # Drop surrounding /'s and split into characters
      tokens = exp.inspect[1...-1].split(//)
      until tokens.empty?
        result << process_token(tokens)
      end

      result
    end

  private

    def join_escapes(tokens)
      result = []
      while tokens.any?
        token = tokens.shift
        token << tokens.shift if token == BACKSLASH
        result << token
      end
      result
    end

    def process_token(tokens)
      return '' if tokens.empty?

      token = tokens.shift
      lookahead = tokens.first

      case lookahead
      when '?'
        tokens.shift # Drop `?`
        return '' if rand(2) == 1 # Skip current
      end

      case token
      when /\w/: token
      when BACKSLASH: special(tokens.shift)
      when '[':
        set = []
        while (ch = tokens.shift) != ']'
          set << ch
        end
        process_token([ArrayUtils.rand(join_escapes(set))])
      end
    end

    def special(token)
      case token
      when 'w': WORD_CHARS.rand
      when 'd': NUMBERS.rand
      when 's': SPACES.rand
      when *ESCAPEABLE_CHARS: token
      end
    end
  end
end
