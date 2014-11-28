require "test_helper"

module RuleIo
  class BaseTest < Minitest::Test
    def setup
      stub_request(:get, "http://app.rule.io/api/v1/customizations")
        .to_return(status: 200, body: fixture("customizations.json"))
    end

    def test_returns_a_connection
      assert_kind_of Faraday::Connection, RuleIo::Base.connection
    end

    def test_parses_json_response
      response = RuleIo::Base.connection.get("http://app.rule.io/api/v1/customizations")
      assert_kind_of Hash, response.body
    end
  end
end
