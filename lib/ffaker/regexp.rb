module Faker
  module Regexp
    extend ModuleUtils
    extend self

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
        token = tokens.shift
        case token
        when /\w/: result << token
        when '\\': result << special(tokens.shift)
        end
      end

      result
    end

  private

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
