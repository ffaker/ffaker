require File.dirname(__FILE__) + '/../lib/faker'
require 'benchmark'

N = 1_000_000

Benchmark.bm do |rep|
  rep.report("generating #{ N } names") do
    N.times do
      Faker::Name.name
    end
  end
end
