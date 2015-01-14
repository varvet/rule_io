module RuleIo
  class Transactional < Base
    include Virtus.model(strict: true)

    attribute :transaction_type, String,  default: "email"
    attribute :transaction_name, String,  default: ""
    attribute :template_id,      Integer, default: 1
    attribute :subject,          String,  default: ""
    attribute :from,             Hash
    attribute :to,               Set[Hash]
    attribute :content,          Array

    def to
      super.to_a
    end

    def deliver
      response = self.class.post("transactionals", to_hash)
      response.body["transaction_id"]
    end
  end
end
