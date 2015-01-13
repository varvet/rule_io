require "test_helper"

module RuleIo
  class TransactionalTest < Minitest::Test
    def setup
      RuleIo.api_key = "secret"

      stub_request(:post, "http://app.rule.io/api/v1/transactionals")
        .with(body: JSON.parse(fixture("send_transactional.json")))
        .to_return(status: 200, body: { transaction_id: 123_456 }.to_json)
    end

    def teardown
      RuleIo.api_key = nil
    end

    def test_to_cannot_have_duplicates
      transactional = Transactional.new(to: [{ email: "foo@example.com" }, { email: "foo@example.com" }])
      assert_equal 1, transactional.to.length
    end

    def test_to_getter_converts_to_array
      transactional = Transactional.new(to: [{ email: "foo@example.com" }, { email: "foo@example.com" }])
      assert_kind_of Array, transactional.to
    end

    def test_deliver
      transactional = Transactional.new(from: { name: "FooBar", email: "foo@example.com" },
                                        to: [{ email: "foobar@example.com" }],
                                        transaction_name: "Lorem",
                                        subject: "Lorem Ipsum",
                                        content: [
                                          {
                                            block_id: "one_column",
                                            block_content: [
                                              {
                                                title: "Title",
                                                body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                                image: "http://example.com/foo.jpg"
                                              }
                                            ]
                                          }]
                                       )
      assert_equal 123_456, transactional.deliver
    end
  end
end
