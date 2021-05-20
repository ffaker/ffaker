# frozen_string_literal: true

require 'test/unit'
require_relative '../lib/ffaker'

# Helpers for checking if a method is deterministic -- e.g., that the Random
# results are repeatable given the same random seed.
module DeterministicHelper
  def self.included(base)
    base.extend ClassMethods
  end

  # Accepts a block. Executes the block multiple times after resetting
  # the internal Random Number Generator state and compared the results of
  # each execution to make sure they are the same.
  def assert_deterministic(options = {})
    raise ArgumentError, 'Must pass a block' unless block_given?

    options = { message: 'Results are not repeatable' }.merge(options)

    returns = Array.new(2) do
      FFaker::Random.reset!
      Array.new(5) do
        yield
      end
    end

    assert(returns.uniq.length == 1, options[:message])
  end

  %w[< > <= >=].each do |operator|
    operator_name =
      case operator[0]
      when '<' then 'less_than'
      when '>' then 'greater_than'
      else raise 'Unexpected operator'
      end
    operator_name += '_or_equal_to' if operator[1] == '='

    define_method "assert_#{operator_name}" do |got, expected|
      assert(
        got.public_send(operator, expected),
        "Expected #{operator} \"#{expected}\", but got #{got}"
      )
    end
  end

  def assert_between(got, range)
    assert_greater_than_or_equal_to got, range.begin
    public_send "assert_less_than#{'_or_equal_to' unless range.exclude_end?}", got, range.end
  end

  def assert_random(original_block, *args)
    100.times do
      yield(*args)
      assert_deterministic(&original_block)
    end
  end

  %w[less_than_or_equal_to between].each do |method_name|
    define_method "assert_random_#{method_name}" do |*args, &block|
      assert_random(block) { send "assert_#{method_name}", block.call, *args }
    end
  end

  # Methods to be called outside of individual examples.
  module ClassMethods
    # Shorthand method to quickly test the determinability of multiple methods.
    #
    #  assert_methods_are_deterministic(
    #    <faker module under test>,
    #    <method names to test, as array of symbols>
    #  )
    #
    #  assert_methods_are_deterministic(
    #    FFaker::SomeModule,
    #    :some_method, :some_other_method
    #  }
    def assert_methods_are_deterministic(klass, *methods)
      Array(methods).each do |meth|
        define_method "test_#{meth}_is_deterministic" do
          assert_deterministic(message: "Results from `#{klass}.#{meth}` are not repeatable") do
            klass.send(meth)
          end
        end
      end
    end
  end
end
