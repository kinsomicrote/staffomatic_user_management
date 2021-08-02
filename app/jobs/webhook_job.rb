# frozen_string_literal: true

class WebhookJob < ApplicationJob
  queue_as :default

  def perform(content)
    Rails.logger.info "WebhookJob sending webhook"
    WebhookService.new.call(content)
  end
end