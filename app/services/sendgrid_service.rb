require "sendgrid-ruby"

class SendgridService
  include SendGrid

  attr_reader :sg

  def initialize
    @sg = SendGrid::API.new(api_key: ENV['SENDGRID_KEY'])
  end

  def deliver(receiver, content, subject)
    Rails.logger.info "SendgridService"
    to = Email.new(email: receiver)
    from = Email.new(email: "test@lekkercode.com")
    content = Content.new(type: "text/plain", value: content)

    mail = Mail.new(from, subject, to, content)

    begin
      response = sg.client.mail._("send").post(request_body: mail.to_json)
      p response
      Rails.logger.info "SendgridService - deliver - email sent. Response #{response}"
    rescue => e
      Rails.logger.error "SendgridService - error - Error #{e.message}"
    end
  end
end