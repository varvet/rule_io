require "test_helper"

module RuleIo
  class SubscriberTest < Minitest::Test
    def setup
      RuleIo.api_key = "secret"

      stub_request(:get, %r{http://app.rule.io/api/v1/subscribers\?apikey=secret})
        .to_return(status: 200, body: fixture("subscribers.json"))

      stub_request(:get, %r{http://app.rule.io/api/v1/subscribers/foobar@example.com\?apikey=secret})
        .to_return(status: 200, body: fixture("subscriber.json"))

      stub_request(:get, %r{http://app.rule.io/api/v1/subscribers/1\?apikey=secret&identified_by=id})
        .to_return(status: 200, body: fixture("subscriber.json"))
    end

    def teardown
      RuleIo.api_key = nil
    end

    def test_all_returns_subscribers
      subscribers = Subscriber.all
      assert_kind_of Array, subscribers
      assert_equal 1, subscribers.length
      assert_kind_of Subscriber, subscribers.first
    end

    def test_attribuets
      subscribers = Subscriber.all
      assert_equal 1, subscribers.first.id
      assert_equal "foobar@example.com", subscribers.first.email
    end

    def test_tags
      subscribers = Subscriber.all
      assert_equal 1, subscribers.first.id
      assert_kind_of Array, subscribers.first.tags
      assert_equal 1, subscribers.first.tags.length
      assert_kind_of Tag, subscribers.first.tags.first
    end

    def test_find_without_params
      subscriber = Subscriber.find("foobar@example.com")
      assert_equal "foobar@example.com", subscriber.email
    end

    def test_find_without_params
      subscriber = Subscriber.find(1, identified_by: "id")
      assert_equal 1, subscriber.id
      assert_equal "foobar@example.com", subscriber.email
    end
  end
end
