require "virtus"
require "faraday"
require "faraday_middleware"
require "faraday/raise_http_exception"
require "rule_io/base"
require "rule_io/customization"
require "rule_io/subscriber"
require "rule_io/suppression"
require "rule_io/template"
require "rule_io/transactional"
require "rule_io/tag"
require "rule_io/error"
require "rule_io/version"
require "rule_io/delivery_method"
require "rule_io/railtie" if defined? Rails

module RuleIo
  @@api_key = nil
  @@base_url = "http://app.rule.io/api/v1"

  def self.api_key
    @@api_key
  end

  def self.api_key=(value)
    @@api_key = value
  end

  def self.base_url
    @@base_url
  end

  def self.base_url=(value)
    @@base_url = value
  end
end
