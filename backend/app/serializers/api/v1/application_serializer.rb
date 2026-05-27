module Api
  module V1
    class ApplicationSerializer
      def self.call(resource)
        new(resource).call
      end

      def self.collection(resources)
        resources.map { |r| call(r) }
      end

      def initialize(resource)
        @resource = resource
      end
    end
  end
end
