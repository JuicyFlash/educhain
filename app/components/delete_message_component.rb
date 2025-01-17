# frozen_string_literal: true

class DeleteMessageComponent < ViewComponent::Base
  def initialize(message:, broadcast: false)
    @broadcast = broadcast
    @message = message
  end

  def render?
    @message.user == Current.user && !@broadcast
  end
end
