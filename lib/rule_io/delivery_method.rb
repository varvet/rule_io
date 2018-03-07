require "base64"

module RuleIo
  class DeliveryMethod < Base
    attr_reader :mailer

    def initialize(_); end

    def settings
      { return_response: false }
    end

    def deliver_later
      binding.pry
    end

    def deliver!(mail)
      binding.pry
      response = self.class.post("transactionals", mail_content(mail))
      response.body["transaction_id"]
    end

    def mail_content(mail)
      {
        transaction_type: "email",
        transaction_name: mail.subject,
        subject: mail.subject,
        from: {
          name: "Lärarförbundet",
          email: mail[:from].addresses.first
        },
        to: {
          email: mail[:to].addresses.first
        },
        content: multipart_content(mail)
      }
    end

    def multipart_content(mail)
      if mail.text_part.nil?
        return {
          plain: Base64.strict_encode64(mail.body.decoded),
          html: Base64.strict_encode64(mail.body.decoded)
        }
      end

      {
        plain: Base64.strict_encode64(mail.text_part.decoded),
        html: Base64.strict_encode64(mail.html_part.decoded)
      }
    end

    alias deliver_now deliver!
  end
end
