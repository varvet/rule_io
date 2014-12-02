require "virtus"
require "faraday"
require "faraday_middleware"
require "faraday/raise_http_exception"
require "rule_io/base"
require "rule_io/customization"
require "rule_io/subscriber"
require "rule_io/suppression"
require "rule_io/tag"
require "rule_io/error"
require "rule_io/version"
require "byebug"

module RuleIo
  @@api_key = nil

  def self.api_key
    @@api_key
  end

  def self.api_key=(value)
    @@api_key = value
  end
end
