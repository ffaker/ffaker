# frozen_string_literal: true

require_relative '../lib/ffaker'
require 'set'

# always use the same seed for consistency
FFaker::Random.seed = 1337

ICONS = {
  error: '‼️',
  warning: '❗'
}.freeze

UTILS_MODULES = %i[ArrayUtils ModuleUtils RandomUtils Random]
UTILS_METHODS = %i[k underscore fetch_sample rand shuffle unique luhn_check]

# Get a list of sections
def faker_modules
  FFaker
    .constants
    .reject { |const| UTILS_MODULES.include?(const) }
    .select { |const| FFaker.const_get(const).instance_of?(Module) }
    .sort
    .map { |const| FFaker.const_get(const) }
end

# Returns faker methods for a given module
def faker_methods(mod)
  methods = mod.methods - Module.methods - UTILS_METHODS

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

sections = faker_modules.map do |mod|
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

    if arity.positive?
      left = "`#{meth}`(#{Array.new(arity) { '...' }.join(', ')})"
    else
      begin
        examples, warnings = catch_warnings do
          Array.new(3) { mod.unique.send meth }
        end
        right = if warnings.any?
                  "#{ICONS[:warning]} *#{warnings.first}*"
                else
                  (escape examples.join(', ')).to_s
                end
      rescue StandardError => e
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
