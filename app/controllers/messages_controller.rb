class MessagesController < ApplicationController
  before_action :find_message, only: %i[ edit update destroy ]
  def index
    @new_message = Message.new
    @messages = Message.all
  end

  def create
    @message = Current.user.messages.new(message_params)
    @message.save

  respond_to do |format|
    format.html { redirect_to messages_path }
    format.turbo_stream
  end
  end

  def destroy
    if @message.user == Current.user
      @message.destroy
    end

    respond_to do |format|
      format.html { redirect_to messages_path }
      format.turbo_stream
    end
  end

  def edit
    respond_to do |format|
      format.html { redirect_to messages_path }
      format.turbo_stream
    end
  end

  def update
    @updated = false
    if Current.user == @message.user
      @updated = @message.update(message_params)
    end
    respond_to do |format|
      format.html { redirect_to messages_path }
      format.turbo_stream
    end
  end

  private

  def find_message
    @message = Message.find_by(id: params[:id])
  end

  def message_params
    params.require(:message).permit(:text)
  end
end
