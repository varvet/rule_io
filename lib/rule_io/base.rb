module RuleIo
  class Base
    BASE_URL = "http://app.rule.io/api/v1"

    def self.connection
      @connection ||= Faraday.new(
        url: BASE_URL,
        # proxy: "http://localhost:8888"
      ) do |config|
        config.request :json
        config.response :json
        config.use FaradayMiddleware::RaiseHttpException
        config.adapter Faraday.default_adapter
      end
    end
  end
end
