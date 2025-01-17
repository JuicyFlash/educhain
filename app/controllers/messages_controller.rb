class MessagesController < ApplicationController
  def index
    @messages = []
    @messages << Message.first
    @messages << Message.first
    @messages << Message.first
  end
end
