# encoding: utf-8

module Faker
  module Sport
    extend ModuleUtils
    extend self

    def sport_name
      SPORT_NAME.rand
    end

    def team_name
      SPORT_TEAM_NAME.rand
    end

    def league
      SPORT_LEAGUE.rand
    end

    def position
      SPORT_PLAYER_POSITION.rand
    end

    def number
      Random.rand(100) + 1
    end

    def location
      SPORT_TEAM_LOCATION.rand
    end

    def captain
      SPORT_TEAM_CAPTAIN.rand
    end

    def coach # need file
      SPORT_TEAM_COACH.rand
    end
  end
end
