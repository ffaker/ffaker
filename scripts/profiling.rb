require File.dirname(__FILE__) + '/../lib/faker'

N = 1_000_000

N.times do
  FFaker::Name.name
end
