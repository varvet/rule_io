require "test_helper"

module RuleIo
  class FooBar < Base
    def self.all
      connection.get do |request|
        request.url "foobar"
      end
    end
  end
end

module Faraday
  class RaiseHttpExceptionTest < Minitest::Test
    {
      400 => RuleIo::BadRequest,
      401 => RuleIo::NotAuthorized,
      404 => RuleIo::NotFound,
      409 => RuleIo::Conflict,
      500 => RuleIo::InternalServerError,
      600 => RuleIo::Error
    }.each do |status, exception|
      define_method "test_http_status_is_#{status}_it_raises_#{exception}" do
        stub_request(:get, "#{RuleIo.base_url}/foobar")
          .to_return(status: status)

        assert_raises(exception) { RuleIo::FooBar.all }
      end
    end
  end
end
