class Api::V1::MessagesController < ApplicationController
  before_action :set_channel

  def index
    messages = Message.where(channel: @channel)
    render json: messages
  end

  def create
    message = @channel.messages.build(content: params[:content])
    message.user = current_user
    message.save

    ChannelsChannel.broadcast_to(
      @channel.name,
      message.as_json
    )

    render json: message
  end

  private

  def set_channel
    @channel = Channel.find_by(name: params[:channel_id])
  end
end
