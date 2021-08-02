# frozen_string_literal: true

require 'net/http'

class WebhookService
  def call(message)
    Rails.logger.info "WebhookService - call - sending message"
    uri = URI.parse(ENV['WEBHOOK_URL'])
    # uri = URI.parse("https://webhook.site/1cbf6710-e6fe-4014-bb9a-e6c080f071f5")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.post(uri.request_uri, message)
    Rails.logger.info "WebhookService - call - done sending message"
  end
end