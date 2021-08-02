# frozen_string_literal: true

class SendgridMailerJob < ApplicationJob
  queue_as :default

  def perform(email, content, subject)
    Rails.logger.info "SendgridMailerJob sending email"
    SendgridService.new.deliver(email, content, subject)
  end
end