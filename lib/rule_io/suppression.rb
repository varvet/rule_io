module RuleIo
  class Suppression < Base
    include Virtus.model

    attribute :subscriber_id, Integer
    attribute :email
    attribute :dispatcher_type
    attribute :suppressed_source_type
    attribute :created_at, Time

    def self.all
      response = get("suppressions")
      response.body["suppressions"].map { |suppression| new(suppression) }
    end
  end
end
