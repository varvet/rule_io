module RuleIo
  class Base
    BASE_URL = "http://app.rule.io/api/v1"

    class << self
      def connection
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

      def get(url, params = {})
        connection.get do |request|
          request.url url
          request.params = params
          request.params[:apikey] = RuleIo.api_key
        end
      end
    end
  end
end
