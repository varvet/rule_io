require "rule_io/tag"

module RuleIo
  class Subscriber < Base
    include Virtus.model

    attribute :id, Integer
    attribute :email
    attribute :created_at, Time
    attribute :updated_at, Time
    attribute :tags, Array[Tag]

    def self.all
      response = get("subscribers")
      response.body["subscribers"].map { |subscriber| new(subscriber) }
    end

    def self.find(identitfier, options = {})
      response = get("subscribers/#{identitfier}", options)
      new(response.body["subscriber"])
    end
  end
end
