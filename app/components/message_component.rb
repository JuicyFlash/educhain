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
end
