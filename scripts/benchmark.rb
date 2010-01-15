require 'rubygems'

begin
  require 'ffaker'
rescue LoadError
  begin
    require 'faker'
  rescue LoadError
    puts "You need to install either faker or ffaker to run this."
  else
    puts "Using Faker"
  end
else
  puts "Using Fast Faker"
end

require 'benchmark'

N = 10_000

Benchmark.bm do |rep|
  rep.report("generating #{ N } names") do
    N.times do
      Faker::Name.name
    end
  end
end
