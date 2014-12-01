module RuleIo
  class Tag < Base
    include Virtus.model

    attribute :id, Integer
    attribute :name
    attribute :created_at, Time
    attribute :updated_at, Time

    def self.all
      response = get("tags")
      response.body["tags"].map { |tag| new(tag) }
    end
  end
end
