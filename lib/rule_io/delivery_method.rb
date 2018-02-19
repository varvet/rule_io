require "base64"

module RuleIo
  class DeliveryMethod < Base
    attr_reader :mailer

    def initialize(_)
    end

    def settings
      { :return_response => false }
    end

    def deliver!(mail)
      from      = mail[:from].addresses.first
      to        = mail[:to].addresses

      response = self.class.post("transactionals", {
        transaction_type: "email",
        transaction_name: mail.subject,
        subject: mail.subject,
        from: {
          name: "Lärarförbundet",
          email: from
        },
        to: {
          email: to.first
        },
        content: {
          plain: Base64.strict_encode64(mail.text_part.decoded),
          html: Base64.strict_encode64(mail.html_part.decoded)
        }
      })
      response.body["transaction_id"]
    end
  end
end
