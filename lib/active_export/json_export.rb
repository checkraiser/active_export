module ActiveExport
  module JsonExport
    def as_json
      klass = self.class
      h = {}
      methods = klass.instance_methods - Object.instance_methods
      methods.each do |m|
        arity = method(m.to_sym).parameters.count
        if arity.is_a?(Fixnum)
          if arity == 0
            if m.to_sym != :as_json && m.to_s.include?('_')
              h[m.to_sym] = self.send(m.to_sym)
            end
          end
        end
      end
      h
    end
  end
end
