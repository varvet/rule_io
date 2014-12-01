require "test_helper"

module RuleIo
  class CustomizationTest < Minitest::Test
    def setup
      stub_request(:get, %r{http://app.rule.io/api/v1/customizations\?apikey=*})
        .to_return(status: 200, body: fixture("customizations.json"))
    end

    def test_all_returns_customizations
      customizations = RuleIo::Customization.all
      assert_kind_of Array, customizations
      assert 1, customizations.length
      assert_kind_of Customization, customizations.first
    end

    def test_initialization
      customizations = RuleIo::Customization.all
      assert_equal 1, customizations.first.id
      assert_equal "Address", customizations.first.name
    end

    def test_fields
      customizations = RuleIo::Customization.all
      assert_kind_of Array, customizations.first.fields
      assert 1, customizations.first.fields.length
      assert_kind_of RuleIo::Customization::Field, customizations.first.fields.first
    end
  end
end
