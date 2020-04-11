# frozen_string_literal: true

require 'benchmark'

NAMES_COUNT = 10_000

def run(name)
  Benchmark.bm do |rep|
    rep.report("generating #{NAMES_COUNT} names (#{name})") do
      mod = name == 'ffaker' ? FFaker : Faker
      NAMES_COUNT.times { mod::Name.name }
    end
  end
end

%w[faker ffaker].each do |gem_name|
  require gem_name

  fork { run(gem_name) }
  Process.wait
end
