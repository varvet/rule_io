require "test_helper"

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
        stub_request(:get, "http://app.rule.io/api/v1/customizations")
          .to_return(status: status)
        assert_raises(exception) { RuleIo::Customization.all }
      end
    end
  end
end
