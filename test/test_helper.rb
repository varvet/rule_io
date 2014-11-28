require "minitest/autorun"
require "webmock/minitest"
require "rule_io"

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + "/" + file)
end
