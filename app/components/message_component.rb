# frozen_string_literal: true

class MessageComponent < ViewComponent::Base
  def initialize(message:)
    @message = message
    @id = message.id
    @text = message.text
    @author = message.user
  end
end
