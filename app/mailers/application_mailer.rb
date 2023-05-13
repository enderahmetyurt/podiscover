# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "info@podiscover.me"
  layout "mailer"
end
