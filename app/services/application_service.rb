class ApplicationService

    def self.call(*arg, &block)
        new(*arg, &block).call
    end

end