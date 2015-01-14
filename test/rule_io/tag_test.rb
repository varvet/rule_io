require "test_helper"

module RuleIo
  class TagTest < Minitest::Test
    def setup
      stub_request(:get, /#{RuleIo.base_url}\/tags\?apikey=*/)
        .to_return(status: 200, body: fixture("tags.json"))
    end

    def test_get_all_tags
      tags = Tag.all
      assert_kind_of Array, tags
      assert_equal 2, tags.length
      tags.each do |tag|
        assert_kind_of Tag, tag
      end
    end

    def test_tag_attributes
      tags = Tag.all
      assert_equal 1, tags.first.id
      assert_equal "My subscribers", tags.first.name
      assert_kind_of Time, tags.first.created_at
      assert_kind_of Time, tags.first.updated_at
    end
  end
end
