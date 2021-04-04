class Test
    attr_reader :reference

    def self.save(instance)
        instance.reference = 3435
    end
end