module Faker
  module Company
    extend ModuleUtils
    extend self

    def name
      case rand(3)
      when 0 then "#{Name.last_name} #{suffix}"
      when 1 then "#{Name.last_name}-#{Name.last_name}"
      when 2 then "%s, %s and %s" % [ Name.last_name, Name.last_name, Name.last_name ]
      end
    end

    def suffix
      SUFFIXES.rand
    end

    # Generate a buzzword-laden catch phrase.
    # Wordlist from http://www.1728.com/buzzword.htm
    def catch_phrase
      "#{CATCH_PRE.rand} #{CATCH_MID.rand} #{CATCH_POS.rand}"
    end

    # When a straight answer won't do, BS to the rescue!
    # Wordlist from http://dack.com/web/bullshit.html
    def bs
      "#{BS_PRE.rand} #{BS_MID.rand} #{BS_POS.rand}"
    end

    def position
      case rand(3)
        when 0 then [POSITION_PREFIXES.rand, POSITIONS.rand]
        when 1 then [POSITION_AREAS.rand, POSITIONS.rand]
        when 2 then [POSITION_PREFIXES.rand, POSITION_AREAS.rand, POSITIONS.rand]
      end.join(' ')
    end

    SUFFIXES = k %w(Inc and\ Sons LLC Group)

    CATCH_PRE = k ["Adaptive", "Advanced", "Ameliorated", "Assimilated",
      "Automated", "Balanced", "Business-focused", "Centralized", "Cloned",
      "Compatible", "Configurable", "Cross-group", "Cross-platform",
      "Customer-focused", "Customizable", "Decentralized", "De-engineered",
      "Devolved", "Digitized", "Distributed", "Diverse", "Down-sized",
      "Enhanced", "Enterprise-wide", "Ergonomic", "Exclusive", "Expanded",
      "Extended", "Face to face", "Focused", "Front-line",
      "Fully-configurable", "Function-based", "Fundamental", "Future-proofed",
      "Grass-roots", "Horizontal", "Implemented", "Innovative", "Integrated",
      "Intuitive", "Inverse", "Managed", "Mandatory", "Monitored",
      "Multi-channelled", "Multi-lateral", "Multi-layered", "Multi-tiered",
      "Networked", "Object-based", "Open-architected", "Open-source",
      "Operative", "Optimized", "Optional", "Organic", "Organized",
      "Persevering", "Persistent", "Phased", "Polarised", "Pre-emptive",
      "Proactive", "Profit-focused", "Profound", "Programmable", "Progressive",
      "Public-key", "Quality-focused", "Reactive", "Realigned",
      "Re-contextualized", "Re-engineered", "Reduced", "Reverse-engineered",
      "Right-sized", "Robust", "Seamless", "Secured", "Self-enabling",
      "Sharable", "Stand-alone", "Streamlined", "Switchable", "Synchronised",
      "Synergistic", "Synergized", "Team-oriented", "Total", "Triple-buffered",
      "Universal", "Up-sized", "Upgradable", "User-centric", "User-friendly",
      "Versatile", "Virtual", "Visionary", "Vision-oriented"]

    CATCH_MID = k ["24 hour", "24/7", "3rd generation", "4th generation",
      "5th generation", "6th generation", "actuating", "analyzing", "assymetric",
      "asynchronous", "attitude-oriented", "background", "bandwidth-monitored",
      "bi-directional", "bifurcated", "bottom-line", "clear-thinking",
      "client-driven", "client-server", "coherent", "cohesive", "composite",
      "context-sensitive", "contextually-based", "content-based", "dedicated",
      "demand-driven", "didactic", "directional", "discrete", "disintermediate",
      "dynamic", "eco-centric", "empowering", "encompassing", "even-keeled",
      "executive", "explicit", "exuding", "fault-tolerant", "foreground",
      "fresh-thinking", "full-range", "global", "grid-enabled", "heuristic",
      "high-level", "holistic", "homogeneous", "human-resource", "hybrid",
      "impactful", "incremental", "intangible", "interactive", "intermediate",
      "leading edge", "local", "logistical", "maximized", "methodical",
      "mission-critical", "mobile", "modular", "motivating", "multimedia",
      "multi-state", "multi-tasking", "national", "needs-based", "neutral",
      "next generation", "non-volatile", "object-oriented", "optimal", "optimizing",
      "radical", "real-time", "reciprocal", "regional", "responsive", "scalable",
      "secondary", "solution-oriented", "stable", "static", "systematic",
      "systemic", "system-worthy", "tangible", "tertiary", "transitional",
      "uniform", "upward-trending", "user-facing", "value-added", "web-enabled",
      "well-modulated", "zero administration", "zero defect", "zero tolerance"]

    CATCH_POS = k ["ability", "access", "adapter", "algorithm", "alliance",
      "analyzer", "application", "approach", "architecture", "archive",
      "artificial intelligence", "array", "attitude", "benchmark",
      "budgetary management", "capability", "capacity", "challenge", "circuit",
      "collaboration", "complexity", "concept", "conglomeration",
      "contingency", "core", "customer loyalty", "database",
      "data-warehouse", "definition", "emulation", "encoding", "encryption",
      "extranet", "firmware", "flexibility", "focus group", "forecast",
      "frame", "framework", "function", "functionalities", "Graphic Interface",
      "groupware", "Graphical User Interface", "hardware",
      "help-desk", "hierarchy", "hub", "implementation", "info-mediaries",
      "infrastructure", "initiative", "installation", "instruction set",
      "interface", "internet solution", "intranet", "knowledge user",
      "knowledge base", "local area network", "leverage", "matrices",
      "matrix", "methodology", "middleware", "migration", "model",
      "moderator", "monitoring", "moratorium", "neural-net", "open architecture",
      "open system", "orchestration", "paradigm", "parallelism", "policy",
      "portal", "pricing structure", "process improvement", "product",
      "productivity", "project", "projection", "protocol", "secured line",
      "service-desk", "software", "solution", "standardization",
      "strategy", "structure", "success", "superstructure", "support",
      "synergy", "system engine", "task-force", "throughput",
      "time-frame", "toolset", "utilisation", "website",
      "workforce"]

    BS_PRE = k ["implement", "utilize", "integrate", "streamline", "optimize",
      "evolve", "transform", "embrace", "enable", "orchestrate", "leverage",
      "reinvent", "aggregate", "architect", "enhance", "incentivize",
      "morph", "empower", "envisioneer", "monetize", "harness", "facilitate",
      "seize", "disintermediate", "synergize", "strategize", "deploy",
      "brand", "grow", "target", "syndicate", "synthesize", "deliver",
      "mesh", "incubate", "engage", "maximize", "benchmark", "expedite",
      "reintermediate", "whiteboard", "visualize", "repurpose", "innovate",
      "scale", "unleash", "drive", "extend", "engineer", "revolutionize",
      "generate", "exploit", "transition", "e-enable", "iterate",
      "cultivate", "matrix", "productize", "redefine", "recontextualize"]

    BS_MID = k ["clicks-and-mortar", "value-added", "vertical", "proactive",
      "robust", "revolutionary", "scalable", "leading-edge", "innovative",
      "intuitive", "strategic", "e-business", "mission-critical", "sticky",
      "one-to-one", "24/7", "end-to-end", "global", "B2B", "B2C", "granular",
      "frictionless", "virtual", "viral", "dynamic", "24/365",
      "best-of-breed", "killer", "magnetic", "bleeding-edge", "web-enabled",
      "interactive", "dot-com", "sexy", "back-end", "real-time", "efficient",
      "front-end", "distributed", "seamless", "extensible", "turn-key",
      "world-class", "open-source", "cross-platform", "cross-media",
      "synergistic", "bricks-and-clicks", "out-of-the-box", "enterprise",
      "integrated", "impactful", "wireless", "transparent",
      "next-generation", "cutting-edge", "user-centric", "visionary",
      "customized", "ubiquitous", "plug-and-play", "collaborative",
      "compelling", "holistic", "rich"]

    BS_POS = k ["synergies", "web-readiness", "paradigms", "markets",
      "partnerships", "infrastructures", "platforms", "initiatives",
      "channels", "eyeballs", "communities", "ROI", "solutions", "e-tailers",
      "e-services", "action-items", "portals", "niches", "technologies",
      "content", "vortals", "supply-chains", "convergence", "relationships",
      "architectures", "interfaces", "e-markets", "e-commerce", "systems",
      "bandwidth", "infomediaries", "models", "mindshare", "deliverables",
      "users", "schemas", "networks", "applications", "metrics",
      "e-business", "functionalities", "experiences", "web services",
      "methodologies"]

    POSITION_PREFIXES = k %w[Executive Assistant General Associate]
    POSITION_AREAS = k %w[Finance IT Operations Information Vice Sales Marketing Corporate Department Regional Division]
    POSITIONS = k %w[President Manager Director Secretary Consultant]
  end
end
