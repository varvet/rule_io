require "test_helper"

module RuleIo
  class CustomizationTest < Minitest::Test
    def setup
      stub_request(:get, "http://app.rule.io/api/v1/customizations")
        .to_return(status: 200, body: fixture("customizations.json"))
    end

    def test_all_returns_customizations
      response_body = RuleIo::Customization.all.body
      assert_kind_of Hash, response_body
      assert_kind_of Array, response_body["customizations"]
      assert 1, response_body["customizations"].length
    end
  end
end
