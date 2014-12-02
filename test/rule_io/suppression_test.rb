require "test_helper"

module RuleIo
  class SuppressionTest < Minitest::Test
    def setup
      stub_request(:get, %r{http://app.rule.io/api/v1/suppressions\?apikey=*})
        .to_return(status: 200, body: fixture("suppressions.json"))
    end

    def test_all_returns_suppressions
      suppressions = Suppression.all
      assert_kind_of Array, suppressions
      assert_equal 2, suppressions.length
      suppressions.each do |s|
        assert_kind_of Suppression, s
      end
    end
  end
end
