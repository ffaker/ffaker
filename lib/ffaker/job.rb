module Faker
  module Job
    extend ModuleUtils
    extend self

    def title
      "#{JOB_PREFIX.rand} #{JOB_ADJ.rand} #{JOB_NOUN.rand}"
    end

    JOB_PREFIX = k %w(Lead Senior Direct Corporate Dynamic Future Product National
                    Regional District Central Global Customer Investor Dynamic
                    International Legacy Forward Internal Human Chief Principal)

    JOB_ADJ = k %w(Solutions Program Brand Security Research Marketing Directives
                 Implementation Integration Functionality Response Paradigm Tactics
                 Identity Markets Group Division Applications Optimization
                 Operations Infrastructure Intranet Communications Web Branding
                 Quality Assurance Mobility Accounts Data Creative Configuration
                 Accountability Interactions Factors Usability Metrics)

    JOB_NOUN = k %w(Supervisor Associate Executive Liason Officer Manager Engineer
                  Specialist Director Coordinator Administrator Architect Analyst
                  Designer Planner Orchestrator Technician Developer Producer
                  Consultant Assistant Facilitator Agent Representative Strategist)
  end
end
