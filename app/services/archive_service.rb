# frozen_string_literal: true

class ArchiveService
  attr_reader :user, :archive

  def call(user, archive)
    subject = "Account Archive Status"
    if archive
      content = "Your account has been archived"
    else
      content = "Your account has been unarchived"
    end
    SendgridMailerJob.perform_later(user, content, subject)
    WebhookJob.perform_later(content)
  end
end