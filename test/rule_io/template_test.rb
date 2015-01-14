require "test_helper"

module RuleIo
  class TemplateTest < Minitest::Test
    def setup
      RuleIo.api_key = "secret"

      stub_request(:get, /#{RuleIo.base_url}\/templates\?apikey=*/)
        .to_return(status: 200, body: fixture("templates.json"))
    end

    def teardown
      RuleIo.api_key = nil
    end

    def test_all_returns_templates
      templates = Template.all
      assert_kind_of Array, templates
      assert_equal 2, templates.length
      templates.each do |t|
        assert_kind_of Template, t
      end
    end
  end
end
