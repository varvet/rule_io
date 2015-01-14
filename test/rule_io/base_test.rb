require "test_helper"

module RuleIo
  class BaseTest < Minitest::Test
    def setup
      stub_request(:get, "#{RuleIo.base_url}/customizations")
        .to_return(status: 200, body: fixture("customizations.json"))
    end

    def test_returns_a_connection
      assert_kind_of Faraday::Connection, RuleIo::Base.connection
    end
  end
end
