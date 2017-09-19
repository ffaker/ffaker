## Setting/Resetting the random seed

ffaker maintains its own random number generator which allows the responses to
be deterministic and repeatable given the correct seed.

You can get the current seed with `FFaker::Random.seed`, set it with
`FFaker::Random.seed=<seed>`, and reset it back to its initial state with
`FFaker::Random.reset!`. You can also use `FFaker::Random.rand` to get a random
number from the RNG.

```ruby
require 'ffaker'

> FFaker::Random.seed
# => 296167445578296242020083756344880134311

> FFaker::Random.seed=12345
# => 12345

> FFaker::Random.seed
# => 12345

> 5.times.map{ FFaker::Random.rand(0..9) }
# => [2, 5, 1, 7, 4]
> FFaker::Random.reset!
> 5.times.map{ FFaker::Random.rand(0..9) }
# => [2, 5, 1, 7, 4]
```

Calling `seed=` implicitly calls `reset!` so there is no need to call it
separately after setting the seed.

### Using the same random seed as your tests

If you are using Minitest or Rspec and run your tests in random order, ffaker
can use their random seed to return the same data given the same seed.

Note: ffaker can not use the random seed from Test::Unit because it [does not
allow the random seed to be set by the user](https://github.com/test-unit/test-unit/blob/master/lib/test/unit/test-suite-creator.rb#L67-L69).

#### Minitest

Assuming you're already using ffaker in your tests, you will need add a "plugin"
to make it use the same seed as Minitest. In your tests directory (usually named
"test") make another directory named "minitest" and create a file in that
directory named "ffaker_random_seed_plugin.rb" that contains:

```ruby
# test/minitest/ffaker_random_seed_plugin.rb
module Minitest
  def self.plugin_ffaker_random_seed_init(options)
    FFaker::Random.seed = options[:seed]
  end
end
```

Next, you will need to add a `before_setup` method in every test file that uses
ffaker and call `FFaker::Random.reset!` within it. Ideally this will be in your
test case superclass.

```ruby
# test_helper.rb or similar.
class TestBase < Minitest::Test
  def before_setup
    FFaker::Random.reset!
  end
end

class TestSomethingUsingFFaker < TestBase
  def test_something_using_ffaker
    # use FFaker as normal
  end
end
```

ffaker will now use the same random seed as Minitest, including seeds passed in
using `--seed nnn` on the command line, and will return the same data every
time that seed is used.

#### Rspec

Assuming you're already using ffaker in your specs, add the following to your
`spec_helper.rb` or equivalent file:

```ruby
# spec_helper.rb
RSpec.configure do |config|
  config.before(:all)  { FFaker::Random.seed=config.seed }
  config.before(:each) { FFaker::Random.reset! }
end
```

If your helper already has an `RSpec.configure` block, simply put the two
"config.before" lines in that block.

ffaker will now use the same random seed as Rspec, including seeds passed in
using `--seed nnn` on the command line, and will return the same data every
time that seed is used.

### Generating random data in ffaker modules

ffaker modules should use the included deterministic methods to get random data
so that the same data can be returned with the correct random seed.  All ffaker
modules extend the ModuleUtils module which provides the necessary methods. They
are:

  * Use `fetch_sample(array)` instead of `Array#sample` to get a random item from an array.
  * Use `fetch_sample(array, count: n)` instead of `Array#sample(n)` to get multiple random items from an array.
  * Use `shuffle(array)` instead of `Array#shuffle` to randomly reorder an array.
  * Calls to `rand` will automatically use the correct random-number generator, no change is required.

For other uses, you can access the random number generator directly via
`FFaker::Random`. Example:

```ruby
array.shuffle!(random: FFaker::Random)
```

### Testing repeatability of ffaker modules

There are helper methods available to use in tests to ensure your module output
is repeatable and deterministic. All existing module tests use them, and we
would like all future modules to also use them.

First, include the DeterministicHelper in your test class:

```ruby
include DeterministicHelper
```

If your want to test methods that do not require arguments, the
`assert_methods_are_deterministic` method will help you test many methods with
one line of test.

```ruby
# Example: This will test the methods :method_name, :other_method_name, and
# :another_method_name on class FFaker::NewFFakerModule.
assert_methods_are_deterministic(
  FFaker::NewFFakerModule,
  :method_name, :other_method_name, :another_method_name
)
```

For testing methods that require an argument, or to test more complicated
behavior, you can use the `assert_deterministic` method within a test method.

```ruby
def test_some_method
  assert_deterministic { FFaker::NewFFakerModule.some_method(:required_argument) }
end
```

For more examples, please see the test cases for existing modules.
