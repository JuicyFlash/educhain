class MessagesController < ApplicationController
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
    @message = Message.find_by(id: params[:id])
    if @message.user == Current.user
      @message.destroy
    end

    respond_to do |format|
      format.html { redirect_to messages_path }
      format.turbo_stream
    end
  end

  private

  def message_params
    params.require(:message).permit(:text)
  end
end
