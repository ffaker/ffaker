require 'rubygems'
require 'benchmark'

N = 10_000

def run(name)
  require name
  Benchmark.bm do |rep|
    rep.report("generating #{N} names (#{name} #{FFaker::VERSION})") do
      N.times do
        FFaker::Name.name
      end
    end
  end
  $stdout.flush
  exit(0)
end

fork { run('faker') }; Process.wait
fork { run('ffaker') }; Process.wait
