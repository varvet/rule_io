module RuleIo
  class Customization < Base
    def self.all
      connection.get do |request|
        request.url "customizations"
      end
    end
  end
end
