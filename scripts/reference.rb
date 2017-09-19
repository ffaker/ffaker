$LOAD_PATH << File.dirname(__FILE__) + '/../lib'
require 'ffaker'

ICONS = {
  error: '‼️',
  warning: '❗'
}.freeze

# Get a list of sections
def faker_modules
  FFaker.constants.map do |const|
    mod = FFaker.const_get(const)
    next unless mod.is_a?(Module)
    next if mod == FFaker::ArrayUtils
    next if mod == FFaker::ModuleUtils
    next if mod == FFaker::RandomUtils
    next if mod == FFaker::Random
    mod
  end.compact
end

# Returns faker methods for a given module
def faker_methods(mod)
  methods = mod.methods - Module.methods -
            %i[k underscore fetch_sample rand shuffle]

  # For Company.name (et al), don't discard :name if it was reimplemented
  methods << :name if mod.send(:name) != mod.to_s
  methods
end

# Catch deprecation warnings.
# This `#warn` overrides Kernel#warn
def warn(msg)
  $warnings << msg if $warnings
end

def catch_warnings
  $warnings = []
  [yield, $warnings]
end

def escape(str)
  str.gsub('&', '&amp;').gsub('<', '&lt;').gsub('>', '&gt;').delete("\n")
end

sections = faker_modules.each.map do |mod|
  lines = []

  methods = faker_methods(mod)
  lines << "## #{mod}"
  lines << ''
  lines << '| Method | Example |'
  lines << '| ------ | ------- |'

  methods.sort.each do |meth|
    arity = mod.method(meth).arity

    left = "`#{meth}`"
    right = ''

    if arity > 0
      left = "`#{meth}`(#{Array.new(arity) { '...' }.join(', ')})"
    else
      begin
        examples, warnings = catch_warnings do
          Array.new(3) { mod.send meth }
        end
        right = if warnings.any?
                  "#{ICONS[:warning]} *#{warnings.first}*"
                else
                  (escape examples.join(', ')).to_s
                end
      rescue => e
        right = "#{ICONS[:error]} #{e.class}: #{e.message}"
      end
    end

    lines << "| #{left} | #{right} |"
  end

  lines << ''
end

puts '# FFaker reference'
puts ''
faker_modules.each do |mod|
  name = mod.to_s.downcase.delete(':')
  puts " * [#{mod}](##{name})"
end
puts ''
puts sections.flatten.join("\n")
