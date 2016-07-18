require 'test/unit'
require 'ffaker'

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
