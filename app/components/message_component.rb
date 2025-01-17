# frozen_string_literal: true

class MessageComponent < ViewComponent::Base
  def initialize(message:, broadcast: false)
    @broadcast = broadcast
    @message = message
    @id = message.id
    @text = message.text
    @author = message.user
  end

  def before_render
    @current_user = Current.user
  end

  private

  def recent_message
    "recent" if @message.updated_at > 1.minute.ago
  end

  def from
    @message.user.email_address
  end

  def timestamp
    @message.updated_at.strftime("%Y-%m-%d at %H:%M")
  end
end
