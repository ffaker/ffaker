# frozen_string_literal: true

require_relative '../lib/faker'

N = 1_000_000

N.times do
  FFaker::Name.name
end
