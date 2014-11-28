module RuleIo
  class Error < StandardError; end

  # 400
  class BadRequest < Error; end

  # 401
  class NotAuthorized < Error; end

  # 404
  class NotFound < Error; end

  # 409
  class Conflict < Error; end

  # 500
  class InternalServerError < Error; end
end
