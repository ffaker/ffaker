require 'test/unit'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'ffaker'

class Test::Unit::TestCase
  def self.it(description, &block)
    define_method("test_#{ description }", &block)
  end
end
