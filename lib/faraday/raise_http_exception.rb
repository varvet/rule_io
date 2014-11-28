module FaradayMiddleware
  class RaiseHttpException < Faraday::Middleware
    def call(env)
      @app.call(env).on_complete do |response|
        case response[:status].to_i
        when 400
          fail RuleIo::BadRequest, response.body
        when 401
          fail RuleIo::NotAuthorized, response.body
        when 404
          fail RuleIo::NotFound, response.body
        when 409
          fail RuleIo::Conflict, response.body
        when 500
          fail RuleIo::InternalServerError, response.body
        when 400..600
          fail RuleIo::Error, response.body
        end
      end
    end
  end
end
