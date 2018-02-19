module RuleIo
  class Railtie < Rails::Railtie
    initializer 'rule_io.add_delivery_method', before: 'action_mailer.set_configs' do
      ActionMailer::Base.add_delivery_method(:ruleio_actionmailer, RuleIo::DeliveryMethod)
    end
  end
end
