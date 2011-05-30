require 'rubygems'
require 'benchmark'

N = 10_000

def run(name)
  require name
  Benchmark.bm do |rep|
    rep.report("generating #{ N } names (#{name} #{Faker::VERSION})") do
      N.times do
        Faker::Name.name
      end
    end
  end
  $stdout.flush
  exit(0)
end

fork { run("faker") }; Process.wait
fork { run("ffaker") }; Process.wait
