module RuleIo
  class Customization < Base
    class Field
      include Virtus.model

      attribute :id, Integer
      attribute :name
      attribute :type
      attribute :default_value
    end

    include Virtus.model

    attribute :id, Integer
    attribute :name
    attribute :created_at, Time
    attribute :updated_at, Time
    attribute :fields, Array[Field]

    def self.all
      response = get("customizations")
      response.body["customizations"].map { |customization| new(customization) }
    end
  end
end
