# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'hi@momslearntocode.com'
  layout 'mailer'
end
