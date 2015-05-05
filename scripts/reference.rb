$: << File.dirname(__FILE__) + '/../lib'
require 'ffaker'

ICONS = {
  :error => "‼️",
  :warning => "❗"
}

# Get a list of sections
def faker_modules
  FFaker.constants.map do |const|
    mod = FFaker.const_get(const)
    next unless mod.is_a?(Module)
    next if mod == FFaker::ArrayUtils
    next if mod == FFaker::ModuleUtils
    mod
  end.compact
end

# Returns faker methods for a given module
def faker_methods(mod)
  methods = mod.methods - Module.methods - [:k, :underscore]

  # For Company.name (et al), don't discard :name if it was reimplemented
  methods << :name if mod.send(:name) != mod.to_s
  methods
end

# Catch deprecation warnings.
# This `#warn` overrides Kernel#warn
def warn(msg)
  $warnings << msg if $warnings
end

def catch_warnings(&blk)
  $warnings = []
  [yield, $warnings]
end

def escape(str)
  str.gsub('&', '&amp;').gsub('<', '&lt;').gsub('>', '&gt;').gsub("\n", '')
end

sections = faker_modules.each.map do |mod|
  lines = []

  methods = faker_methods(mod)
  lines << "## #{mod}"
  lines << ""
  lines << "| Method | Example |"
  lines << "| ------ | ------- |"

  methods.sort.each do |meth|
    arity = mod.method(meth).arity

    left = "`#{meth}`"
    right =''

    if arity > 0
      left = "`#{meth}`(#{arity.times.map{'...'}.join(', ')})"
    else
      begin
        examples, warnings = catch_warnings {
          3.times.map { mod.send meth }
        }
        if warnings.any?
          right = "#{ICONS[:warning]} *#{warnings.first}*"
        else
          right = "#{escape examples.join(', ')}"
        end
      rescue => e
        right = "#{ICONS[:error]} #{e.class}: #{e.message}"
      end
    end

    lines << "| #{left} | #{right} |"
  end

  lines << ""
end

puts "# FFaker reference"
puts ""
faker_modules.each do |mod|
  name = mod.to_s.downcase.gsub(':', '')
  puts " * [#{mod}](##{name})"
end
puts ""
puts sections.flatten.join("\n")
