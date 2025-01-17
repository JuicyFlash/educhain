module Broadcast
  class Message
    def self.append(message:)
      new(message).append
    end

    def self.update(message:)
      new(message).update
    end

    def self.remove(message:)
      new(message).remove
    end

    def initialize(message)
      @message = message
    end

    def append
      Turbo::StreamsChannel.broadcast_append_to(
        :messages,
        target: "messages",
        html: rendered_component
      )
    end

    def update
      Turbo::StreamsChannel.broadcast_replace_to(
        :messages,
        target: "message-#{@message.id}",
        html: rendered_component)
    end

    def remove
      Turbo::StreamsChannel.broadcast_remove_to(
        :messages,
        target: "message-#{@message.id}")
    end

    private

    attr_reader :message

    def rendered_component
      ApplicationController.render(
        MessageComponent.new(message: message, broadcast: true),
        layout: false
      )
    end
  end
end
