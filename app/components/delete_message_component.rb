# frozen_string_literal: true

class DeleteMessageComponent < ViewComponent::Base
  def initialize(message:)
    @message = message
  end

  def render?
    @message.user == Current.user
  end
end
