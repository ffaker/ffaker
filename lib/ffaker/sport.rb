module FFaker
  module Sport
    extend ModuleUtils
    extend self

    # @deprecated US sports name. Moved into {SportUS}
    def name
      warn '[name] is deprecated. For US sports please use the SportUS module'
      fetch_sample(NAMES)
    end
  end
end
