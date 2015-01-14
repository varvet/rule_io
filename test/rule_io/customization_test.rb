require "test_helper"

module RuleIo
  class CustomizationTest < Minitest::Test
    def setup
      stub_request(:get, /#{RuleIo.base_url}\/customizations\?apikey=*/)
        .to_return(status: 200, body: fixture("customizations.json"))
    end

    def test_all_returns_customizations
      customizations = Customization.all
      assert_kind_of Array, customizations
      assert_equal 1, customizations.length
      customizations.each do |c|
        assert_kind_of Customization, c
      end
    end

    def test_initialization
      customizations = Customization.all
      assert_equal 1, customizations.first.id
      assert_equal "Address", customizations.first.name
    end

    def test_fields
      customizations = Customization.all
      assert_kind_of Array, customizations.first.fields
      assert_equal 3, customizations.first.fields.length
      assert_kind_of Customization::Field, customizations.first.fields.first
    end
  end
end
