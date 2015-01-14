module RuleIo
  class Template < Base
    include Virtus.model

    attribute :id, Integer
    attribute :name, String

    def self.all
      response = get("templates")
      response.body["templates"].map { |template| new(template) }
    end
  end
end
