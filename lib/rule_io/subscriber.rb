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

    def self.find(identifier, identified_by: nil)
      options = {}
      options[:identified_by] = identified_by unless identified_by.nil?
      response = get("subscribers/#{identifier}", options)
      new(response.body["subscriber"])
    end

    def self.create(options = {})
      raise ArgumentError, "Email is required" unless options[:email]
      response = post("subscribers", options)
      new(response.body["subscriber"])
    end

    def add_tags(tags)
      self.class.post("subscribers/#{email}/tags", tags: Array(tags))
      true
    end

    def remove_tag(tag)
      self.class.delete("subscribers/#{email}/tags/#{tag}")
      true
    end
  end
end
