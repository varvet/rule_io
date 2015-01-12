module RuleIo
  class Base
    class << self
      def connection
        @connection ||= Faraday.new(
          url: RuleIo.base_url,
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

      def post(url, params = {})
        connection.post do |request|
          request.url url
          request.body = { apikey: RuleIo.api_key }.merge(params)
        end
      end

      def delete(url, params = {})
        connection.delete do |request|
          request.url url
          request.body = params
          request.params[:apikey] = RuleIo.api_key
        end
      end
    end
  end
end
